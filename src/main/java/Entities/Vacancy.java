package Entities;

import javax.persistence.*;

@Entity
@Table(name = "\"Vacancy\"")
@NamedQuery(name = "Vacancy.getAll",query = "select c from Vacancy c")
public class Vacancy {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "\"Id\"", nullable = false)
    private Integer id;


    @Column(name = "\"Category\"", nullable = false)
    private String category;


    @Column(name = "\"Name\"", nullable = false)
    private String name;


    @Column(name = "\"Company\"", nullable = false)
    private String company;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "\"IdEmployer\"", nullable = false)
    private Employer idEmployer;


    @Column(name = "\"Description\"")
    private String description;

    @Column(name = "\"Salary\"")
    private Integer salary;


    @Column(name = "\"WorkSchedule\"")
    private String workSchedule;


    @Column(name = "\"Status\"", nullable = false)
    private String status;

    public Vacancy(){}
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWorkSchedule() {
        return workSchedule;
    }

    public void setWorkSchedule(String workSchedule) {
        this.workSchedule = workSchedule;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Employer getIdEmployer() {
        return idEmployer;
    }

    public void setIdEmployer(Employer idEmployer) {
        this.idEmployer = idEmployer;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}