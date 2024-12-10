package services;

import Dao.IProjectDao;
import Dao.ITaskDao;
import Dao.UserDao;
import entity.Project;
import entity.Tache;
import entity.User;
import jakarta.persistence.*;

import java.util.Collections;
import java.util.List;

public class ProjectDaoImpl implements IProjectDao {
    private EntityManager entityManager;
    private ITaskDao taskDao=new TacheDaoImpl();
    private UserDao userDao=new UserDaoImpl();
    public ProjectDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }

    @Override
    public List<Project> findAll() {
        Query query = entityManager.createQuery("select p from Project p");
        List<Project> projects = query.getResultList();
        return projects;
    }
    @Override
    public void save(Project p) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
            entityManager.persist(p);
            entityTransaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            entityTransaction.rollback();
        }
    }
    public void updateproject(Project project) {
        entityManager.getTransaction().begin();
        entityManager.merge(project);
        entityManager.getTransaction().commit();
    }
    @Override
    public void deleteById(Long id) {
        entityManager.getTransaction().begin();
        Project p =entityManager.find(Project.class,id);
        deleteTasksByProjectId(id);
        entityManager.remove(p);
        entityManager.getTransaction().commit();
    }
    @Override
    public Project findById(Long id) {
        Project p =entityManager.find(Project.class,id);
        return p;
    }
    // Suppression des tâches liées au projet
    public void deleteTasksByProjectId(Long projectId) {
        List<Tache> tasks = taskDao.findTasksByProjectId(projectId);
        for (Tache task : tasks) {
            taskDao.deleteById(task.getId());
        }
    }
    @Override
    public List<Project> findProjectsByUserId(Long userId) {
        // Récupérer l'utilisateur par son ID
        User user = userDao.findById(userId);
        if (user != null && user.getEquipeEnCharge() != null) {
            // Récupérer l'ID de l'équipe en charge de l'utilisateur
            Long equipeId = user.getEquipeEnCharge().getId();
            // Créer la requête pour récupérer les projets associés à cette équipe
            Query query = entityManager.createQuery("SELECT p FROM Project p WHERE p.equipeproject.id = :equipeId");
            query.setParameter("equipeId", equipeId);
            // Exécuter la requête et retourner la liste des projets
            return query.getResultList();
        } else {
            // Si l'utilisateur ou son équipe en charge est nul, retourner une liste vide
            return Collections.emptyList();
        }
    }


}
