package app.entities;

import app.services.UserServiceImpl;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "accounts", schema = "public")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_account")
    private int id;  //id
    @Column(name="number_account")
    private int number; //номер счета
    @Column(name="balance_account")
    private double balance;  //баланс счета
    @Column(name="ownersid_account")
    private int ownersId;  //id владельца
    @Column(name="isBlocked_account")
    private boolean isBlocked;  //заблокирован ли


    public Account() {
    }

    public Account(int number, double balance, int ownersId, boolean isBlocked) {
        this.number = number;
        this.balance = balance;
        this.ownersId = ownersId;
        this.isBlocked = isBlocked;
    }

    public int getId() {
        return id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public int getOwnersId() {
        return ownersId;
    }

    public void setOwnersId(int ownersId) {
        this.ownersId = ownersId;
    }

    public boolean isBlocked() {
        return isBlocked;
    }

    public void setBlocked(boolean blocked) {
        this.isBlocked = blocked;
    }

    @Override
    public String toString() {
        return "AccountDAO{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", balance='" + balance + '\'' +
                ", ownersId='" + ownersId + '\'' +
                ", isBlocked=" + isBlocked +
                '}';
    }




    public boolean isNumberAvaiable(Account accountIn){   //проверяем доступен ли номер счета
        UserServiceImpl userService = new UserServiceImpl();
        List<Account> accountsList = userService.findAllAccounts();
        for (Account account : accountsList){
            if (accountIn.getNumber()==(account.getNumber())){
                return false;
            }
        }
        return true;
    }

    public boolean isSuchIdPresent(int id){   //проверяем доступно ли имя пользователя
        UserServiceImpl userService = new UserServiceImpl();
        List<User> usersList = userService.findAllUsers();
        for (User user : usersList){
            if (id == user.getId()){
                return true;
            }
        }
        return false;
    }
}






