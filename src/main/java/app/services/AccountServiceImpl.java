package app.services;

import app.dao.AccountDAOImpl;
import app.entities.Account;
import app.entities.Payment;

import java.util.List;

public class AccountServiceImpl implements AccountService{

    AccountDAOImpl accountDAO = new AccountDAOImpl();

    @Override
    public void addMoney(Account account, Double amount) {
        accountDAO.addMoney(account, amount);
    }

    @Override
    public void withdrawMoney(Account account, Double amount) {
        accountDAO.withdrawMoney(account, amount);
    }

    @Override
    public void savePayment(double amount, int from, int to) {
        accountDAO.savePayment(amount, from, to);
    }
    @Override
   public List<Payment> getAllPaymentsByAccount(int accountNumber){
       return accountDAO.getAllPaymentsByAccount(accountNumber);
    }
}
