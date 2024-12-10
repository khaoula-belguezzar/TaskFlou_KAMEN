
package servlets;
import Dao.*;
import Exeptions.UserEmalExistsExeption;
import Util.Priority;
import Util.Status;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.*;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "GestionnerHomeServlet", value = "/GestionnerHomeServlet")
public class GestionnerHomeServlet extends HttpServlet {
    IProjectDao projectDao;
    IEquipeDao equipeDao;
    UserDao userDao;
    ITaskDao taskDao;
    public ICommentaireDao iCommentaireDao;

    @Override
    public void init() throws ServletException {
        projectDao = new ProjectDaoImpl();
        userDao = new UserDaoImpl();
        equipeDao=new EquipeDaoImpl();
        taskDao=new TacheDaoImpl();
        iCommentaireDao=new CommentaireDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GestionnerHomeServlet");
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null) {
                request.setAttribute("nomuserconnecter", user);
            }
        }
        // Génération de la date actuelle
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateaffectation = currentDate.format(formatter);
        request.setAttribute("dateaffectation", dateaffectation);
        String action = request.getServletPath();
        String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
        System.out.println(action);
        System.out.println("art=" + at);

        switch (at) {
            case "addProject":
                try {
                    System.out.println("add project");
                    addProject(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    System.out.println("delete swich");
                    delete(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "deletetache":
                try {
                    System.out.println("delete swich");
                    deletetache(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "listProjet":
                try {
                    listProjet(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "addMemberToTeam":
                try {
                    addMemberToTeam(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "addTask":
                try {
                    addTask(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "listTache":
                try {
                    listTache(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "listequipe":
                try {
                    listequipe(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "profileGestionner":
                try {
                    profileGestionner(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "profileshow":
                try {
                    System.out.println("profile swich");
                    profileshow(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "removeMemberFromTeam":
                try {
                    System.out.println("member remove swich");
                    removeMemberFromTeam(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "commentlist":
                try {
                    System.out.println("commentlist swich");
                    commentlist(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "addcommentaire":
                try {
                    System.out.println("addcommentaire swich");
                    addcommentaire(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "deletecommentaire":
                try {
                    System.out.println("deletecommentaire swich");
                    deletecommentaire(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            default:

                this.showDashboard(request, response);
                break;
        }

    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'utilisateur connecté
            User connectedUser = (User) session.getAttribute("profile");
            if (connectedUser != null) {
                // Récupérer l'ID du gestionnaire connecté
                Long userId = connectedUser.getId();
                System.out.println(userId);
                // Récupérer la liste des projets associés à ce gestionnaire
                List<Project> listProject = projectDao.findProjectsByUserId(userId);
                // Mettre les projets dans la requête pour les afficher dans la JSP
                request.setAttribute("listProject", listProject);
                System.out.println("listProject=" + listProject);
                int allprojectsCount = listProject.size();
                request.setAttribute("allprojectsCount", allprojectsCount);
                // Rediriger vers la page JSP pour afficher les projets
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listProjet.jsp");
                requestDispatcher.forward(request, response);
            } else {
                System.out.println("Utilisateur non trouvé dans la session.");

            }
        } else {
            System.out.println("Session non trouvée.");
        }
    }

    private void listequipe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null && user.getEquipeEnCharge() != null) {
                Equipe equipe = user.getEquipeEnCharge();
                List<User> membresEquipe = userDao.findMembresEquipe(equipe);
                request.setAttribute("membresEquipe", membresEquipe);
                List<User> allUsers = userDao.findUsersNotMembres();
                request.setAttribute("allUsers", allUsers);
                int AllMember = membresEquipe.size();
                request.setAttribute("AllMember", AllMember);

                request.setAttribute("allUsers", allUsers);
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listequipe.jsp");
        requestDispatcher.forward(request, response);
    }

                //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listequipe.jsp");
                requestDispatcher.forward(request, response);
            }

        }


    private void addProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        System.out.println("add project");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String datep = currentDate.format(formatter);
        request.setAttribute("datep", datep);

        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null && user.getEquipeEnCharge() != null) {
                Equipe equipe = user.getEquipeEnCharge();

                try {
                    Project project = new Project(name, datep, description);
                    project.setEquipe(equipe); // Associer l'équipe du gestionnaire au projet
                    projectDao.save(project);
                    response.sendRedirect("GestionnerHomeServlet");
                } catch (UserEmalExistsExeption emalExistsExeption) {
                    request.setAttribute("error", emalExistsExeption.getMessage());
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("listProjet.jsp");
                    requestDispatcher.forward(request, response);
                }
            } else {
                System.out.println("L'utilisateur n'est pas associé à une équipe ou n'est pas un gestionnaire.");
                // Gérer le cas où l'utilisateur n'est pas associé à une équipe ou n'est pas un gestionnaire
            }
        } else {
            System.out.println("Session non trouvée.");
            // Gérer le cas où la session n'est pas trouvée
        }
    }


    private void listProjet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'utilisateur connecté
            User connectedUser = (User) session.getAttribute("profile");
            if (connectedUser != null) {
                // Récupérer l'ID du gestionnaire connecté
                Long userId = connectedUser.getId();
                // Récupérer la liste des projets associés à ce gestionnaire
                List<Project> userProjects = projectDao.findProjectsByUserId(userId);
                // Mettre les projets dans la requête pour les afficher dans la JSP
                request.setAttribute("userProjects", userProjects);
                // Rediriger vers la page JSP pour afficher les projets
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listProjet.jsp");
                requestDispatcher.forward(request, response);
            } else {
                System.out.println("Utilisateur non trouvé dans la session.");

            }
        } else {
            System.out.println("Session non trouvée.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("post");
        doGet(request, response); // Réutiliser la méthode doGet pour gérer les demandes POST
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        projectDao.deleteById(id);
        response.sendRedirect("GestionnerHomeServlet");
    }
    private void deletetache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        System.out.println("delete id "+id);
        taskDao.deleteById(id);
        listTache(request, response);
    }

    private void addMemberToTeam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("user");
        HttpSession session = request.getSession(false);
        System.out.println("userId=" + userId);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");

            // Vérifier si l'utilisateur existe dans la session et s'il appartient à une équipe
            if (user != null && user.getEquipeEnCharge() != null) {
                // Récupérer l'ID de l'équipe du gestionnaire connecté
                Long equipeId = user.getEquipeEnCharge().getId();
                System.out.println("equipeId=" + equipeId);

                try {
                    if (userId != null && !userId.isEmpty()) {
                        Long id = Long.parseLong(userId);
                        User selectedUser = userDao.findById(id);
                        Equipe equipe = equipeDao.findById(equipeId);
                        if (selectedUser != null && equipe != null) {
                            equipe.ajouterUtilisateur(selectedUser);
                            userDao.updateEquipe(equipe); // Mettre à jour l'équipe
                        }
                    } else {
                        System.out.println("userId vide");
                    }
                    response.sendRedirect("GestionnerHomeServlet?action=listequipe"); // Redirection vers la liste
                } catch (NumberFormatException e) {
                    System.out.println("Format de l'ID de l'utilisateur invalide : " + e.getMessage());
                    e.printStackTrace();
                } catch (Exception e) {
                    // Gérer les autres erreurs
                    e.printStackTrace();
                }
            } else {
                System.out.println("Utilisateur ou équipe non trouvés");
            }
        } else {
            System.out.println("Session non trouvée");
        }
    }





    public void ajouterUtilisateurALaEquipe(User gestionnaire, User utilisateur) {
        Equipe equipeDuGestionnaire = gestionnaire.getEquipeEnCharge();

        if (equipeDuGestionnaire != null) {
            equipeDuGestionnaire.ajouterUtilisateur(utilisateur);
            userDao.updateEquipe(equipeDuGestionnaire); // userDao est une instance de UserDaoImpl injectée ou initialisée
        } else {
            System.out.println("Le gestionnaire n'est associé à aucune équipe.");
        }
    }
    private void addTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdStr = request.getParameter("projectId");
        String titretache = request.getParameter("titretache");
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateaffectation = currentDate.format(formatter);
        request.setAttribute("dateaffectation", dateaffectation);
        String inputDate =request.getParameter("deadline");
        DateTimeFormatter parser = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate deadline = LocalDate.parse(inputDate, parser);
        Status status = Status.TODO;
        Priority priority =Priority.valueOf(request.getParameter("priority"));
        String membreEquipeIdStr = request.getParameter("membreEquipeId"); // Obtenir l'ID du membre de l'équipe depuis la requête

        if (projectIdStr != null && !projectIdStr.isEmpty() && titretache != null && !titretache.isEmpty() && membreEquipeIdStr != null && !membreEquipeIdStr.isEmpty()) {
            try {
                Long projectId = Long.parseLong(projectIdStr);
                Long membreEquipeId = Long.parseLong(membreEquipeIdStr); // Convertir l'ID du membre de l'équipe en Long

                // Récupérer le projet et le membre de l'équipe à partir de leur ID
                Project project = projectDao.findById(projectId);
                User membreEquipe = userDao.findById(membreEquipeId);

                if (project != null && membreEquipe != null) {
                    Tache task = new Tache(titretache,dateaffectation,deadline,priority,status);
                    task.setProject(project);
                    task.setMembreEquipe(membreEquipe);
                    taskDao.save(task);
                    response.sendRedirect("GestionnerHomeServlet?action=listTache"); // Redirection vers la liste
                }
            } catch (NumberFormatException e) {
                // Gérer les erreurs de conversion des ID en nombre
            } catch (Exception e) {
                // Gérer les autres exceptions
            }
        } else {
            String error = "Veuillez remplir tout les champs";
            request.setAttribute("error", error);
            listTache(request, response);
        }
    }

    private void listTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'utilisateur connecté
            User user = (User) session.getAttribute("profile");
            if (user != null && user.getEquipeEnCharge() != null) {
                // Récupérer l'équipe du gestionnaire connecté
                Equipe equipe = user.getEquipeEnCharge();
                System.out.println("equipeId=" + equipe.getId());
                // Récupérer les projets de l'équipe
                List<Project> projects = projectDao.findProjectsByUserId(user.getId());
                System.out.println("projects=" + projects);
                // Passer la liste des projets comme un attribut de requête
                request.setAttribute("projects", projects);

                // Récupérer la liste des membres de l'équipe
                List<User> membresEquipe = userDao.findMembresEquipe(equipe);
                // Stocker la liste des membres de l'équipe comme un attribut de la requête
                request.setAttribute("membresEquipe", membresEquipe);

                // Liste pour stocker toutes les tâches
                List<Tache> alltache = new ArrayList<>();

                // Parcourir les projets de l'équipe
                for (Project project : projects) {
                    // Récupérer les tâches du projet
                    List<Tache> tasks = taskDao.findTasksByProjectId(project.getId());
                    // Ajouter les tâches à la liste globale
                    alltache.addAll(tasks);
                }

                // Passer la liste des tâches comme un attribut de requête
                request.setAttribute("alltache", alltache);
                int allTachesCount = alltache.size();
                request.setAttribute("allTachesCount", allTachesCount);
            }
        }

        // Redirection vers la JSP pour afficher les tâches
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/listTache.jsp");
        requestDispatcher.forward(request, response);
    }

    private void profileGestionner(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            String phonenumber = request.getParameter("phonenumber");
            String profession = request.getParameter("profession");
            String current_password = request.getParameter("current_password");
            String password_confirmation = request.getParameter("password_confirmation");
            String password = request.getParameter("password");

            if (phonenumber != null && profession != null && current_password != null && password_confirmation != null && password != null &&
                    !phonenumber.isEmpty() && !profession.isEmpty() && !current_password.isEmpty() && !password_confirmation.isEmpty() && !password.isEmpty()) {
                if (!user.getPassword().equals(current_password)) {
                    String erroremailcurrent = "Le mot de passe actuel est incorrect.";
                    request.setAttribute("erroremailcurrent", erroremailcurrent);
                } else if (!password.equals(password_confirmation)) {
                    String erroremailconfir = "Les mots de passe n'est pas identique .";
                    request.setAttribute("erroremailconfir", erroremailconfir);
                } else {
                    user.setPassword(password);
                    user.setProfession(profession);
                    user.setPhoneNumber(phonenumber);
                    userDao.update(user);
                }
            } else {
                String error = "Veuillez remplir tous les champs.";
                request.setAttribute("error", error);
            }
        } else {
            String error = "Session introuvable.";
            request.setAttribute("error", error);
        }
        profileshow(request, response);
    }
    private void profileshow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            request.setAttribute("user", user);
            System.out.println(user.getFirstname());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/profileGestionner.jsp");
            requestDispatcher.forward(request,response);
        }else{
            response.sendRedirect("GestionnerHomeServlet");
        }

    }
    private void removeMemberFromTeam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        System.out.println(userId);
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'utilisateur connecté
            User connectedUser = (User) session.getAttribute("profile");
            if (connectedUser != null && connectedUser.getEquipeEnCharge() != null) {
                // Récupérer l'ID de l'équipe du gestionnaire connecté
                Long equipeId = connectedUser.getEquipeEnCharge().getId();
                try {
                    if (userId != null && !userId.isEmpty()) {
                        Long id = Long.parseLong(userId);
                        User userToRemove = userDao.findById(id);
                        if (userToRemove != null) {
                            // Retirer l'utilisateur de l'équipe
                            Equipe equipe = equipeDao.findById(equipeId);
                            System.out.println("rrttyyuuiioo");
                            if (equipe != null) {
                                System.out.println("bonsoir");
                                equipe.retirerUtilisateur(userToRemove);
                                userDao.updateEquipe(equipe); // Mettre à jour l'équipe
                            }
                        }
                    } else {
                        System.out.println("L'ID de l'utilisateur est vide");
                    }
                    listequipe(request, response);// Redirection vers la liste
                } catch (NumberFormatException e) {
                    System.out.println("Format de l'ID de l'utilisateur invalide : " + e.getMessage());
                    e.printStackTrace();
                } catch (Exception e) {
                    // Gérer les autres erreurs
                    e.printStackTrace();
                }
            } else {
                System.out.println("Utilisateur ou équipe non trouvés");
            }
        } else {
            System.out.println("Session non trouvée");
        }
    }

    private void commentlist(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        List<Commentaire> commentaires =iCommentaireDao.findCommentsByTaskId(id);
        request.setAttribute("commentaires", commentaires);
        request.setAttribute("id", id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Gestionner/comment.jsp");
        requestDispatcher.forward(request,response);
    }
    private void addcommentaire(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            String comment = request.getParameter("comment");
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String datep = currentDate.format(formatter);
            System.out.println("after date");
            Commentaire commentaire=new Commentaire(comment,datep);
            System.out.println("avent id");
            Long id = Long.parseLong(request.getParameter("id"));
            System.out.println("after id");
            Tache tache = taskDao.findById(id);
            commentaire.setTache(tache);
            commentaire.setUser(user);
            iCommentaireDao.save(commentaire);
            commentlist(request, response);
        }


    }
    private void deletecommentaire(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        iCommentaireDao.deleteById(id);
        listTache(request, response);
    }

}

