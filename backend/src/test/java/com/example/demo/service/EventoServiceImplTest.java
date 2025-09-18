package com.example.demo.service;

import com.example.demo.dto.EventoDto;
import com.example.demo.model.Evento;
import com.example.demo.repository.EventoRepository;
import com.example.demo.service.impl.EventoServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import java.time.LocalDateTime;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class EventoServiceImplTest {

    @Mock
    private EventoRepository repo;

    @InjectMocks
    private EventoServiceImpl service;

    @BeforeEach
    void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void criar_deveSalvarERetornarDto() {
        Evento e = new Evento();
        e.setId(1L);
        e.setNome("Teste");
        e.setDataEvento(LocalDateTime.now());

        when(repo.save(any(Evento.class))).thenReturn(e);

        EventoDto dto = new EventoDto();
        dto.setNome("Teste");
        dto.setDataEvento(LocalDateTime.now());

        EventoDto criado = service.criar(dto);
        assertNotNull(criado);
        assertEquals(1L, criado.getId());
        verify(repo, times(1)).save(any(Evento.class));
    }

    @Test
    void buscarPorId_naoEncontrado_deveLancarException() {
        when(repo.findById(42L)).thenReturn(Optional.empty());
        assertThrows(RuntimeException.class, () -> service.buscarPorId(42L));
    }
}
