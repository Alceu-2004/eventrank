package com.example.demo.controller;

import com.example.demo.dto.EventoDto;
import com.example.demo.service.EventoService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/eventos")
public class EventoController {

    private final EventoService service;

    public EventoController(EventoService service) {
        this.service = service;
    }

    @PostMapping
    public ResponseEntity<EventoDto> criar(@Valid @RequestBody EventoDto dto) {
        EventoDto criado = service.criar(dto);
        return ResponseEntity.created(URI.create("/eventos/" + criado.getId())).body(criado);
    }

    @GetMapping
    public ResponseEntity<List<EventoDto>> listar() {
        return ResponseEntity.ok(service.listar());
    }

    @GetMapping("/{id}")
    public ResponseEntity<EventoDto> buscar(@PathVariable Long id) {
        return ResponseEntity.ok(service.buscarPorId(id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<EventoDto> atualizar(@PathVariable Long id, @Valid @RequestBody EventoDto dto) {
        return ResponseEntity.ok(service.atualizar(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {
        service.deletar(id);
        return ResponseEntity.noContent().build();
    }
}
