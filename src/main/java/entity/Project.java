package entity;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id ;
    private String name;
    private String datep;
    @ManyToOne(targetEntity = Equipe.class)
    @JoinColumn(name = "equipeproject_id")
    private Equipe equipeproject;
    private String description;
    @OneToMany(mappedBy = "project", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Tache> taches= new ArrayList<Tache>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDatep() {
        return datep;
    }

    public void setDatep(String datep) {
        this.datep = datep;
    }

    public Project(String name, String datep, String description) {
        this.name = name;
        this.datep = datep;
        this.description = description;
    }

    public Project() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Equipe getEquipe() {
        return equipeproject;
    }

    public void setEquipe(Equipe equipe) {
        this.equipeproject = equipe;
    }
}
