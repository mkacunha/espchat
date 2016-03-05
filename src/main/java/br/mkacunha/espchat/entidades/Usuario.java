package br.mkacunha.espchat.entidades;

import java.io.Serializable;
import java.util.Objects;

public class Usuario implements Serializable, Comparable<Usuario> {

    private Long id;
    private String apelido;
    private String ip;

    public Usuario() {
        id = System.currentTimeMillis() * 1000 + (long) (Math.random() * 1000);
        apelido = "sem apelido";
        ip = "indetermindado";
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        if (apelido != null) {
            this.apelido = apelido;
        }
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Long getId() {
        return id;
    }

    @Override
    public String toString() {
        return apelido + "@" + ip;
    }

    @Override
    public int compareTo(Usuario o) {
        return apelido.compareTo(o.apelido);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 19 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Usuario other = (Usuario) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

}
