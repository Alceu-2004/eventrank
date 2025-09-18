package com.example.demo.mapper;

import com.example.demo.dto.EventoDto;
import com.example.demo.model.Evento;

import java.util.List;
import java.util.stream.Collectors;

public class EventoMapper {

    public static EventoDto toDto(Evento e) {
        if (e == null) return null;
        EventoDto dto = new EventoDto();
        dto.setId(e.getId());
        dto.setNome(e.getNome());
        dto.setDescricao(e.getDescricao());
        dto.setDataEvento(e.getDataEvento());
        dto.setLocal(e.getLocal());
        return dto;
    }

    public static Evento toEntity(EventoDto dto) {
        if (dto == null) return null;
        Evento e = new Evento();
        e.setId(dto.getId());
        e.setNome(dto.getNome());
        e.setDescricao(dto.getDescricao());
        e.setDataEvento(dto.getDataEvento());
        e.setLocal(dto.getLocal());
        return e;
    }

    public static List<EventoDto> toDtoList(List<Evento> list) {
        return list.stream().map(EventoMapper::toDto).collect(Collectors.toList());
    }
}
