package com.example.phonestore.service;

import com.example.phonestore.dto.LoginRequest;
import com.example.phonestore.dto.RegisterRequest;
import com.example.phonestore.entity.Admin;
import com.example.phonestore.exception.ApiException;
import com.example.phonestore.repository.AdminRepository;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    private final AdminRepository repo;
    private final PasswordEncoder encoder;

    public AuthService(AdminRepository repo, PasswordEncoder encoder) {
        this.repo = repo;
        this.encoder = encoder;
    }

    public void register(RegisterRequest r) {
        if (repo.existsByUsername(r.username()))
            throw new ApiException(HttpStatus.CONFLICT, "Username đã tồn tại");
        Admin a = new Admin();
        a.setUsername(r.username());
        a.setPassword(encoder.encode(r.password()));
        repo.save(a);
    }

    public Admin login(LoginRequest r) {
        Admin a = repo.findByUsername(r.username())
                .orElseThrow(() -> new ApiException(HttpStatus.UNAUTHORIZED, "Sai username hoặc password"));
        boolean matches = false;
        try {
            matches = encoder.matches(r.password(), a.getPassword());
        } catch (Exception ignored) {}
        if (!matches && r.password().equals(a.getPassword())) {
            matches = true;
        }
        if (!matches)
            throw new ApiException(HttpStatus.UNAUTHORIZED, "Sai username hoặc password");
        return a;
    }
}
