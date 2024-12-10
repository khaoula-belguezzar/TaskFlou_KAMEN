package services;

import Dao.UserDao;
import Util.UserStatus;
import entity.Equipe;
import entity.User;
import jakarta.persistence.*;
import jakarta.transaction.Transactional;

import java.util.List;

public class UserDaoImpl implements UserDao {
    private EntityManager entityManager;

    public UserDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
         entityManager=entityManagerFactory.createEntityManager();
    }

    @Override
    public void save(User user) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
           entityManager.persist(user);
           entityTransaction.commit();
        }catch (Exception e){
          e.printStackTrace();
          entityTransaction.rollback();
        }
    }

    @Override
    public List<User> findAll() {
//        Query query1 =entityManager.createQuery("select u from User u where u.name like:x");
//        query1.setParameter("x","%"+mc+"%");
        Query query =entityManager.createQuery("select u from User u where u.role != :x");
        query.setParameter("x","Admin");
        return query.getResultList();
    }
    public List<User> findGestionners(){
        Query query =entityManager.createQuery("select u from User u where u.role = :x");
        query.setParameter("x","Gestionner");
        return query.getResultList();
    }
    public long countProjectsByChefId(Long chefId) {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(p) FROM Project p WHERE p.equipeproject.chefEquipe.id = :chefId", Long.class);
        query.setParameter("chefId", chefId);
        return query.getSingleResult();
    }

    public long countTachesByChefId(Long chefId) {
        TypedQuery<Long> query = entityManager.createQuery(
                "SELECT COUNT(t) FROM Tache t WHERE t.membreEquipe.equipe.chefEquipe.id = :chefId", Long.class);
        query.setParameter("chefId", chefId);
        return query.getSingleResult();
    }
    public User findbyEmail(String email){
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email");
        query.setParameter("email", email);
        try {
            return (User) query.getSingleResult();
        } catch (NoResultException e) {
            return null; // Aucun utilisateur trouvé avec cet e-mail
        }
    }
    public List<User> findUsers(){
        Query query =entityManager.createQuery("select u from User u where u.role = :x");
        query.setParameter("x","User");
        return query.getResultList();
    }
    public List<User> findUsersNotMembres() {
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.equipe IS NULL AND u.role = :role");
        query.setParameter("role", "User");
        return query.getResultList();
    }

    @Override
    public User findById(Long id) {
          User u =entityManager.find(User.class,id);
        return u;
    }
    @Override
    public List<User> findMembresEquipe(Equipe equipe) {
        Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.equipe = :equipe and u.role = :x ");
        query.setParameter("equipe", equipe);
        query.setParameter("x","User");
        return query.getResultList();
    }



    @Override
    public void update(User u) {
        entityManager.getTransaction().begin();
        entityManager.merge(u);
        entityManager.getTransaction().commit();

    }

    @Override
    public void deleteById(Long id) {
        entityManager.getTransaction().begin();
       User u =entityManager.find(User.class,id);
       entityManager.remove(u);
        entityManager.getTransaction().commit();
    }
    @Override
    public void enableUser(Long id) {
        entityManager.getTransaction().begin();
        User u =entityManager.find(User.class,id);
        if (u.getUserStatus()== UserStatus.ENABLED){
            u.setUserStatus(UserStatus.DISABLED);
        }else{
            u.setUserStatus(UserStatus.ENABLED);
        }
        entityManager.getTransaction().commit();
    }

    public void updateEquipe(Equipe equipe) {
        entityManager.getTransaction().begin();
        entityManager.merge(equipe);
        entityManager.getTransaction().commit();
    }

}
