package services;

import Dao.IEquipeDao;
import Dao.UserDao;
import entity.Equipe;
import entity.User;
import jakarta.persistence.*;

import java.util.List;

public class EquipeDaoImpl implements IEquipeDao {
    private EntityManager entityManager;
    private UserDao userDao;
    private IEquipeDao equipeDao;

    public EquipeDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }
    @Override
    public void update(Equipe e) {
        entityManager.getTransaction().begin();
        entityManager.merge(e);
        entityManager.getTransaction().commit();

    }
    @Override
    public List<Equipe> findAll() {
//        Query query1 =entityManager.createQuery("select u from User u where u.name like:x");
//        query1.setParameter("x","%"+mc+"%");
        Query query =entityManager.createQuery("select e from Equipe e,User u where u.role = :x");
        query.setParameter("x","User");
        //query.setParameter("x","Admin");
        return query.getResultList();
    }

    @Override
    public void save(Equipe equipe) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
            entityManager.persist(equipe);
            entityTransaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            entityTransaction.rollback();
        }
    }
    @Override
    public Equipe findById(Long id) {
        Equipe e =entityManager.find(Equipe.class,id);
        return e;
    }
    @Override
    public List<User> getAllMembers(Long equipeId) {
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.equipe.id = :equipeId AND u.role = :role AND u.role != :adminRole AND u.role != :gestionnerRole");
        query.setParameter("equipeId", equipeId);
        query.setParameter("role", "User");
        query.setParameter("adminRole", "Admin");
        query.setParameter("gestionnerRole", "Gestionner");
        List<User> members = query.getResultList();
        return members;
    }

    }

