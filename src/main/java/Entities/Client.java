package Entities;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
@NamedQuery(name = "Client.getAll",query = "select c from Client c")
@NamedQuery(name = "Client.getByLogin",query = "select c from Client c WHERE login=:login")
@Table(name = "\"Client\"")
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "\"id\"", nullable = false)
    private Integer id;


    @Column(name = "\"name\"", nullable = false)
    private String name;

    @Column(name = "\"date\"")
    private LocalDate date;


    @Column(name = "\"email\"", nullable = false)
    private String email;


    @Column(name = "\"login\"", nullable = false)
    private String login;


    @Column(name = "\"password\"", nullable = false)
    private String password;


    @Column(name = "\"phoneNumber\"")
    private String phoneNumber;


    @Column(name = "\"adress\"")
    private String adress;


    @Column(name = "\"aboutMe\"")
    private String aboutMe;


    @Column(name = "\"studyPlace\"")
    private String studyPlace;

    @Column(name = "\"photo\"")
    private byte[] photo;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Response> responseSet;

    public void setResponseSet(Set<Response> set){
        this.responseSet = set;
    }

    public Set<Response> getResponseSet(){
        return  responseSet;
    }

    public Client(){}

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getStudyPlace() {
        return studyPlace;
    }

    public void setStudyPlace(String studyPlace) {
        this.studyPlace = studyPlace;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
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

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
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