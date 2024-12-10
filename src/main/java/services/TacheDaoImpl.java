package services;

import Dao.ITaskDao;
import entity.Project;
import entity.Tache;
import entity.User;
import jakarta.persistence.*;

import java.util.List;

public class TacheDaoImpl implements ITaskDao {
    private EntityManager entityManager;
    public TacheDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }

    @Override
    public void save(Tache t) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
            entityManager.persist(t);
            entityTransaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            entityTransaction.rollback();
        }
    }

    @Override
    public void update(Tache tache) {
        entityManager.getTransaction().begin();
        entityManager.merge(tache);
        entityManager.getTransaction().commit();

    }
    @Override
    public List<Tache> findAll() {
        Query query = entityManager.createQuery("select t from Tache t");
        List<Tache> taches = query.getResultList();
//        for (Project project : projects) {
//            System.out.println("Project Name: " + project.getName());
//            System.out.println("Date Creation: " + project.getDatep());
//            System.out.println("Description: " + project.getDescription());
//        }
        return taches;
    }

    @Override
    public void deleteById(Long id) {
        entityManager.getTransaction().begin();
        Tache t =entityManager.find(Tache.class,id);
        entityManager.remove(t);
        entityManager.getTransaction().commit();
    }

    @Override
    public Tache findById(Long id) {
        Tache t =entityManager.find(Tache.class,id);
        return t;
    }
    public List<Tache> findTasksByProjectId(Long projectId) {
        Query query = entityManager.createQuery("SELECT t FROM Tache t WHERE t.project.id = :projectId");
        query.setParameter("projectId", projectId);
        List<Tache> tasks = query.getResultList();
        return tasks;
    }


    }