package EntityManagers;
import Entities.*;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

public class AdminEntityManager {

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