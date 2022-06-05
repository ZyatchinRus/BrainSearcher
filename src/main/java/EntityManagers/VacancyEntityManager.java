package EntityManagers;
import Entities.*;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

public class VacancyEntityManager {

    private ClassLoader classLoader = new ClassLoader();
    public EntityManager em = Persistence.createEntityManagerFactory("brainSearcher").createEntityManager();

    public void add(Vacancy vacancy){
        em.getTransaction().begin();
        em.merge(vacancy);
        em.getTransaction().commit();
    }

    public void delete(int id){
        em.getTransaction().begin();
        em.remove(get(id));
        em.getTransaction().commit();
    }

    public Vacancy get(int id){
        return em.find(Vacancy.class, id);
    }

    public void update(Vacancy vacancy){
        em.getTransaction().begin();
        em.merge(vacancy);
        em.getTransaction().commit();
    }

    public List<Vacancy> getAll(){
        TypedQuery<Vacancy> namedQuery = em.createNamedQuery("Vacancy.getAll", Vacancy.class);
        return namedQuery.getResultList();
    }

}
