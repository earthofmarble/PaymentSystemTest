package app.services;

import app.entities.Account;
import app.entities.User;

import java.util.List;

public interface UserService {
        //получаем всех пользователей
    List<User> findAllUsers();
    //получаем все счета
    List<Account> findAllAccounts();
    //получаем пользователя по id
    User getUserById(int id);
    //получаем все счета пользователя
    List<Account> getAccountsByUser(User user);
    //получаем определенный счет по id
    Account getAccountById(int id);
    //получаем определенный счет по номеру счета
    Account getAccountByNumber(int number);
    //сохраняем обновляем удаляем
    void save(User user);
    void update(User user);
    void delete(User user);

    void save(Account account);
    void update(Account account);
    void delete(Account account);
        // заблокировать счет и разблокировать счет
    void blockAccount(int accountId);
    void unlockAccount(int accountId);

}
