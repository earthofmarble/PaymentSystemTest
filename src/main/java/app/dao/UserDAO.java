package app.dao;

import app.entities.Account;
import app.entities.User;


import java.util.List;

interface UserDAO {
  List<User> findAllUsers();
  List<Account> findAllAccounts();
  User getUserById(int id);
  List getAccountsByUser(User user);
  Account getAccountById(int id);
  Account getAccountByNumber(int number);
  void save(User user);
  void update(User user);
  void delete(User user);

  void save(Account account);
  void update(Account account);
  void delete(Account account);

  void blockAccount(int accountId);
  void unlockAccount(int accountId);
}
