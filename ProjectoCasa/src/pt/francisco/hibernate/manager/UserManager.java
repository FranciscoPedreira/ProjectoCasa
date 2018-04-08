/**
 * 
 */
package pt.francisco.hibernate.manager;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import pt.francisco.hibernate.model.User;
import pt.francisco.hibernate.util.HibernateUtil;

import java.util.ArrayList;
import org.hibernate.Session;

/**
 * @author Francisco
 *
 */
public class UserManager {

    public static void main(String[] args) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        session.beginTransaction();
 
        //creation and persistence of objects to the database in hibernate
        /*User john = new User("john", "123");
        User bob = new User("bob", "456");
 
        System.out.println("Creating User: " + john.getUsername());
        session.persist(john);
        System.out.println("Creating User: " + bob.getUsername());
        session.persist(bob);*/
        
        /*fetching objects from the database in hibernate*/
 
        Query query = session.createQuery("from User");
        ArrayList<User> list = (ArrayList<User>) query.list();
        for(User u : list) {
        	System.out.println(u.getUsername() + " - " + u.getPassword());
        }
        
        session.getTransaction().commit();
        session.close();
    }
	
}
