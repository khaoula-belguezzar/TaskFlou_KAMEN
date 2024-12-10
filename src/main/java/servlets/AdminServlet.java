package servlets;
import Dao.IEquipeDao;
import Dao.IProjectDao;
import Dao.ITaskDao;
import Dao.UserDao;
import entity.Equipe;
import entity.Project;
import entity.Tache;
import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.EquipeDaoImpl;
import services.ProjectDaoImpl;
import services.TacheDaoImpl;
import services.UserDaoImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.*;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    public UserDao userDao ;
    public IEquipeDao equipeDao ;
    public ITaskDao taskDao;
    public IProjectDao projectDao;
    @Override
    public void init() throws ServletException {
        userDao=new UserDaoImpl();
        equipeDao= new EquipeDaoImpl();
        taskDao=new TacheDaoImpl();
        projectDao=new ProjectDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("profile");
            if (user != null) {
                request.setAttribute("nomuserconnecter", user);
            }
        }
        System.out.println("AdminServlet");
        //request.getRequestDispatcher("Home.jsp").forward(request,response);

        String action = request.getServletPath();
        String at = request.getParameter("action") != null ? request.getParameter("action") : "none";
        System.out.println(action);
        System.out.println("art=" +at);

        switch (at) {
            /*case "/AdminServlet":
                showDashboard(request, response);
                break;*/
            case "addGestionner":
                try {
                   addGestionner(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    System.out.println("delete swich");
                    deleteUser(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "enable":
                try {
                    System.out.println("enable swich");
                    enableUser(request, response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "profile":
                try {
                    System.out.println("profile swich");
                    profileAdmin(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "updateprofile":
                try {
                    System.out.println("updateprofile swich");
                    System.out.println(request.getParameter("phonenumber"));
                    updateprofile(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            case "listUsers":
                try {
                    listUsers(request,response);
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
            default:

                this.showDashboard(request,response);
                break;
        }

    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      /*  List<User> listUser = userDao.findAll();
        request.setAttribute("listUser", listUser);
        List<Project> ListProjet = ProjectDaoImpl.f;
        request.setAttribute("listUser", listUser);*/
        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
        List<User> gestionners = userDao.findGestionners();
        List<User> memberes = userDao.findUsers();
        List<Tache> taches =taskDao.findAll();
        List<Project> projects = projectDao.findAll();
        int allTaches = taches.size();
        int allProjects = projects.size();
        int allMemberes = memberes.size();
        int allGestionners = gestionners.size();
        request.setAttribute("allTaches", allTaches);
        request.setAttribute("allProjects", allProjects);
        request.setAttribute("allMemberes", allMemberes);
        request.setAttribute("allGestionners", allGestionners);

        List<Map<String, Object>> gestionnerDetails = new ArrayList<>();

        for (User gestionnaire : gestionners) {
            long projectCount = userDao.countProjectsByChefId(gestionnaire.getId());
            long tacheCount = userDao.countTachesByChefId(gestionnaire.getId());

            Map<String, Object> gestionnaireMap = new HashMap<>();
            gestionnaireMap.put("gestionnaire", gestionnaire);
            gestionnaireMap.put("projectCount", projectCount);
            gestionnaireMap.put("tacheCount", tacheCount);

            gestionnerDetails.add(gestionnaireMap);
        }

        request.setAttribute("gestionnerDetails", gestionnerDetails);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/listequipe.jsp");
        requestDispatcher.forward(request,response);
    }
    private void profileAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            // Récupérer l'objet User de la session
            User user = (User) session.getAttribute("profile");
            request.setAttribute("user", user);
            System.out.println(user.getFirstname());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/profileAdmin.jsp");
            requestDispatcher.forward(request,response);
        }else{
            response.sendRedirect("AdminServlet");
        }

    }

    private void addGestionner(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException, SQLException {
        String userIdParameter = request.getParameter("user_id");
        if(userIdParameter != null && !userIdParameter.isEmpty() && !userIdParameter.equals("none") ){
            Long id = Long.parseLong(userIdParameter);
            User user =userDao.findById(id);
            user.setEquipe(null);
            user.setRole("Gestionner");
            System.out.println("Gestionner");
            Equipe equipe = new Equipe("equipe"+id,user);
            equipeDao.save(equipe);
            user.setEquipeEnCharge(equipe);
//            LocalDate.now()
            System.out.println(user);
            userDao.update(user);
            response.sendRedirect("AdminServlet?action=listUsers");
        }else{
            String error = "Veuillez sélectionner un utilisateur.";
            request.setAttribute("error", error);
            listUsers(request, response);
        }

    }
    private void listUsers(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        System.out.println("list gestionner");
        List<User> listgestionners = userDao.findGestionners();
        List<User> allusers = userDao.findAll();
        List<User> users = userDao.findUsers();
        int allUsersCount = allusers.size();
        request.setAttribute("allUsersCount", allUsersCount);

        request.setAttribute("allusers", allusers);
        request.setAttribute("users", users);
        request.setAttribute("listgestionners", listgestionners);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Admin/listeUsers.jsp");
        requestDispatcher.forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       System.out.println("post");
        System.out.println(request.getParameter("user_id"));
        doGet(request, response); // Réutiliser la méthode doGet pour gérer les demandes POST
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        System.out.println("delete user "+id);
        userDao.deleteById(id);
        listUsers(request, response);
    }
    private void enableUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        System.out.println("enable function");
        userDao.enableUser(id);
        response.sendRedirect("AdminServlet?action=listUsers");
    }
    private void updateprofile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        profileAdmin(request, response);
    }
}
