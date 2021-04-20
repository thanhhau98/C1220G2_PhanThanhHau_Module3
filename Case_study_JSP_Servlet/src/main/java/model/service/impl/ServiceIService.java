package model.service.impl;
import model.bean.Customer;
import model.bean.Service;
import model.repository.Repository;
import model.repository.impl.CustomerRepository;
import model.repository.impl.ServiceRepository;
import model.service.IService;

import java.util.List;

public class ServiceIService implements IService<Service> {

    Repository<Service> serviceRepository = new ServiceRepository();

    @Override
    public List<Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public boolean save(Service service) {
        return serviceRepository.save(service);
    }

    @Override
    public Service findById(String id) {
        return null;
    }

    @Override
    public void update(String id, Service service) {

    }

    @Override
    public void remove(String id) {

    }
}
