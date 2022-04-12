package Entities;

import javax.persistence.*;

@Entity
@NamedQuery(name = "Response.getAll",query = "select c from Response c")
@Table(name = "\"Response\"")
public class Response {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "\"Id\"", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "\"IdClient\"", nullable = false)
    private Client idClient;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "\"IdVacancy\"", nullable = false)
    private Vacancy idVacancy;


    @Column(name = "\"Status\"", nullable = false)
    private String status;

    public Response(){}
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Vacancy getIdVacancy() {
        return idVacancy;
    }

    public void setIdVacancy(Vacancy idVacancy) {
        this.idVacancy = idVacancy;
    }

    public Client getIdClient() {
        return idClient;
    }

    public void setIdClient(Client idClient) {
        this.idClient = idClient;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}