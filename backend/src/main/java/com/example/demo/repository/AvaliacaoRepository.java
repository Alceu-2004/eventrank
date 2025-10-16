package com.example.demo.repository;

import com.example.demo.model.Avaliacao;
import com.example.demo.model.Evento;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AvaliacaoRepository extends JpaRepository<Avaliacao, Long> {
    List<Avaliacao> findByEvento(Evento evento);
}
