package app.entities;


import app.dao.UserDAOImpl;
import app.services.UserServiceImpl;
import app.servlets.LoginServlet;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "users", schema = "public")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_user")
    private int id;    //id
    @Column(name="firstname_user")
    private String firstName;  //имя
    @Column(name="secondname_user")
    private String secondName;  //фамилия
    @Column(name="login_user")
    private String login;    //логин
    @Column(name="password_user")
    private String password;  //пароль
    @Column(name="isadmin_user")
    private boolean isAdmin;  //админ/не админ


    public User() {
    }

    public User(String firstName, String secondName, String login, String password, boolean isAdmin){
        this.firstName = firstName;
        this.secondName = secondName;

        this.login = login;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getSecondName() {
        return secondName;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", secondName='" + secondName + '\'' +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", isAdmin=" + isAdmin +
                '}';
    }

    public HashMap<String, Boolean> checkLogin(User userIn){      //проверяем, возможна ли авторизация
        HashMap<String, Boolean> buf = new HashMap<>();
        UserServiceImpl userService = new UserServiceImpl();
        List<User> usersList = userService.findAllUsers();
        for (User user : usersList){
            if (userIn.getLogin().equals(user.getLogin()) && userIn.getPassword().equals(user.getPassword())){
                if (user.isAdmin()){
                    buf.put("isAdmin", true);
                    System.out.println("isAdminTrue");
                } else {
                    buf.put("isAdmin", false);
                    System.out.println("isAdmin False");
                }

                buf.put("canLogin", true);
                System.out.println("canlgoing true");
                return buf;
            }
        }
        System.out.println("canlogin False");
        System.out.println("isAdmin False");
        buf.put("canLogin", false);
        buf.put("isAdmin", false);
        return buf;
    }

    public User getUserByLoginAndPassword(User userIn){     //получаем пользователя по логину и паролю

        UserServiceImpl userService = new UserServiceImpl();
        List<User> usersList = userService.findAllUsers();
        for (User user : usersList){
            if (userIn.getLogin().equals(user.getLogin()) && userIn.getPassword().equals(user.getPassword())){
                return user;
            }
        }
        return null;
    }

    public boolean isLoginAvaiable(User userIn){   //проверяем доступно ли имя пользователя
        UserServiceImpl userService = new UserServiceImpl();
        List<User> usersList = userService.findAllUsers();
        for (User user : usersList){
            if (userIn.getLogin().equals(user.getLogin())){
                return false;
            }
        }
        return true;
    }




}
