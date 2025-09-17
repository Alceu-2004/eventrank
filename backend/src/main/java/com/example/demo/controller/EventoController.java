package com.example.demo.controller;

import com.example.demo.model.Evento;
import com.example.demo.repository.EventoRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/eventos")
public class EventoController {

    private final EventoRepository repository;

    public EventoController(EventoRepository repository) {
        this.repository = repository;
    }

    @PostMapping
    public Evento criar(@RequestBody Evento evento) {
        return repository.save(evento);
    }

    @GetMapping
    public List<Evento> listar() {
        return repository.findAll();
    }
}
