package Entities;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
@Table(name = "\"Employer\"")
@NamedQuery(name = "Employer.getAll",query = "select c from Employer c")
@NamedQuery(name = "Employer.getByLogin",query = "select c from Employer c WHERE login=:login")
public class Employer {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "\"id\"", nullable = false)
    private Integer id;


    @Column(name = "\"name\"", nullable = false)
    private String name;

    @Column(name = "\"birthday\"")
    private LocalDate birthday;


    @Column(name = "\"email\"", nullable = false)
    private String email;


    @Column(name = "\"login\"", nullable = false)
    private String login;


    @Column(name = "\"password\"", nullable = false)
    private String password;


    @Column(name = "\"phoneNumber\"", nullable = false)
    private String phoneNumber;


    @Column(name = "\"workPlace\"", nullable = false)
    private String workPlace;

    @Column(name = "\"photo\"")
    private byte[] photo;

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true)
    private Set<Vacancy> vacancySet;

    public Employer(){}

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getWorkPlace() {
        return workPlace;
    }

    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setVacancySet(Set<Vacancy> set){
        this.vacancySet = set;
    }

    public Set<Vacancy> getVacancySet(){
        return  vacancySet;
    }
}