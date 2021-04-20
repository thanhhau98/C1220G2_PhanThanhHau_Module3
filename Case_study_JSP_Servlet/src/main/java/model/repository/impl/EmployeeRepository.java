package model.repository.impl;

import model.bean.Employee;
import model.repository.Repository;

import java.util.List;

public class EmployeeRepository implements Repository<Employee> {

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
