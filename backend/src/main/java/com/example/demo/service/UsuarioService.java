package com.example.demo.service;

import com.example.demo.dto.UsuarioDto;
import java.util.List;

public interface UsuarioService {

    UsuarioDto criarUsuario(UsuarioDto usuarioDto);

    List<UsuarioDto> listarUsuarios();

    UsuarioDto buscarUsuarioPorId(Long id);

    UsuarioDto atualizarUsuario(Long id, UsuarioDto usuarioDto);

    void deletarUsuario(Long id);
}