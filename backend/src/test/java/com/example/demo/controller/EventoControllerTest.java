package com.example.demo.controller;

import com.example.demo.service.EventoService;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(EventoController.class)
class EventoControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private EventoService service;

    @TestConfiguration
    static class TestConfig {
        @Bean
        EventoService eventoService() {
            return Mockito.mock(EventoService.class);
        }
    }

    @Test
    void listar_deveRetornarOkEListaVazia() throws Exception {
        Mockito.when(service.listar()).thenReturn(Collections.emptyList());

        mockMvc.perform(get("/eventos"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(content().json("[]"));
    }
}
