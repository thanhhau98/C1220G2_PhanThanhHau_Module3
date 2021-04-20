package model.bean;

public class TypeCustomer {
     private String TypeCustomerId;
     private String TypeCustomerName;

    public TypeCustomer() {
    }

    public TypeCustomer(String typeCustomerId, String typeCustomerName) {
        TypeCustomerId = typeCustomerId;
        TypeCustomerName = typeCustomerName;
    }

    public String getTypeCustomerId() {
        return TypeCustomerId;
    }

    public void setTypeCustomerId(String typeCustomerId) {
        TypeCustomerId = typeCustomerId;
    }

    public String getTypeCustomerName() {
        return TypeCustomerName;
    }

    public void setTypeCustomerName(String typeCustomerName) {
        TypeCustomerName = typeCustomerName;
    }
}
