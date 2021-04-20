package model.repository.impl;

import model.bean.Service;
import model.repository.BaseRepository;
import model.repository.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements Repository<Service> {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Service> findAll() {
        List<Service> services = new ArrayList<>();

        try {
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * \n" +
                    "from service;");

            Service service ;
            while(resultSet.next()) {
                service = new Service();
                service.setService_id(resultSet.getString("service_id"));
                service.setService_name(resultSet.getString("service_name"));
                service.setService_area(resultSet.getString("service_area"));
                service.setService_cost(resultSet.getString("service_cost"));
                service.setService_max_prople(resultSet.getString("service_max_people"));
                service.setRent_type_id(resultSet.getString("rent_type_id"));
                service.setService_type_id(resultSet.getString("service_type_id"));
                service.setStandard_room(resultSet.getString("standard_room"));
                service.setDescription_other_convenience(resultSet.getString("description_other_convenience"));
                service.setPoll_area(resultSet.getString("poll_area"));
                service.setNumber_of_floors(resultSet.getString("number_of_floors"));

                services.add(service);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return services;
    }

    @Override
    public boolean save(Service service) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "insert into service (service_id,service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,description_other_convenience,poll_area,number_of_floors)\n" +
                                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
                    );

            preparedStatement.setString(1, service.getService_id() );
            preparedStatement.setString(2, service.getService_name());
            preparedStatement.setString(3, service.getService_area());
            preparedStatement.setString(4, service.getService_cost());
            preparedStatement.setString(5, service.getService_max_people());
            preparedStatement.setString(6, service.getRent_type_id());
            preparedStatement.setString(7, service.getService_type_id());
            preparedStatement.setString(8, service.getStandard_room());
            preparedStatement.setString(9, service.getDescription_other_convenience());
            preparedStatement.setString(10, service.getPoll_area());
            preparedStatement.setString(11, service.getNumber_of_floors());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
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
