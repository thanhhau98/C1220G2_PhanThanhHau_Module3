package controller;

import model.bean.Customer;
import model.bean.TypeCustomer;
import model.service.IService;
import model.service.impl.CustomerIService;
import model.service.impl.TypeCustomerIService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet" , urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {

    private IService<Customer> customerIService = new CustomerIService();
    private IService<TypeCustomer> typeCustomerIService = new TypeCustomerIService();
    private CustomerIService customerIService1 = new CustomerIService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                break;
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customer_id = request.getParameter("customer_id");
        String customer_type_id = request.getParameter("customer_type_id");
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        String customer_gender = request.getParameter("customer_gender");
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");

        Customer customer = new Customer( customer_id ,customer_type_id, customer_name,customer_birthday, customer_gender,customer_id_card,customer_phone,customer_email,customer_address);
        this.customerIService.save(customer);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        request.setAttribute("message", "New customer was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customer_id = request.getParameter("customer_id");
        String customer_type_id = request.getParameter("customer_type_id");
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        String customer_gender = request.getParameter("customer_gender");
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = this.customerIService.findById(customer_id);
        RequestDispatcher dispatcher;
        if(customer == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            customer.setCustomer_id(customer_id);
            customer.setCustomer_type_id(customer_type_id);
            customer.setCustomer_name(customer_name);
            customer.setCustomer_birthday(customer_birthday);
            customer.setCustomer_gender(customer_gender);
            customer.setCustomer_id_card(customer_id_card);
            customer.setCustomer_phone(customer_phone);
            customer.setCustomer_email(customer_email);
            customer.setCustomer_address(customer_address);
            this.customerIService.update(customer_id, customer);
            request.setAttribute("customer", customer);
            request.setAttribute("message", "Customer information was updated");

            List<TypeCustomer> typeCustomers = typeCustomerIService.findAll();

            request.setAttribute("typeCustomers", typeCustomers);
            dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {


        String id = request.getParameter("id");
        Customer customer = this.customerIService.findById(id);
        RequestDispatcher dispatcher;
        if(customer == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.customerIService.remove(id);
            List<TypeCustomer> typeCustomers = typeCustomerIService.findAll();

            request.setAttribute("typeCustomers",typeCustomers);
            List<Customer> customers = this.customerIService.findAll();
            request.setAttribute("customers",customers);
            dispatcher =request.getRequestDispatcher("customer/list.jsp");
            request.setAttribute("message", "Customer was deleted");
        }

        try {
            dispatcher.forward(request, response);
            response.sendRedirect("/customers");
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {

        List<TypeCustomer> typeCustomers = typeCustomerIService.findAll();

        request.setAttribute("typeCustomers", typeCustomers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");

        List<TypeCustomer> typeCustomers = typeCustomerIService.findAll();

        Customer customer = this.customerIService.findById(id);
        RequestDispatcher dispatcher;
        if(customer == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("typeCustomers", typeCustomers);
            dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        Customer customer = this.customerIService.findById(id);
        RequestDispatcher dispatcher;
        if(customer == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("customer/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {

        List<TypeCustomer> typeCustomers = typeCustomerIService.findAll();

        request.setAttribute("typeCustomers",typeCustomers);

        String id = request.getParameter("search");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        List<Customer> customers=new ArrayList<>();
        customers= this.customerIService1.search(id,phone,email);
        request.setAttribute("customers",customers);
        RequestDispatcher dispatcher =request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {

        List<TypeCustomer> typeCustomers = typeCustomerIService.findAll();

        request.setAttribute("typeCustomers",typeCustomers);

        List<Customer> customers = this.customerIService.findAll();

        request.setAttribute("customers",customers);



        RequestDispatcher dispatcher =request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
