package br.mkacunha.espchat.entidades;

import java.util.Date;

import br.mkacunha.espchat.util.Util;

public class Mensagem {

    private String texto;

    private Usuario usuario;

    private Date quando;

    private String quandoFormatado;

    public Mensagem() {
        quando = new Date();
        quandoFormatado = Util.sdf.format(quando);
    }

    public Mensagem(String texto, Usuario usuario) {
        this();
        this.texto = texto;
        this.usuario = usuario;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return usuario + "em " + Util.sdf.format(quando) + " disse:" + texto;
    }

    public String getQuandoToString() {
        return Util.sdf.format(quando);
    }

    public boolean isTextoVazio() {
        return texto == null || "".equals(texto.trim());
    }
}
