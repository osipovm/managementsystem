package net.order.management.managementsystem.entity;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;
import java.util.UUID;


@Data
@AllArgsConstructor
@Table("users")
public class UserEntity {

    @Id
    @NotNull
    private UUID id;

    private String name;

    @Email
    private String email;

    @Column("created_at")
    private LocalDate created_at;

}
