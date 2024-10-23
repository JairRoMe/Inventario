/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.*;
import java.time.format.DateTimeFormatter;
/**
 * 
 * @author ACER
 */
public class Historial {
    int id;
    String movimiento;
    int cantidad;
    LocalDateTime fecha;
    String usuario;
    String producto;

    public Historial() {
    }

    public Historial(int id, String movimiento, int cantidad, LocalDateTime fecha, String usuario, String producto) {
        this.id = id;
        this.movimiento = movimiento;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.usuario = usuario;
        this.producto = producto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMovimiento() {
        return movimiento;
    }

    public void setMovimiento(String movimiento) {
        this.movimiento = movimiento;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }
    
    
}
