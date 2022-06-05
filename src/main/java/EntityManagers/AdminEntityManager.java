package EntityManagers;
import Entities.*;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class AdminEntityManager {


    private ClassLoader classLoader = new ClassLoader();
    public EntityManager em = Persistence.createEntityManagerFactory("brainSearcher").createEntityManager();

    public Admin add(Admin admin){
        em.getTransaction().begin();
        Admin adminFromDB = em.merge(admin);
        em.getTransaction().commit();
        return adminFromDB;
    }

    public void delete(int id){
        em.getTransaction().begin();
        em.remove(get(id));
        em.getTransaction().commit();
    }
    public Admin getByLogin(String login){

        TypedQuery namedQuery = em.createNamedQuery("Admin.getByLogin",Admin.class);
        namedQuery.setParameter("login",login);
        List<Admin> admin = namedQuery.getResultList();
        if(admin.isEmpty())return null;
        return admin.get(0);
    }

    public Admin get(int id){
        return em.find(Admin.class, id);
    }

    public void update(Admin admin){
        em.getTransaction().begin();
        em.merge(admin);
        em.getTransaction().commit();
    }

    public List<Admin> getAll(){
        TypedQuery<Admin> namedQuery = em.createNamedQuery("Admin.getAll", Admin.class);
        return namedQuery.getResultList();
    }

}