package Dao;



import entity.Project;
import entity.Tache;
import entity.User;

import java.util.List;

public interface ITaskDao {
    public void save(Tache t);

    public List<Tache> findAll();

    public void deleteById(Long id);

    public Tache findById(Long id);

    public List<Tache> findTasksByProjectId(Long projectId);
    public void update(Tache tache) ;
}