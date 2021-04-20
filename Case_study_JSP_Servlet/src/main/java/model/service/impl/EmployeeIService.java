package model.service.impl;

import model.bean.Employee;
import model.service.IService;

import java.util.List;

public class EmployeeIService implements IService<Employee> {
    @Override
    public List<Employee> findAll() {
        return null;
    }

    @Override
    public boolean save(Employee employee) {
        return false;
    }

    @Override
    public Employee findById(String id) {
        return null;
    }

    @Override
    public void update(String id, Employee employee) {

    }

    @Override
    public void remove(String id) {

    }

}
