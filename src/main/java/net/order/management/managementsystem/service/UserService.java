package net.order.management.managementsystem.service;

import net.order.management.managementsystem.entity.UserEntity;
import net.order.management.managementsystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    private void addUser(UserEntity user) {
        userRepository.save(user);
    }

    public List<UserEntity> findUsersByName(String name) {
        List<UserEntity> users;
        users= userRepository.findByName(name);
        return users;
    }
}
