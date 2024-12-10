package entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Equipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id ;
    private String name;
    @OneToMany(mappedBy = "equipe", orphanRemoval = true)
    private List<User> userList = new ArrayList<>();
    @OneToMany(mappedBy = "equipeproject", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Project> projectList = new ArrayList<>();
//    @OneToOne
//    @JoinColumn(name = "chef_equipe_id")
//    private User chefEquipe;
@OneToOne
private User chefEquipe;
    public Equipe(String name, User chefEquipe) {

        this.name = name;
        this.chefEquipe = chefEquipe;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Equipe() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }
    public User getChefEquipe() {
        return chefEquipe;
    }

    public void setChefEquipe(User chefEquipe) {
        this.chefEquipe = chefEquipe;
    }

    @Override
    public String toString() {
        return "Equipe{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userList=" + userList +
                ", projectList=" + projectList +
                ", chefEquipe=" + chefEquipe +
                '}';
    }

    public void ajouterUtilisateur(User utilisateur) {
        userList.add(utilisateur);
        utilisateur.setEquipe(this);
    }
    public void retirerUtilisateur(User user) {
        System.out.println("Bonjour");
        for (User u : userList) {
            if (u.getId().equals(user.getId())) {
                System.out.println("Utilisateur à retirer trouvé dans l'équipe.");
                userList.remove(u);
                user.setEquipe(null); // Mettre à jour l'équipe de l'utilisateur
                return;
            }
        }
        System.out.println("L'utilisateur à retirer n'est pas présent dans l'équipe.");
    }

    @PreRemove
    private void removeChefEquipe() {
        if (chefEquipe != null) {
            chefEquipe.setEquipeEnCharge(null);
        }
    }

}
