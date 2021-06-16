package com.pv.Entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "orden")
public class Orden implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ordenId;
	@DateTimeFormat(pattern = "yyyy-MM-dd",iso = ISO.DATE)
	private LocalDate fecha;
	@DateTimeFormat(pattern = "yyyy-MM-dd",iso = ISO.DATE)
	private LocalDate fechaEntrega;
	@Column(nullable = false)
	private String direccion;
	@Column(nullable = false)
	private Double impuesto;
	public Integer getOrdenId() {
		return ordenId;
	}
	public void setOrdenId(Integer ordenId) {
		this.ordenId = ordenId;
	}
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public LocalDate getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(LocalDate fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public Double getImpuesto() {
		return impuesto;
	}
	public void setImpuesto(Double impuesto) {
		this.impuesto = impuesto;
	}
	public Orden(Integer ordenId, LocalDate fecha, LocalDate fechaEntrega, String direccion, Double impuesto) {
		this.ordenId = ordenId;
		this.fecha = fecha;
		this.fechaEntrega = fechaEntrega;
		this.direccion = direccion;
		this.impuesto = impuesto;
	}
	public Orden() {
	}
	
	@ManyToOne
	@JoinColumn(name = "cliente_id",nullable = false,
			foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (cliente_id) references cliente(cliente_id)"))
	private Cliente cliente;
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	@ManyToOne
	@JoinColumn(name = "transportista_id",
			foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (transportista_id) references transportista(transportista_id)"))
	private Transportista transportista;
	public Transportista getTransportista() {
		return transportista;
	}
	public void setTransportista(Transportista transportista) {
		this.transportista = transportista;
	}
	
	@ManyToOne
	@JoinColumn(name = "estado_id",nullable = false,
			foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (estado_id) references estado_orden(estado_id)"))
	private EstadoOrden estadoOrden;
	public EstadoOrden getEstadoOrden() {
		return estadoOrden;
	}
	public void setEstadoOrden(EstadoOrden estadoOrden) {
		this.estadoOrden = estadoOrden;
	}
	
	@ManyToOne
	@JoinColumn(name = "tarjeta_id",nullable = false,
			foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (tarjeta_id) references tarjeta(tarjeta_id)"))
	private Tarjeta tarjeta;
	public Tarjeta getTarjeta() {
		return tarjeta;
	}
	public void setTarjeta(Tarjeta tarjeta) {
		this.tarjeta = tarjeta;
	}
	
	@OneToMany(mappedBy = "orden")
	private Collection<OrdenDetalle> itemsOrdenDetalle = new ArrayList<>();
	public Collection<OrdenDetalle> getItemsOrdenDetalle() {
		return itemsOrdenDetalle;
	}
	public void setItemsOrdenDetalle(Collection<OrdenDetalle> itemsOrdenDetalle) {
		this.itemsOrdenDetalle = itemsOrdenDetalle;
	}
	
	

}
