package services;

import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.*;
import Util.UserStatus;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
public class AuthService {
    EntityManager entityManager;
    public AuthService() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("test");
        entityManager=entityManagerFactory.createEntityManager();
    }

    public String auhenticate(String email , String password, HttpServletRequest request){
        try {
            Query query =entityManager.createQuery("select u from User u where u.email = :x and u.password = :y");
            query.setParameter("x",email);
            query.setParameter("y",password);
            User user = (User) query.getSingleResult();
            System.out.println(user.getFirstname());
            HttpSession session = request.getSession();
            if ((user!=null) && (user.getUserStatus()== UserStatus.ENABLED)){
                session.setAttribute("profile", user);
                if(user.getRole().equals("Admin")) {
                    return "Admin";
                } else if (user.getRole().equals("User")) {
                    return "User";
                }else if (user.getRole().equals("Gestionner")) {
                    return "Gestionner";
                }

            }else {
                return "votre compte a été bloqué";

            }

        }catch (NoResultException resultException){
            return "Invalid user credentials";
        }
        return email;
    }
}
