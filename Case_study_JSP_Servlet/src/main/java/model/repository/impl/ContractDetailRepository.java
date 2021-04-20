package model.repository.impl;

import model.bean.ContractDetail;
import model.repository.Repository;

import java.util.List;

public class ContractDetailRepository implements Repository<ContractDetail> {
    @Override
    public List<ContractDetail> findAll() {
        return null;
    }

    @Override
    public boolean save(ContractDetail contractDetail) {
        return false;
    }

    @Override
    public ContractDetail findById(String id) {
        return null;
    }

    @Override
    public void update(String id, ContractDetail contractDetail) {

    }

    @Override
    public void remove(String id) {

    }
}
