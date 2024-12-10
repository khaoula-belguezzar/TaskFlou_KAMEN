package entity;

import Util.UserStatus;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaCrudExmeple {
    public static void main(String[] args) {

      JpaCrudExmeple.createRecord();
       //JpaCrudExmeple.retrieveRecord();
        //JpaCrudExmeple.updateRecord();
       // JpaCrudExmeple.deleteRecord();
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");

    }

    public static void createRecord(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
        EntityManager entityManager =emf.createEntityManager();
        entityManager.getTransaction().begin();
        User user= new User();
        user.setFirstname("Mohamed");
        user.setRole("Admin");
        user.setEmail("admin@gmail.com");
        user.setPassword("test12345");
        user.setUserStatus(UserStatus.ENABLED);
        entityManager.persist(user);
        entityManager.getTransaction().commit();
    }
    public static  void  retrieveRecord(){

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
        EntityManager entityManager =emf.createEntityManager();
        entityManager.getTransaction().begin();
        Long key = Long.valueOf(2);
        User u =entityManager.find(User.class,key);
        System.out.println(u.getFirstname());
        entityManager.getTransaction().commit();
    }
  public static  void updateRecord(){
      EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
      EntityManager entityManager =emf.createEntityManager();
      entityManager.getTransaction().begin();
      Long key = Long.valueOf(2);
      User u =entityManager.find(User.class,key);
      u.setFirstname("barkok");
      entityManager.getTransaction().commit();
  }
  public static void deleteRecord(){
      EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
      EntityManager entityManager =emf.createEntityManager();
      entityManager.getTransaction().begin();
      Long key = Long.valueOf(1);
      User u =entityManager.find(User.class,key);
      entityManager.remove(u);
      entityManager.getTransaction().commit();
  }

}