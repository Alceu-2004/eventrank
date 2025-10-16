package com.example.demo.controller;

import com.example.demo.dto.AvaliacaoDto;
import com.example.demo.model.Avaliacao;
import com.example.demo.model.Evento;
import com.example.demo.model.Usuario;
import com.example.demo.service.AvaliacaoService;
import com.example.demo.repository.EventoRepository;
import com.example.demo.security.CustomUserDetails;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/avaliacoes")
public class AvaliacaoController {

    private final AvaliacaoService service;
    private final EventoRepository eventoRepository;

    public AvaliacaoController(AvaliacaoService service, EventoRepository eventoRepository) {
        this.service = service;
        this.eventoRepository = eventoRepository;
    }

    @PostMapping("/{eventoId}")
    public AvaliacaoDto criar(
            @PathVariable Long eventoId,
            @RequestBody Avaliacao avaliacao,
            @AuthenticationPrincipal CustomUserDetails userDetails
    ) {
        Usuario usuarioLogado = userDetails.getUsuario();
        Evento evento = eventoRepository.findById(eventoId).orElseThrow();
        avaliacao.setEvento(evento);
        avaliacao.setUsuario(usuarioLogado);
        Avaliacao criado = service.criarAvaliacao(avaliacao);
        return AvaliacaoDto.fromEntity(criado);
    }

    @GetMapping("/{eventoId}")
    public List<AvaliacaoDto> listar(@PathVariable Long eventoId) {
        Evento evento = eventoRepository.findById(eventoId).orElseThrow();
        return service.listarPorEvento(evento)
                .stream()
                .map(AvaliacaoDto::fromEntity)
                .collect(Collectors.toList());
    }
}
