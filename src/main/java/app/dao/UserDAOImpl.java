package app.dao;

import app.entities.Account;
import app.entities.User;
import app.utils.HibernateSessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    @Override
    public ArrayList<User> findAllUsers() {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        ArrayList<User> users = (ArrayList<User>) session.createQuery("From User").list();
        session.close();
        return users;
    }

    @Override
    public ArrayList<Account> findAllAccounts() {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        ArrayList<Account> accounts = (ArrayList<Account>) session.createQuery("From Account").list();
        session.close();
        return accounts;
    }

    @Override
    public User getUserById(int id) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        User user = session.get(User.class, id);
        session.close();
        return user;
    }

    @Override
    public List<Account> getAccountsByUser(User user) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From Account where ownersId = :paramName");
        query.setParameter("paramName", user.getId());
        List<Account> list =(List<Account>) query.list();
        session.close();
        return list;
    }

    @Override
    public Account getAccountById(int id) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Account account = session.get(Account.class, id);
        session.close();
        return account;
    }
    @Override
    public Account getAccountByNumber(int number) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From Account where number = :paramName");
        query.setParameter("paramName", number);
        List<Account> list =(List<Account>) query.list();
        session.close();
        if (list==null || list.size()==0){
            return null;
        } else
        return list.get(0);
    }

    @Override
    public void save(User user) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(user);
        tx1.commit();
        session.close();
    }

    @Override
    public void update(User user) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(user);
        tx1.commit();
        session.close();
    }

    @Override
    public void delete(User user) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.delete(user);
        tx1.commit();
        session.close();
    }

    @Override
    public void save(Account account) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();

        session.save(account);
        tx1.commit();
        session.close();
    }

    @Override
    public void update(Account account) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(account);
        tx1.commit();
        session.close();
    }

    @Override
    public void delete(Account account) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.delete(account);
        tx1.commit();
        session.close();
    }

    @Override
    public void blockAccount(int accountId) {
//        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
//        Query query = session.createQuery("update Account set isBlocked= :isBlockedParam where id = :paramId");
//        query.setParameter("isBlockedParam", true);
//        query.setParameter("paramId", accountId);
//        query.executeUpdate();
//        session.close();
        Account account = getAccountById(accountId);
        account.setBlocked(true);
        System.err.println("SET BLOCKED");
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(account);
        tx1.commit();
        session.close();

    }

    @Override
    public void unlockAccount(int accountId) {
        Session session =  HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Query query = session.createQuery("update Account set isBlocked= :isBlockedParam where id = :paramId");
        query.setParameter("isBlockedParam", false);
        query.setParameter("paramId", accountId);
        query.executeUpdate();
        session.close();
    }
}
