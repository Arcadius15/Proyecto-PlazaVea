package com.pv.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "transportista")
public class Transportista implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer transportistaId;
	@Column(nullable = false)
	private String nombre;
	@Column(nullable = false)
	private String apellido;
	@Column(nullable = false)
	private String dni;
	@Column(nullable = false)
	private String placaCamion;
	@Column(nullable = false)
	private String centroTransporte;
	@Column(nullable = false)
	private String turno;
	public Integer getTransportistaId() {
		return transportistaId;
	}
	public void setTransportistaId(Integer transportistaId) {
		this.transportistaId = transportistaId;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getPlacaCamion() {
		return placaCamion;
	}
	public void setPlacaCamion(String placaCamion) {
		this.placaCamion = placaCamion;
	}
	public String getCentroTransporte() {
		return centroTransporte;
	}
	public void setCentroTransporte(String centroTransporte) {
		this.centroTransporte = centroTransporte;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public Transportista() {
	}
	public Transportista(Integer transportistaId, String nombre, String apellido, String dni, String placaCamion,
			String centroTransporte, String turno) {
		this.transportistaId = transportistaId;
		this.nombre = nombre;
		this.apellido = apellido;
		this.dni = dni;
		this.placaCamion = placaCamion;
		this.centroTransporte = centroTransporte;
		this.turno = turno;
	}
	
	@OneToOne
	@JoinColumn(name = "usuario_id",nullable = false,unique = true,
		foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (usuario_id) references usuario(usuario_id)"))
	private Usuario userTransportista;
	public Usuario getUserTransportista() {
		return userTransportista;
	}
	public void setUserTransportista(Usuario userTransportista) {
		this.userTransportista = userTransportista;
	}
	
	@OneToMany(mappedBy = "transportista")
	private Collection<Orden> itemsOrden = new ArrayList<>();
	public Collection<Orden> getItemsOrden() {
		return itemsOrden;
	}
	public void setItemsOrden(Collection<Orden> itemsOrden) {
		this.itemsOrden = itemsOrden;
	}
	
	@OneToMany(mappedBy = "transportista")
	private Collection<Reporte> itemReporte = new ArrayList<>();
	public Collection<Reporte> getItemReporte() {
		return itemReporte;
	}
	public void setItemReporte(Collection<Reporte> itemReporte) {
		this.itemReporte = itemReporte;
	}
	
	

}
