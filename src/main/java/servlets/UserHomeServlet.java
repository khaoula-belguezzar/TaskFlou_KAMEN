package servlets;
import Dao.ICommentaireDao;
import Dao.IEquipeDao;
import Dao.UserDao;
import Util.Status;
import entity.Commentaire;
import entity.Tache;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.CommentaireDaoImpl;
import services.EquipeDaoImpl;
import services.TacheDaoImpl;
import services.UserDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserHomeServlet", value = "/UserHomeServlet")
public class UserHomeServlet  extends HttpServlet  {
    public UserDao userDao ;
    public TacheDaoImpl taskDao;
    public ICommentaireDao iCommentaireDao;
    @Override
    public void init() throws ServletException {
        userDao=new UserDaoImpl();
        taskDao=new TacheDaoImpl();
        iCommentaireDao=new CommentaireDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("userhomeservlet");
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null) {
                request.setAttribute("nomuserconnecter", user);
            }
        }
        System.out.println("userhomeservlet");
        String action = request.getServletPath();
        String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
        System.out.println("A:"+at);
        switch (at) {
            case "updateStatusTache":
                System.out.println("updateStatusTache swich");
                updateStatusTache(request,response);
                break;
            case "listTache":
                try {
                    listTache(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "profileUser":
                try {
                    System.out.println("profile swich");
                    profileUser(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "updateprofileUser":
                try {
                    System.out.println("updateprofile swich");
                    System.out.println(request.getParameter("phonenumber"));
                    updateprofileUser(request,response);
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

                this.listTache(request, response);
                break;
        }
    }



    private void listTache(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");

            List<Tache> tacheList = user.getTaches();
// Créer trois listes pour chaque statut
            List<Tache> todoList = new ArrayList<>();
            List<Tache> inProgressList = new ArrayList<>();
            List<Tache> completedList = new ArrayList<>();

            // Parcourir la liste des tâches et les répartir en fonction de leur statut
            for (Tache tache : tacheList) {
                if (tache.getStatus() == Status.TODO) {
                    todoList.add(tache);
                } else if (tache.getStatus() == Status.IN_PROGRESS) {
                    inProgressList.add(tache);
                } else if (tache.getStatus() == Status.COMPLETED) {
                    completedList.add(tache);
                }
            }

            // Envoyer les listes appropriées à la vue
            request.setAttribute("todoList", todoList);
            request.setAttribute("inProgressList", inProgressList);
            request.setAttribute("completedList", completedList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/listTache.jsp");
            requestDispatcher.forward(request,response);


        }



    }
    private void updateStatusTache(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String status = request.getParameter("status");
        Tache tache = taskDao.findById(id);
        if (status.equals(Status.COMPLETED.toString())) {
            tache.setStatus(Status.COMPLETED);
        } else if (status.equals(Status.IN_PROGRESS.toString())) {
            tache.setStatus(Status.IN_PROGRESS);
        } else {
            tache.setStatus(Status.TODO);
        }
        taskDao.update(tache);
        // Mettre à jour la liste des tâches dans la session
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            List<Tache> tacheList = user.getTaches();
            for (Tache t : tacheList) {
                if (t.getId() == id) {
                    t.setStatus(tache.getStatus());
                    break;
                }
            }
            // Mettre à jour la session avec la nouvelle liste de tâches
            session.setAttribute("profile", user);
        }
        listTache(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    private void commentlist(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        List<Commentaire> commentaires =iCommentaireDao.findCommentsByTaskId(id);
        request.setAttribute("commentaires", commentaires);
        request.setAttribute("id", id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/comment.jsp");
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
    private void profileUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            request.setAttribute("user", user);
            System.out.println(user.getFirstname());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/profileUser.jsp");
            requestDispatcher.forward(request,response);
        }else{
            response.sendRedirect("UserHomeServlet");
        }

    }

    private void updateprofileUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        profileUser(request, response);
    }

    private void deletecommentaire(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        iCommentaireDao.deleteById(id);
        response.sendRedirect("UserHomeServlet");
    }
}
