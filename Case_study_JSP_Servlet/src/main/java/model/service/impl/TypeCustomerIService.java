package model.service.impl;

import model.bean.TypeCustomer;
import model.repository.impl.TypeCustomerRepository;
import model.service.IService;

import java.util.List;

public class TypeCustomerIService implements IService<TypeCustomer> {

    TypeCustomerRepository typeCustomerRepository = new TypeCustomerRepository();

    @Override
    public List<TypeCustomer> findAll() {
        return typeCustomerRepository.findAll();
    }

    @Override
    public boolean save(TypeCustomer typeCustomer) {
        return false;
    }

    @Override
    public TypeCustomer findById(String id) {
        return typeCustomerRepository.findById(id);
    }

    @Override
    public void update(String id, TypeCustomer typeCustomer) {

    }

    @Override
    public void remove(String id) {

    }
}
