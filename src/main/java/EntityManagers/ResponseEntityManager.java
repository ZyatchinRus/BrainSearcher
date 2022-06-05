package EntityManagers;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;
import Entities.*;
public class ResponseEntityManager {

    private ClassLoader classLoader = new ClassLoader();
    public EntityManager em = Persistence.createEntityManagerFactory("brainSearcher").createEntityManager();

    public Response add(Response response){
        em.getTransaction().begin();
        Response responseFromDB = em.merge(response);
        em.getTransaction().commit();
        return responseFromDB;
    }

    public void delete(int id){
        em.getTransaction().begin();
        em.remove(get(id));
        em.getTransaction().commit();
    }

    public Response get(int id){
        return em.find(Response.class, id);
    }

    public void update(Response response){
        em.getTransaction().begin();
        em.merge(response);
        em.getTransaction().commit();
    }

    public List<Response> getAll(){
        TypedQuery<Response> namedQuery = em.createNamedQuery("Response.getAll", Response.class);
        return namedQuery.getResultList();
    }

}
