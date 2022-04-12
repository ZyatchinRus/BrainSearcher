package EntityManagers;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;
import Entities.*;

public class EmployerEntityManager {
    public EntityManager em = Persistence.createEntityManagerFactory("brainSearcher").createEntityManager();

    public Employer add(Employer employer){
        em.getTransaction().begin();
        Employer employerFromDB = em.merge(employer);
        em.getTransaction().commit();
        return employerFromDB;
    }

    public void delete(int id){
        em.getTransaction().begin();
        em.remove(get(id));
        em.getTransaction().commit();
    }

    public Employer get(int id){
        return em.find(Employer.class, id);
    }

    public void update(Employer employer){
        em.getTransaction().begin();
        em.merge(employer);
        em.getTransaction().commit();
    }

    public List<Employer> getAll(){
        TypedQuery<Employer> namedQuery = em.createNamedQuery("Employer.getAll", Employer.class);
        return namedQuery.getResultList();
    }

}
