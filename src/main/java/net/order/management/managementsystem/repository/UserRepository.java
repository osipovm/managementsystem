package net.order.management.managementsystem.repository;


import net.order.management.managementsystem.entity.UserEntity;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

 @Repository
public interface UserRepository extends CrudRepository<UserEntity, UUID> {
     Optional<UserEntity> findByEmail(String email);

     List<UserEntity> findByName(String name);
}
