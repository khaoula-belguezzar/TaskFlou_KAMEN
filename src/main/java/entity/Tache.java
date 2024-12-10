package entity;

import Util.Priority;
import Util.Status;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Tache {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String titretache;
    private String dateaffectation;
    @Temporal(TemporalType.DATE)
    private LocalDate deadline;
    @Column(columnDefinition = "ENUM('LOW','HEIGH','MEDIUM','CRITICAL')")
    @Enumerated(EnumType.STRING)
    private Priority priority;
    @Column(columnDefinition = "ENUM('TODO','IN_PROGRESS','COMPLETED')")
    @Enumerated(EnumType.STRING)
    private Status status;
    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "projet_id")
    private Project project;
    @ManyToOne
    @JoinColumn(name = "membre_equipe_id")
    private User membreEquipe;
    @OneToMany(mappedBy = "tache", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Commentaire> commentaires = new ArrayList<>();



    public User getMembreEquipe() {
        return membreEquipe;
    }

    public void setMembreEquipe(User membreEquipe) {
        this.membreEquipe = membreEquipe;
    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Tache() {
    }

    public Tache(String titretache, String dateaffectation, LocalDate deadline, Priority priority, Status status) {
        this.titretache = titretache;
        this.dateaffectation = dateaffectation;
        this.deadline = deadline;
        this.priority = priority;
        this.status = status;
    }

    public String getTitretache() {
        return titretache;
    }

    public void setTitretache(String titretache) {
        this.titretache = titretache;
    }

    public String getDateaffectation() {
        return dateaffectation;
    }

    public void setDateaffectation(String dateaffectation) {
        this.dateaffectation = dateaffectation;
    }

    public LocalDate getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDate deadline) {
        this.deadline = deadline;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
