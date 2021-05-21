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
@Table(name = "cliente")
public class Cliente implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer clienteId;
	@Column(nullable = false)
	private String nombre;
	@Column(nullable = false)
	private String apellido;
	@Column(nullable = false)
	private String dni;
	@Column(nullable = false)
	private String telefono;
	@Column(nullable = false)
	private String direccion;
	@Column(nullable = false)
	private String nroTarjeta;
	public Cliente(Integer clienteId, String nombre, String apellido, String dni, String telefono, String direccion,
			String nroTarjeta) {
		this.clienteId = clienteId;
		this.nombre = nombre;
		this.apellido = apellido;
		this.dni = dni;
		this.telefono = telefono;
		this.direccion = direccion;
		this.nroTarjeta = nroTarjeta;
	}
	public Cliente() {
	}
	public Integer getClienteId() {
		return clienteId;
	}
	public void setClienteId(Integer clienteId) {
		this.clienteId = clienteId;
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getNroTarjeta() {
		return nroTarjeta;
	}
	public void setNroTarjeta(String nroTarjeta) {
		this.nroTarjeta = nroTarjeta;
	}
	
	@OneToOne
	@JoinColumn(name = "usuario_id",nullable = false,unique = true,
		foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (usuario_id) references usuario(usuario_id)"))
	private Usuario userCliente;
	public Usuario getUserCliente() {
		return userCliente;
	}
	public void setUserCliente(Usuario userCliente) {
		this.userCliente = userCliente;
	}
	
	@OneToMany(mappedBy = "cliente")
	private Collection<Tarjeta> itemsTarjeta = new ArrayList<>();
	
	public Collection<Tarjeta> getItemsTarjeta() {
		return itemsTarjeta;
	}
	public void setItemsTarjeta(Collection<Tarjeta> itemsTarjeta) {
		this.itemsTarjeta = itemsTarjeta;
	}

	@OneToMany(mappedBy = "cliente")
	private Collection<Orden> itemsOrden = new ArrayList<>();
	public Collection<Orden> getItemsOrden() {
		return itemsOrden;
	}
	public void setItemsOrden(Collection<Orden> itemsOrden) {
		this.itemsOrden = itemsOrden;
	}
	

}
