package net.order.management.managementsystem.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import net.order.management.managementsystem.entity.UserEntity;
import net.order.management.managementsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user")
@Tag(name = "User controller")
public class UserController {
    @Autowired
    private UserService userService;

    @Operation(summary = "Поиск всех пользователей с выбранным именем")
    @ApiResponse(responseCode = "200", description = "Список найденных пользователей")
    @GetMapping()
    public List<UserEntity> getUsers(@RequestParam String name) {
        return userService.findUsersByName(name);
    }
}
