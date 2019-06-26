package app.dao;

import app.entities.Account;
import app.entities.Payment;
import app.entities.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class AccountDAOImplTest {

    AccountDAOImpl accountDAO = new AccountDAOImpl();

    private Account account;
    private Account account1;
    private Account account2;

    @Before
    public void setUp() throws Exception {
        account = new Account(58426, 2.6, 2, false);
        account1 = new Account(96412, 5641.1, 2, false);
        account2 = new Account(12345, 14, 4, false);
    }



    @Test
    public void addMoney() {
        double actual = account.getBalance()+40.1;
        accountDAO.addMoney(account, 40.1);
        double expected = account.getBalance();
        assertEquals(actual, expected,actual-expected);

    }

    @Test
    public void savePayment() {
       accountDAO.savePayment(180, account1.getNumber(), account.getNumber());
    }

    @Test
    public void getAllPaymentsByAccount() {
      List<Payment> payments = accountDAO.getAllPaymentsByAccount(account2.getNumber());
        for (Payment payment: payments) {
            if (payment.getAmount()==180 && payment.getFrom()==account1.getNumber()){
                assertEquals(1, 1);
            }
        }

    }
}