package com.example.demo.service;

import com.example.demo.model.Avaliacao;
import com.example.demo.model.Evento;
import java.util.List;

public interface AvaliacaoService {
    Avaliacao criarAvaliacao(Avaliacao avaliacao);
    List<Avaliacao> listarPorEvento(Evento evento);
}
