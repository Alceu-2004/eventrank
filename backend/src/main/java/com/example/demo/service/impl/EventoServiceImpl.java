package com.example.demo.service.impl;

import com.example.demo.dto.EventoDto;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.mapper.EventoMapper;
import com.example.demo.model.Evento;
import com.example.demo.repository.EventoRepository;
import com.example.demo.service.EventoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EventoServiceImpl implements EventoService {

    private final EventoRepository repository;

    public EventoServiceImpl(EventoRepository repository) {
        this.repository = repository;
    }

    @Override
    public EventoDto criar(EventoDto dto) {
        Evento entity = EventoMapper.toEntity(dto);
        Evento saved = repository.save(entity);
        return EventoMapper.toDto(saved);
    }

    @Override
    public List<EventoDto> listar() {
        return EventoMapper.toDtoList(repository.findAll());
    }

    @Override
    public EventoDto buscarPorId(Long id) {
        Evento e = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Evento não encontrado com id: " + id));
        return EventoMapper.toDto(e);
    }

    @Override
    public EventoDto atualizar(Long id, EventoDto dto) {
        Evento exist = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Evento não encontrado com id: " + id));
        exist.setNome(dto.getNome());
        exist.setDescricao(dto.getDescricao());
        exist.setDataEvento(dto.getDataEvento());
        exist.setLocal(dto.getLocal());
        Evento saved = repository.save(exist);
        return EventoMapper.toDto(saved);
    }

    @Override
    public void deletar(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Evento não encontrado com id: " + id);
        }
        repository.deleteById(id);
    }
}
