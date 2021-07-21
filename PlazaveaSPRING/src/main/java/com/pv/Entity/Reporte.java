package com.pv.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reporte")
public class Reporte implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reporteId;
	@Column
	private String titulo;
	@Column
	private String comentario;
	
	@ManyToOne
	@JoinColumn(name = "transportista_id",nullable = false,
		foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (transportista_id) references transportista(transportista_id)"))
	private Transportista transportista;

	public Integer getReporteId() {
		return reporteId;
	}

	public void setReporteId(Integer reporteId) {
		this.reporteId = reporteId;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Transportista getTransportista() {
		return transportista;
	}

	public void setTransportista(Transportista transportista) {
		this.transportista = transportista;
	}
	
	
	
	

}
