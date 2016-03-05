package br.mkacunha.espchat.entidades;

import com.google.gson.Gson;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class ListaUsuarios implements Serializable {

    private Set<Usuario> usuarios;
    private Map<Usuario, List<Mensagem>> msgsUsuario;

    public ListaUsuarios() {
        usuarios = new TreeSet<Usuario>();
        msgsUsuario = new HashMap<>();
    }

    public Set<Usuario> getUsuarios() {
        return usuarios;
    }

    public boolean isListaUsuariosVazia() {
        return usuarios == null || usuarios.isEmpty();
    }

    public void remove(Usuario usu) {
        usuarios.remove(usu);
        msgsUsuario.remove(usu);
    }

    public void add(Usuario usu) {
        usuarios.add(usu);
        if (!msgsUsuario.containsKey(usu)) {
            msgsUsuario.put(usu, new ArrayList<>());
        }
    }

    public void add(Mensagem msg) {
        Iterator<Map.Entry<Usuario, List<Mensagem>>> iterator = msgsUsuario.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<Usuario, List<Mensagem>> next = iterator.next();
            List<Mensagem> value = next.getValue();
            value.add(msg);
        }
    }

    public String getMensagensAsJSON(Usuario usu) {
        if (msgsUsuario.containsKey(usu)) {
            List<Mensagem> mensagens = msgsUsuario.get(usu);
            String json = new Gson().toJson(mensagens);
            mensagens.clear();
            return json;
        }
        return "";
    }

    @Override
    public String toString() {
        return usuarios.toString();
    }

    public String toJSON() {
        return new Gson().toJson(usuarios);
    }
}
