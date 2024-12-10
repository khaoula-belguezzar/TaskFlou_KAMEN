package Dao;

import entity.Equipe;
import entity.User;

import java.util.List;

public interface IEquipeDao {
    public void save(Equipe e);

    public Equipe findById(Long id);

    public void update(Equipe e);

    public List<Equipe> findAll();

    public List<User> getAllMembers(Long equipeId);
}