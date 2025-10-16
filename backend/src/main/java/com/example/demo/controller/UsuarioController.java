package com.example.demo.controller;

import com.example.demo.dto.UsuarioDto;
import com.example.demo.model.Usuario;
import com.example.demo.repository.UsuarioRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioRepository repository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UsuarioController(UsuarioRepository repository) {
        this.repository = repository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @PostMapping
    public ResponseEntity<?> criar(@RequestBody UsuarioDto usuarioDto) {
        if (repository.existsByEmail(usuarioDto.getEmail())) {
            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body("Email já cadastrado");
        }

        Usuario usuario = new Usuario();
        usuario.setNome(usuarioDto.getNome());
        usuario.setEmail(usuarioDto.getEmail());
        usuario.setSenha(passwordEncoder.encode(usuarioDto.getSenha()));
        usuario.setDataCriacao(java.time.LocalDateTime.now());

        Usuario saved = repository.save(usuario);

        UsuarioDto responseDto = new UsuarioDto();
        responseDto.setId(saved.getId());
        responseDto.setNome(saved.getNome());
        responseDto.setEmail(saved.getEmail());
        responseDto.setDataCriacao(saved.getDataCriacao());

        return ResponseEntity.status(HttpStatus.CREATED).body(responseDto);
    }

    @GetMapping
    public List<UsuarioDto> listar() {
        return repository.findAll().stream().map(usuario -> {
            UsuarioDto dto = new UsuarioDto();
            dto.setId(usuario.getId());
            dto.setNome(usuario.getNome());
            dto.setEmail(usuario.getEmail());
            dto.setDataCriacao(usuario.getDataCriacao());
            return dto;
        }).collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<UsuarioDto> buscar(@PathVariable Long id) {
        return repository.findById(id)
                .map(usuario -> {
                    UsuarioDto dto = new UsuarioDto();
                    dto.setId(usuario.getId());
                    dto.setNome(usuario.getNome());
                    dto.setEmail(usuario.getEmail());
                    dto.setDataCriacao(usuario.getDataCriacao());
                    return ResponseEntity.ok(dto);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<UsuarioDto> atualizar(@PathVariable Long id, @RequestBody UsuarioDto usuarioDto) {
        return repository.findById(id)
                .map(usuario -> {
                    usuario.setNome(usuarioDto.getNome());
                    usuario.setEmail(usuarioDto.getEmail());
                    if (usuarioDto.getSenha() != null && !usuarioDto.getSenha().isEmpty()) {
                        usuario.setSenha(passwordEncoder.encode(usuarioDto.getSenha()));
                    }
                    Usuario updated = repository.save(usuario);
                    UsuarioDto dto = new UsuarioDto();
                    dto.setId(updated.getId());
                    dto.setNome(updated.getNome());
                    dto.setEmail(updated.getEmail());
                    dto.setDataCriacao(updated.getDataCriacao());
                    return ResponseEntity.ok(dto);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {
        if (!repository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        repository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
