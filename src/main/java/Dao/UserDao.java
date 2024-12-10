package Dao;

import entity.Equipe;
import entity.User;

import java.util.List;

public interface UserDao {
    public void save(User u);
    public List<User> findAll();
    public User findById(Long id);
    public void update(User u) ;
    public void deleteById(Long id);
    public void enableUser(Long id);
    public List<User> findGestionners();
    public List<User> findUsers();
    public User findbyEmail(String email);
    public void updateEquipe(Equipe equipe);
    public List<User> findMembresEquipe(Equipe equipe);
    public List<User> findUsersNotMembres();
   public  long countProjectsByChefId(Long id);

   public  long countTachesByChefId(Long id);
}
