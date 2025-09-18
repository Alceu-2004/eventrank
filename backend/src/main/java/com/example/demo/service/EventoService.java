package com.example.demo.service;

import com.example.demo.dto.EventoDto;

import java.util.List;

public interface EventoService {
    EventoDto criar(EventoDto dto);
    List<EventoDto> listar();
    EventoDto buscarPorId(Long id);
    EventoDto atualizar(Long id, EventoDto dto);
    void deletar(Long id);
}
