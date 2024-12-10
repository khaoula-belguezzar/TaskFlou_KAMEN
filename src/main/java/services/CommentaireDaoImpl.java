package services;

import Dao.ICommentaireDao;
import entity.Commentaire;
import entity.Tache;
import entity.User;
import jakarta.persistence.*;
import jakarta.persistence.Query;

import java.util.List;

public class CommentaireDaoImpl  implements ICommentaireDao {
    private EntityManager entityManager;

    public CommentaireDaoImpl() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }

    @Override
    public void save(Commentaire commentaire) {
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        try {
            entityManager.persist(commentaire);
            entityTransaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            entityTransaction.rollback();
        }
    }

    @Override
    public List<Commentaire> findAll() {
        return List.of();
    }

    @Override
    public Commentaire findById(Long id) {

        return null;
    }

    @Override
    public void update(Commentaire u) {

    }

    @Override
    public void deleteById(Long id) {
        entityManager.getTransaction().begin();
        Commentaire commentaire =entityManager.find(Commentaire.class,id);
        entityManager.remove(commentaire);
        entityManager.getTransaction().commit();
    }
    public List<Commentaire> findCommentsByTaskId(Long taskId) {
        Query query = entityManager.createQuery("SELECT c FROM Commentaire c WHERE c.tache.id = :taskId");
        query.setParameter("taskId", taskId);
        List<Commentaire> commentaires = query.getResultList();
        return commentaires;
    }


}
