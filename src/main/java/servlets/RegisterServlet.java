package servlets;
import Dao.UserDao;
import Exeptions.UserEmalExistsExeption;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.UserDaoImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet  extends HttpServlet {
    UserDao userDao;
    @Override
    public void init() throws ServletException {
        userDao=new UserDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // Converting Text To LocalDate
        String inputDate =request.getParameter("datebirth");

        // End

        String phonenumber = request.getParameter("phonenumber");
        String proffesion =  request.getParameter("proffesion");
        // Vérifier si tous les champs sont remplis
        if(!firstname.equals("")&&
                !lastname.equals("")&&!email.equals("")&&!password.equals("")&&
                !inputDate.equals("")&&!phonenumber.equals("")&&!proffesion.equals("")){
            DateTimeFormatter parser = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate datebirth = LocalDate.parse(inputDate, parser);
            // Vérifier si l'email est déjà utilisé
              User userExists = userDao.findbyEmail(email);
            if (userExists != null) {
                String erroremail = "Cet e-mail est déjà utilisé.";
                request.setAttribute("erroremail", erroremail);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {

            try {

                User user = new User(firstname,lastname,datebirth,phonenumber,proffesion,email,password,"User");
                userDao.save(user);
                response.sendRedirect("LoginServlet");
            }catch (UserEmalExistsExeption emalExistsExeption){
                request.setAttribute("error",emalExistsExeption.getMessage());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
                requestDispatcher.forward(request,response);

            }

                // Gérer les erreurs de champ vide
        }}else{

            // Gérer les erreurs de champ vide
            if (firstname.isEmpty()) {
                String errorfirstname = "Veuillez saisir votre prénom.";
                request.setAttribute("errorfirstname", errorfirstname);
            }
            if (lastname.isEmpty()) {
                String errorlastname = "Veuillez saisir votre nom de famille.";
                request.setAttribute("errorlastname", errorlastname);
            }
            if (email.isEmpty()) {
                String erroremail = "Veuillez saisir votre adresse e-mail.";
                request.setAttribute("erroremail", erroremail);
            }
            if (password.isEmpty()) {
                String errorpassword = "Veuillez saisir votre mot de passe.";
                request.setAttribute("errorpassword", errorpassword);
            }
            if (proffesion.isEmpty()) {
                String errorprofession = "Veuillez saisir votre profession.";
                request.setAttribute("errorprofession", errorprofession);
            }
            if (phonenumber.isEmpty()) {
                String errorphonenumber = "Veuillez saisir votre numéro de téléphone.";
                request.setAttribute("errorphonenumber", errorphonenumber);
            }
            if (inputDate.isEmpty()) {
                String errordatebirth = "Veuillez saisir votre date de naissance.";
                request.setAttribute("errordatebirth", errordatebirth);
            }

            // Rediriger vers la page d'inscription avec les messages d'erreur appropriés
            request.getRequestDispatcher("register.jsp").forward(request, response);

        }

    }
}
