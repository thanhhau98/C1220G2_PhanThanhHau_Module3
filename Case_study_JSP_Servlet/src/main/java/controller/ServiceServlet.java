package controller;

import model.bean.Customer;
import model.bean.Service;
import model.bean.TypeCustomer;
import model.service.IService;
import model.service.impl.CustomerIService;
import model.service.impl.ServiceIService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet",urlPatterns = "/services")
public class ServiceServlet extends HttpServlet {

    private IService<Service> serviceIService = new ServiceIService();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createService(request, response);
                break;
            case "edit":
                updateService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                break;
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        String service_id = request.getParameter("service_id");
        String service_name = request.getParameter("service_name");
        String service_area = request.getParameter("service_area");
        String service_cost = request.getParameter("service_cost");
        String service_max_people = request.getParameter("service_max_people");
        String rent_type_id = request.getParameter("rent_type_id");
        String service_type_id = request.getParameter("service_type_id");
        String standard_room = request.getParameter("standard_room");
        String description_other_convenience = request.getParameter("description_other_convenience");
        String poll_area = request.getParameter("poll_area");
        String number_of_floors = request.getParameter("number_of_floors");

        Service service = new Service( service_id ,service_name, service_area,service_cost, service_max_people,
                rent_type_id,service_type_id,standard_room,description_other_convenience,poll_area,number_of_floors);
        this.serviceIService.save(service);

        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        request.setAttribute("message", "New service was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
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
                searchService(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {

        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) {
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> services = this.serviceIService.findAll();

        request.setAttribute("services",services);

        RequestDispatcher dispatcher =request.getRequestDispatcher("service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
