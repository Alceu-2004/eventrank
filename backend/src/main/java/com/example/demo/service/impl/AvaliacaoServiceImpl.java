package com.example.demo.service.impl;

import com.example.demo.model.Avaliacao;
import com.example.demo.model.Evento;
import com.example.demo.repository.AvaliacaoRepository;
import com.example.demo.service.AvaliacaoService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AvaliacaoServiceImpl implements AvaliacaoService {

    private final AvaliacaoRepository repository;

    public AvaliacaoServiceImpl(AvaliacaoRepository repository) {
        this.repository = repository;
    }

    @Override
    public Avaliacao criarAvaliacao(Avaliacao avaliacao) {
        return repository.save(avaliacao);
    }

    @Override
    public List<Avaliacao> listarPorEvento(Evento evento) {
        return repository.findByEvento(evento);
    }
}
