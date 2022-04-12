package Entities;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "\"Employer\"")
@NamedQuery(name = "Employer.getAll",query = "select c from Employer c")
public class Employer {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "\"Id\"", nullable = false)
    private Integer id;


    @Column(name = "\"Name\"", nullable = false)
    private String name;

    @Column(name = "\"Birthday\"")
    private LocalDate birthday;


    @Column(name = "\"Email\"", nullable = false)
    private String email;


    @Column(name = "\"Login\"", nullable = false)
    private String login;


    @Column(name = "\"Password\"", nullable = false)
    private String password;


    @Column(name = "\"PhoneNumber\"", nullable = false)
    private String phoneNumber;


    @Column(name = "\"WorkPlace\"", nullable = false)
    private String workPlace;

    @Column(name = "\"Photo\"")
    private byte[] photo;

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
}