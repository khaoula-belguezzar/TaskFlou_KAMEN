package Dao;

import entity.Equipe;
import entity.Project;

import java.util.List;

public interface IProjectDao {
    public void save(Project p);

    public List<Project> findAll();

    public void deleteById(Long id);

    public Project findById(Long id);

    public void deleteTasksByProjectId(Long projectId);
    public List<Project> findProjectsByUserId(Long userId);
}