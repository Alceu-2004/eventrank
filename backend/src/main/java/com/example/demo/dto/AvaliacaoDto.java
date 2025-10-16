package com.example.demo.dto;

import com.example.demo.model.Avaliacao;
import com.example.demo.model.Usuario;

public class AvaliacaoDto {
    private Long id;
    private String comentario;
    private int nota;
    private UsuarioDto usuario;

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getComentario() { return comentario; }
    public void setComentario(String comentario) { this.comentario = comentario; }

    public int getNota() { return nota; }
    public void setNota(int nota) { this.nota = nota; }

    public UsuarioDto getUsuario() { return usuario; }
    public void setUsuario(UsuarioDto usuario) { this.usuario = usuario; }

    public static AvaliacaoDto fromEntity(Avaliacao a) {
        AvaliacaoDto dto = new AvaliacaoDto();
        dto.setId(a.getId());
        dto.setComentario(a.getComentario());
        dto.setNota(a.getNota());

        Usuario u = a.getUsuario();
        if (u != null) {
            UsuarioDto usuarioDto = new UsuarioDto();
            usuarioDto.setId(u.getId());
            usuarioDto.setNome(u.getNome());
            usuarioDto.setEmail(u.getEmail());
            usuarioDto.setSenha(u.getSenha());
            usuarioDto.setDataCriacao(u.getDataCriacao());
            dto.setUsuario(usuarioDto);
        }

        return dto;
    }
}
