package model.repository.impl;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements Repository<Customer> {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();

        try {
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * \n" +
                    "from customer;");

            Customer customer ;
            while(resultSet.next()) {
                customer = new Customer();
                customer.setCustomer_id(resultSet.getString("customer_id"));
                customer.setCustomer_type_id(resultSet.getString("customer_type_id"));
                customer.setCustomer_name(resultSet.getString("customer_name"));
                customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
                customer.setCustomer_gender(resultSet.getString("customer_gender"));
                customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                customer.setCustomer_phone(resultSet.getString("customer_phone"));
                customer.setCustomer_email(resultSet.getString("customer_email"));
                customer.setCustomer_address(resultSet.getString("customer_address"));

                customers.add(customer);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customers;
    }

    @Override
    public boolean save(Customer customer) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "insert into customer (customer_id,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)\n" +
                                    "values (?, ?, ?, ?, ?, ?, ?, ?, ?);"
                    );

            preparedStatement.setString(1, customer.getCustomer_id() );
            preparedStatement.setString(2, customer.getCustomer_type_id());
            preparedStatement.setString(3, customer.getCustomer_name());
            preparedStatement.setString(4, customer.getCustomer_birthday());
            preparedStatement.setBoolean(5, Boolean.parseBoolean(customer.getCustomer_gender()));
            preparedStatement.setString(6, customer.getCustomer_id_card());
            preparedStatement.setString(7, customer.getCustomer_phone());
            preparedStatement.setString(8, customer.getCustomer_email());
            preparedStatement.setString(9, customer.getCustomer_address());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer findById(String id) {

        Customer customer = new Customer();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select  * \n" +
                            "from customer \n" +
                            "where customer_id = ? ");

            preparedStatement.setString(1, id );

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                customer.setCustomer_id(resultSet.getString("customer_id"));
                customer.setCustomer_type_id(resultSet.getString("customer_type_id"));
                customer.setCustomer_name(resultSet.getString("customer_name"));
                customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
                customer.setCustomer_gender(resultSet.getString("customer_gender"));
                customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                customer.setCustomer_phone(resultSet.getString("customer_phone"));
                customer.setCustomer_email(resultSet.getString("customer_email"));
                customer.setCustomer_address(resultSet.getString("customer_address"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customer;
    }

    @Override
    public void update(String id, Customer customer) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "update customer\n" +
                                    "set customer_id =?,customer_type_id=?,customer_name=?,customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=?\n" +
                                    "where customer_id=?;"
                    );

            preparedStatement.setString(1, customer.getCustomer_id());
            preparedStatement.setString(2, customer.getCustomer_type_id());
            preparedStatement.setString(3, customer.getCustomer_name());
            preparedStatement.setString(4, customer.getCustomer_birthday());
            preparedStatement.setBoolean(5, Boolean.parseBoolean(customer.getCustomer_gender()));
            preparedStatement.setString(6, customer.getCustomer_id_card());
            preparedStatement.setString(7, customer.getCustomer_phone());
            preparedStatement.setString(8, customer.getCustomer_email());
            preparedStatement.setString(9, customer.getCustomer_address());
            preparedStatement.setString(10, id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void remove(String id) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "delete from customer \n" +
                                    "where customer_id = ?;\n"
                    );
            preparedStatement.setString(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    // chanh
    public List<Customer> search(String id, String phone, String email) {
        List<Customer> customers = new ArrayList<>();

        try {
            PreparedStatement statement = this.baseRepository.getConnection().prepareStatement("select * from customer\n" +
                    "where customer_id like ? and customer_phone like ? and customer_email like ?;");
            statement.setString(1,"%"+id+"%");
            statement.setString(2,"%"+phone+"%");
            statement.setString(3,"%"+email+"%");
            System.out.println(statement);
            ResultSet resultSet =statement.executeQuery();
            Customer customer;
            while(resultSet.next()) {
                customer = new Customer();
                customer.setCustomer_id(resultSet.getString("customer_id"));
                customer.setCustomer_type_id(resultSet.getString("customer_type_id"));
                customer.setCustomer_name(resultSet.getString("customer_name"));
                customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
                customer.setCustomer_gender(resultSet.getString("customer_gender"));
                customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                customer.setCustomer_phone(resultSet.getString("customer_phone"));
                customer.setCustomer_email(resultSet.getString("customer_email"));
                customer.setCustomer_address(resultSet.getString("customer_address"));

                customers.add(customer);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customers;
    }
}
