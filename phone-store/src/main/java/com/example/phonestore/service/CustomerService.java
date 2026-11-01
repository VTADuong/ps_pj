package com.example.phonestore.service;

import com.example.phonestore.entity.Customer;
import com.example.phonestore.exception.ApiException;
import com.example.phonestore.repository.CustomerRepository;
import org.springframework.data.domain.*;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
    private final CustomerRepository repo;

    public CustomerService(CustomerRepository repo) { this.repo = repo; }

    public Page<Customer> list(int page, int size) {
        return repo.findAll(PageRequest.of(Math.max(page, 0), Math.max(size, 1), Sort.by("id").descending()));
    }

    public Customer create(Customer c) {
        c.setId(null);
        return repo.save(c);
    }

    public Customer update(Integer id, Customer in) {
        Customer c = repo.findById(id).orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, "Không tìm thấy khách hàng"));
        c.setName(in.getName());
        c.setPhone(in.getPhone());
        c.setEmail(in.getEmail());
        c.setAddress(in.getAddress());
        return repo.save(c);
    }

    public void delete(Integer id) {
        if (!repo.existsById(id)) throw new ApiException(HttpStatus.NOT_FOUND, "Không tìm thấy khách hàng");
        repo.deleteById(id);
        repo.flush();
    }
}
