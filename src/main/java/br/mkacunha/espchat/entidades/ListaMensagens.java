package br.mkacunha.espchat.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

public class ListaMensagens implements Serializable {

	private List<Mensagem> mensagens;

	public ListaMensagens() {
		mensagens = new ArrayList<Mensagem>();
	}

	public List<Mensagem> getMensagens() {
		return mensagens;
	}

	@Override
	public String toString() {
		return mensagens.toString();
	}

	public boolean isListaMensagensVazia() {
		return mensagens == null || mensagens.isEmpty();
	}

	public String toJSON() {
		return new Gson().toJson(mensagens);
	}

	public void add(Mensagem msg) {
		mensagens.add(msg);
	}

}
