package EntityManagers;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;
import Entities.*;
public class ClientEntityManager{

    private ClassLoader classLoader = new ClassLoader();
    public EntityManager em = Persistence.createEntityManagerFactory("brainSearcher").createEntityManager();

    public Client add(Client client){
        em.getTransaction().begin();
        Client clientFromDB = em.merge(client);
        em.getTransaction().commit();
        return clientFromDB;
    }

    public void delete(int id){
        em.getTransaction().begin();
        em.remove(get(id));
        em.getTransaction().commit();
    }
    public Client getByLogin(String login){
        TypedQuery namedQuery = em.createNamedQuery("Client.getByLogin",Client.class);
        namedQuery.setParameter("login",login);
        List<Client> client = namedQuery.getResultList();
        if(client.isEmpty())return null;
        return client.get(0);
    }
    public Client get(int id){
        return em.find(Client.class, id);
    }

    public void update(Client client){
        em.getTransaction().begin();
        em.merge(client);
        em.getTransaction().commit();
    }

    public List<Client> getAll(){
        TypedQuery<Client> namedQuery = em.createNamedQuery("Client.getAll", Client.class);
        return namedQuery.getResultList();
    }

}
