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
@Table(name = "tarjeta")
public class Tarjeta implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tarjetaId;
	@Column(nullable = false)
	private String nroTarjeta;
	@Column(nullable = false)
	private Integer cvv;
	@DateTimeFormat(pattern = "MM-dd-yyyy",iso = ISO.DATE)
	private LocalDate fechavencimiento;
	
	public Integer getTarjetaId() {
		return tarjetaId;
	}
	public void setTarjetaId(Integer tarjetaId) {
		this.tarjetaId = tarjetaId;
	}
	public String getNroTarjeta() {
		return nroTarjeta;
	}
	public void setNroTarjeta(String nroTarjeta) {
		this.nroTarjeta = nroTarjeta;
	}
	public Integer getCvv() {
		return cvv;
	}
	public void setCvv(Integer cvv) {
		this.cvv = cvv;
	}
	public LocalDate getFechavencimiento() {
		return fechavencimiento;
	}
	public void setFechavencimiento(LocalDate fechavencimiento) {
		this.fechavencimiento = fechavencimiento;
	}
	public Tarjeta(String nroTarjeta, Integer cvv, LocalDate fechavencimiento) {
		this.nroTarjeta = nroTarjeta;
		this.cvv = cvv;
		this.fechavencimiento = fechavencimiento;
	}
	public Tarjeta() {
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
	
	@OneToMany(mappedBy = "tarjeta")
	private Collection<Orden> itemsOrden = new ArrayList<>();

	public Collection<Orden> getItemsOrden() {
		return itemsOrden;
	}
	public void setItemsOrden(Collection<Orden> itemsOrden) {
		this.itemsOrden = itemsOrden;
	}
	
	

}
