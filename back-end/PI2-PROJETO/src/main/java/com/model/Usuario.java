package com.model;

import java.util.Date;

public class Usuario {
	private Integer id;
	private String nome;
	private String senha;
	private String email;
	private Date dataCriacao;
    private Date ultimoAcesso;
	private Integer idGrupo;
	private Integer idFuncionario;
	
	public Usuario() {
	}

	public Usuario(Integer id, String nome, String senha, String email, Date dataCriacao, Date ultimoAcesso,
			Integer idGrupo, Integer idFuncionario) {
		super();
		this.id = id;
		this.nome = nome;
		this.senha = senha;
		this.email = email;
		this.dataCriacao = dataCriacao;
		this.ultimoAcesso = ultimoAcesso;
		this.idGrupo = idGrupo;
		this.idFuncionario = idFuncionario;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Integer getIdGrupo() {
		return idGrupo;
	}

	public void setIdGrupo(Integer idGrupo) {
		this.idGrupo = idGrupo;
	}

	public Integer getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(Integer idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

	public Date getUltimoAcesso() {
		return ultimoAcesso;
	}

	public void setUltimoAcesso(Date ultimoAcesso) {
		this.ultimoAcesso = ultimoAcesso;
	}
	
}
