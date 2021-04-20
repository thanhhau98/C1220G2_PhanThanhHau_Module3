package model.service;

import java.util.List;

public interface IService<E> {

    List<E> findAll();

    boolean save(E e);

    E findById(String id);

    void update(String id, E e);

    void remove(String id);
}
