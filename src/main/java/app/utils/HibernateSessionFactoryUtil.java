package app.utils;

import app.entities.Account;
import app.entities.Payment;
import app.entities.User;
import app.servlets.UserServlet;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactoryUtil {
    private static SessionFactory sessionFactory;
    final static org.apache.log4j.Logger logger = Logger.getLogger(UserServlet.class);
    private HibernateSessionFactoryUtil() {}

    public static SessionFactory getSessionFactory() {
        System.out.println("getSessionFactory");
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration().configure(); //зачитываем Hibernate.cfg.xml
                configuration.addAnnotatedClass(User.class);
                configuration.addAnnotatedClass(Account.class);
                configuration.addAnnotatedClass(Payment.class);
                StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());  // гет пропертиз - это параметры для работы гибернейта, указанные в файле Hibernate.cfg.xml
                sessionFactory = configuration.buildSessionFactory(builder.build());

            } catch (Exception e) {
                logger.error("Исключение! " + e);
            }
        }
        return sessionFactory;
    }
}