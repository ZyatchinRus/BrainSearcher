import Entities.*;
import EntityManagers.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

public class TestDB {
    public static void main(String [] args){
        System.out.println("Вторая контрольная точка:");
        Admin admin = new Admin();
        Client client = new Client();
        Employer employer = new Employer();
        Vacancy vacancy = new Vacancy();
        Vacancy vacancy2 = new Vacancy();
        Response response = new Response();
        Response response2 = new Response();
        AdminEntityManager adminEntityManager = new AdminEntityManager();
        ClientEntityManager clientEntityManager = new ClientEntityManager();
        EmployerEntityManager employerEntityManager = new EmployerEntityManager();
        VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();
        ResponseEntityManager responseEntityManager = new ResponseEntityManager();
        //добавление по одной сущности во все таблицы
/*
       //добавление админа
        admin.setName("Name");
        admin.setPassword("Password");
        admin.setLogin("Login");
        adminEntityManager.add(admin);


        //добавление пользователя
        client.setName("Ruslan");
        client.setDate(LocalDate.now());
        client.setEmail("Zyatchinr@mail.ru");
        client.setLogin("ZyatchinR");
        client.setPassword("zyatchinChort");
        client.setPhoneNumber("88005553535");
        client.setAdress("Samara");
        client.setAboutMe("ya programmist!!!!");
        client.setStudyPlace("SU");
        client.setPhoto(null);
        clientEntityManager.add(client);


        //добавление работодателя
        employer.setName("Ilya Gusev");
        employer.setBirthday(LocalDate.now());
        employer.setEmail("Ilya_SSS_Plus@bananaranga.ru");
        employer.setLogin("Ghoul");
        employer.setPassword("NeGhoul");
        employer.setPhoneNumber("8982383667765");
        employer.setWorkPlace("SU");
        employer.setPhoto(null);
        employerEntityManager.add(employer);

        List<Employer> employers = employerEntityManager.getAll();
        employer = employers.get(0);
        //добавление вакансии
        vacancy.setCategory("IT");
        vacancy.setName("IT super Proger");
        vacancy.setCompany("Bebra");
        vacancy.setIdEmployer(employer);
        vacancy.setDescription("I need SUPER PUPER PROGRAMMIST JAVA PLEASE!!!!!!");
        vacancy.setSalary(15);
        vacancy.setWorkSchedule("25 на 8");
        vacancy.setStatus("На рассмотрении");
        vacancyEntityManager.add(vacancy);

        vacancy2.setCategory("Сельское Хозяйство");
        vacancy2.setName("Фермер");
        vacancy2.setCompany("ООО Колос");
        vacancy2.setIdEmployer(employer);
        vacancy2.setDescription("Копать поля");
        vacancy2.setSalary(150000);
        vacancy2.setWorkSchedule("5 на 2");
        vacancy2.setStatus("На рассмотрении");
        vacancyEntityManager.add(vacancy2);

        List<Client> clientList = clientEntityManager.getAll();
        client = clientEntityManager.get(clientList.get(0).getId());

        //добавление отклика
        List<Vacancy> vacancies = vacancyEntityManager.getAll();
        vacancy = vacancies.get(0);

       response.setIdClient(client);
        response.setIdVacancy(vacancy);
        response.setStatus("На рассмотрении");
        responseEntityManager.add(response);

        response2.setIdClient(client);
        response2.setIdVacancy(vacancy);
        response2.setStatus("Отклонён");
        responseEntityManager.add(response2);
*/
/*
        //Изменение сущностей
        List<Admin> adminList = adminEntityManager.getAll();
        admin = adminEntityManager.get(adminList.get(0).getId());
        admin.setName("NewAdministrator");
        adminEntityManager.update(admin);

        List<Client> clientList = clientEntityManager.getAll();
        client = clientEntityManager.get(clientList.get(0).getId());
        client.setEmail("Email.email.com");
        clientEntityManager.update(client);

        List<Employer> employerList = employerEntityManager.getAll();
        employer = employerEntityManager.get(employerList.get(0).getId());
        employer.setPhoneNumber("8983767228");
        employerEntityManager.update(employer);

        List<Vacancy> vacancyList = vacancyEntityManager.getAll();
        vacancy = vacancyEntityManager.get(vacancyList.get(0).getId());
        vacancy.setStatus("Одобрена");
        vacancyEntityManager.update(vacancy);

        List<Response> responseList = responseEntityManager.getAll();
        response = responseEntityManager.get(responseList.get(0).getId());
        response.setStatus("Принято");
        responseEntityManager.update(response);*/
/*
        //каскадное удаление сущностей
        List<Admin> adminList = adminEntityManager.getAll();
        adminEntityManager.delete(adminList.get(0).getId());

        List<Client> clientList = clientEntityManager.getAll();
        clientEntityManager.delete(clientList.get(0).getId());

        List<Employer> employerList = employerEntityManager.getAll();
        employerEntityManager.delete(employerList.get(0).getId());
        */
        List<Response> responses = responseEntityManager.getAll();
        response = responses.get(0);
        client= response.getIdClient();
        System.out.println(client.getId().toString() + " "+ client.getName()+" "+client.getEmail());
    }
}
