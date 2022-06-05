package Entities;

import javax.persistence.*;

@Entity
@NamedQuery(name = "Admin.getAll",query = "select c from Admin c")
@NamedQuery(name = "Admin.getByLogin",query = "select c from Admin c WHERE login=:login")
@Table(name = "\"Admin\"")
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "\"ID\"", nullable = false)
    private Integer id;



    @Column(name = "\"Name\"", nullable = false)
    private String name;


    @Column(name = "\"login\"", nullable = false)
    private String login;


    @Column(name = "\"Password\"", nullable = false)
    private String password;

    public Admin(){}
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