package model.service.impl;

import model.bean.Customer;
import model.repository.Repository;
import model.repository.impl.CustomerRepository;
import model.service.IService;

import java.util.List;

public class CustomerIService implements IService<Customer> {

    Repository<Customer> customerRepository = new CustomerRepository();
    // chanh
    CustomerRepository customerRepository1 = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return this.customerRepository.findAll();
    }

    @Override
    public boolean save(Customer customer) {
        if (customer.getCustomer_name().matches("[A-Za-z ]+")) {
            return this.customerRepository.save(customer);
        }
        return false;
    }

    @Override
    public Customer findById(String id) {
        return customerRepository.findById(id);
    }

    @Override
    public void update(String id, Customer customer) {
        customerRepository.update(id , customer);
    }

    @Override
    public void remove(String id) {
        customerRepository.remove(id);
    }
    public List<Customer> search(String id, String phone, String email){
        return customerRepository1.search(id,phone,email);
    }
}
