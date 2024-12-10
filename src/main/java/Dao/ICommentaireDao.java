package Dao;

import entity.Commentaire;
import entity.Tache;
import entity.User;

import java.util.List;

public interface ICommentaireDao {
    public void save(Commentaire commentaire);
    public List<Commentaire> findAll();
    public Commentaire findById(Long id);
    public void update(Commentaire u) ;
    public void deleteById(Long id);
    public List<Commentaire> findCommentsByTaskId(Long taskId);
}
