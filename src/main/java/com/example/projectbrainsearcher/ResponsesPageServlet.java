package com.example.projectbrainsearcher;

import Entities.Response;
import Entities.Vacancy;
import EntityManagers.VacancyEntityManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Base64;
import java.util.Iterator;
import java.util.Set;

import static java.lang.System.out;


public class ResponsesPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/Employer/otclick-form.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
