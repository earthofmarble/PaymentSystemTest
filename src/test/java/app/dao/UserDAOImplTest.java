package app.dao;

import app.entities.Account;
import app.entities.User;
import app.services.UserService;
import app.services.UserServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.*;

public class UserDAOImplTest {
    UserDAOImpl userDAO = new UserDAOImpl();

    private User user;
    private User user1;
    private User user2;

    private Account account;
    private Account account1;
    private Account account2;

    @Before
    public void setUp() throws Exception {
        user = new User("Женя", "Гончарик", "zhenya11", "qwerty12345", false);
        user1 = new User("Админ", "Админ", "admin", "root", true);
        user2 = new User("Вадим", "Денисик", "vadim222", "1", false);
        account = new Account(58426, 2.6, 2, false);
        account1 = new Account(96412, 5641.1, 2, false);
        account2 = new Account(12345, 14, 4, false);
    }

    @Test
    public void findAllUsers() {
       ArrayList<User> expected  = userDAO.findAllUsers();
       int actualSize = 3;
       assertEquals(expected.size(), actualSize);
    }

    @Test
    public void findAllAccounts() {
        ArrayList<Account> expected  = userDAO.findAllAccounts();
        int actualSize = 3;
        assertEquals(expected.size(), actualSize);
    }

    @Test
    public void getUserById() {
        User buf = userDAO.getUserById(10);
        Assert.assertEquals(buf.getLogin(), user.getLogin());
    }

    @Test
    public void getAccountById() {
        Account temp = userDAO.getAccountById(2);
        int actualNumber = 96412;
        Assert.assertEquals(temp.getNumber(), actualNumber);

    }

    @Test
    public void save() {
     //   userDAO.save(user);
    }

    @Test
    public void delete() {
     //   userDAO.delete(user);
    }

    @Test
    public void blockAccount() {
    //    userDAO.blockAccount(1);
    }
}
