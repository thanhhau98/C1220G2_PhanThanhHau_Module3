package model.repository.impl;

import model.bean.Customer;
import model.bean.TypeCustomer;
import model.repository.BaseRepository;
import model.repository.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TypeCustomerRepository implements Repository<TypeCustomer> {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<TypeCustomer> findAll() {
        List<TypeCustomer> typeCustomers = new ArrayList<>();

        try {
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select *\n" +
                    "from customer_type;");

            TypeCustomer typeCustomer ;
            while(resultSet.next()) {
                typeCustomer = new TypeCustomer();
                typeCustomer.setTypeCustomerId(resultSet.getString("customer_type_id"));
                typeCustomer.setTypeCustomerName(resultSet.getString("customer_type_name"));

                typeCustomers.add(typeCustomer);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return typeCustomers;
    }

    @Override
    public boolean save(TypeCustomer typeCustomer) {
        return false;
    }

    @Override
    public TypeCustomer findById(String id) {

        TypeCustomer typeCustomer = new TypeCustomer();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select  * \n" +
                            "from customer_type\n" +
                            "where id = ?");

            preparedStatement.setString(1, id );

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                typeCustomer.setTypeCustomerId(resultSet.getString("customer_type_id"));
                typeCustomer.setTypeCustomerName(resultSet.getString("customer_type_name"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return typeCustomer;
    }

    @Override
    public void update(String id, TypeCustomer typeCustomer) {

    }

    @Override
    public void remove(String id) {

    }
}
