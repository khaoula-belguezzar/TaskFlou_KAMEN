package entity;

import jakarta.persistence.*;
@Entity
public class Commentaire {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private  String contenu_cm;
    private String  date_cm;
    @ManyToOne(targetEntity = Tache.class)
    @JoinColumn(name = "tache_id")
    private Tache tache;
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    private User user;

    public Commentaire() {
    }
    public Commentaire(String contenu_cm, String date_cm) {
        this.contenu_cm = contenu_cm;
        this.date_cm = date_cm;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContenu_cm() {
        return contenu_cm;
    }

    public void setContenu_cm(String contenu_cm) {
        this.contenu_cm = contenu_cm;
    }

    public String getDate_cm() {
        return date_cm;
    }

    public void setDate_cm(String date_cm) {
        this.date_cm = date_cm;
    }

    public Tache getTache() {
        return tache;
    }

    public void setTache(Tache tache) {
        this.tache = tache;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
