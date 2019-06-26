package app.services;

import app.dao.UserDAOImpl;
import app.entities.Account;
import app.entities.User;

import java.util.List;

public class UserServiceImpl implements UserService {
   public UserDAOImpl userDAO = new UserDAOImpl();

    public UserServiceImpl() {}
    @Override
    public List<User> findAllUsers() {
       return userDAO.findAllUsers();
    }

    @Override
    public List<Account> findAllAccounts() {
        return userDAO.findAllAccounts();
    }

    @Override
    public User getUserById(int id) {
        return userDAO.getUserById(id);
    }

    @Override
    public List<Account> getAccountsByUser(User user) {
        return userDAO.getAccountsByUser(user);
    }

    @Override
    public Account getAccountById(int id) {
        return userDAO.getAccountById(id);
    }

    @Override
    public Account getAccountByNumber(int number) {
        return userDAO.getAccountByNumber(number);
    }

    @Override
    public void save(User user) {
        userDAO.save(user);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public void delete(User user) {
        userDAO.delete(user);
    }

    @Override
    public void save(Account account) {
        userDAO.save(account);
    }

    @Override
    public void update(Account account) {
        userDAO.update(account);
    }

    @Override
    public void delete(Account account) {
        userDAO.delete(account);
    }

    @Override
    public void blockAccount(int accountId) {
        userDAO.blockAccount(accountId);
    }

    @Override
    public void unlockAccount(int accountId) {
        userDAO.unlockAccount(accountId);
    }
}
