package com.example.demo.service.impl;

import com.example.demo.dto.UsuarioDto;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.mapper.UsuarioMapper;
import com.example.demo.model.Usuario;
import com.example.demo.repository.UsuarioRepository;
import com.example.demo.service.UsuarioService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioServiceImpl(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public UsuarioDto criarUsuario(UsuarioDto usuarioDto) {
        Usuario usuario = UsuarioMapper.toEntity(usuarioDto);
        return UsuarioMapper.toDto(usuarioRepository.save(usuario));
    }

    @Override
    public List<UsuarioDto> listarUsuarios() {
        return usuarioRepository.findAll()
                .stream()
                .map(UsuarioMapper::toDto)
                .collect(Collectors.toList());
    }

    @Override
    public UsuarioDto buscarUsuarioPorId(Long id) {
        Usuario usuario = usuarioRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuário não encontrado com id: " + id));
        return UsuarioMapper.toDto(usuario);
    }

    @Override
    public UsuarioDto atualizarUsuario(Long id, UsuarioDto usuarioDto) {
        Usuario usuario = usuarioRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuário não encontrado com id: " + id));

        usuario.setNome(usuarioDto.getNome());
        usuario.setEmail(usuarioDto.getEmail());
        usuario.setSenha(usuarioDto.getSenha());

        return UsuarioMapper.toDto(usuarioRepository.save(usuario));
    }

    @Override
    public void deletarUsuario(Long id) {
        Usuario usuario = usuarioRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuário não encontrado com id: " + id));
        usuarioRepository.delete(usuario);
    }
}
