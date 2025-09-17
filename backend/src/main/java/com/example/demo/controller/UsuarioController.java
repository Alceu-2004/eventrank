package com.example.demo.controller;

import com.example.demo.model.Usuario;
import com.example.demo.repository.UsuarioRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioRepository repository;

    public UsuarioController(UsuarioRepository repository) {
        this.repository = repository;
    }

    // Criar um novo usuário
    @PostMapping
    public Usuario criar(@RequestBody Usuario usuario) {
        usuario.setDataCriacao(java.time.LocalDateTime.now());
        return repository.save(usuario);
    }

    // Listar todos os usuários
    @GetMapping
    public List<Usuario> listar() {
        return repository.findAll();
    }

    // Buscar um usuário pelo ID
    @GetMapping("/{id}")
    public Usuario buscar(@PathVariable Long id) {
        return repository.findById(id).orElse(null);
    }

    // Atualizar um usuário pelo ID
    @PutMapping("/{id}")
    public Usuario atualizar(@PathVariable Long id, @RequestBody Usuario usuario) {
        usuario.setId(id);
        return repository.save(usuario);
    }

    // Deletar um usuário pelo ID
    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        repository.deleteById(id);
    }
}
