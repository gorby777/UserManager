package application.dao;

import application.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    public SessionFactory sessionFactory;
    public static int frameRows = 7;
    public static int frameRowsByName = 3;
    public static int allRows = 0;
    public static int allRowsByName = 0;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        session.persist(user);
        session.getTransaction().commit();
        logger.info("User successfully saved. Book details: " + user);
        if (session.isOpen()) {
            session.close();
        }
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        logger.info("User successfully update. User details: " + user);
        if (session.isOpen()) {
            session.close();
        }
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        User user = (User) session.load(User.class, id);
        if(user !=null){
            session.delete(user);
        }
        session.getTransaction().commit();
        logger.info("User successfully removed. User details: " + user);
        if (session.isOpen()) {
            session.close();
        }
    }



    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        User user = (User) session.load(User.class, id);
        session.getTransaction().commit();
        logger.info("User successfully loaded. User details: " + user);
        if (session.isOpen()) {
            session.close();
        }
        return user;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers(int rows) {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        allRows = session.createQuery("from User").list().size();
        List<User> userList = session.createQuery("from User")
                .setFirstResult(rows)
                .setMaxResults(frameRows)
                .list();
        for(User user : userList){
            logger.info("User list: " + user);
        }
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
        return userList;
    }

    //Поиск записей по полю name
    @Override
    @SuppressWarnings("unchecked")
    public List<User> find(String name, int rows) {
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        String sql = String.format("from User where name='%s'",name);
        allRowsByName = session.createQuery(sql).list().size();
        List<User> userList = session.createQuery(sql)
                .setFirstResult(rows)
                .setMaxResults(frameRowsByName).list();
        for(User user : userList){
            logger.info("User list by Name: " + user);
        }
        session.getTransaction().commit();
        if (session.isOpen()) {
            session.close();
        }
        return userList;
    }
}
