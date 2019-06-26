package app.dao;

import app.entities.Account;
import app.entities.Payment;
import app.servlets.UserServlet;
import app.utils.HibernateSessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class AccountDAOImpl implements AccountDAO {
    @Override
    public void addMoney(Account account, Double amount) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Double newBalance = account.getBalance()+amount;
        Query query = session.createQuery("update Account set balance = :balanceParam where id = :idParam");
        query.setParameter("balanceParam", newBalance);
        query.setParameter("idParam", account.getId());
        query.executeUpdate();
        tx1.commit();
        session.close();
    }

    @Override
     public void withdrawMoney(Account account, Double amount) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Double newBalance = account.getBalance()-amount;
        Query query = session.createQuery("update Account set balance = :balanceParam where id = :idParam");
        query.setParameter("balanceParam", newBalance);
        query.setParameter("idParam", account.getId());
        query.executeUpdate();
        tx1.commit();
        session.close();
    }

    @Override
    public void savePayment(double amount, int from, int to){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(new Payment(amount, from, to));
        tx1.commit();
        session.close();
    }

    @Override
    public List<Payment> getAllPaymentsByAccount(int accountNumber){
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From Payment where fromAccount = :paramName or toAccount  = :paramName");
        query.setParameter("paramName", accountNumber);
        List<Payment> list =(List<Payment>) query.list();
        session.close();
        return list;
    }


}
