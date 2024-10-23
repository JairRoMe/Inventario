/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.time.*;

import java.time.format.*;

/**
 *
 * @author ACER
 */
public class HistorialDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int res;
    
    public List listar(){
        List<Historial> lista = new ArrayList<Historial>();
        String sql = "SELECT h.idHistorial, h.movimiento, h.cantidad, h.timestamp, u.nombre AS usuario, p.nombre AS producto FROM historial AS h INNER JOIN usuarios AS u ON h.idUsuario=u.idUsuario INNER JOIN productos AS p ON h.idProducto=p.idProducto ORDER BY h.idHistorial;";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Historial his = new Historial();
                his.setId(rs.getInt("idHistorial"));
                his.setMovimiento(rs.getString("movimiento"));
                his.setCantidad(rs.getInt("cantidad"));
                his.setFecha(LocalDateTime.parse(rs.getString("timestamp"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
                his.setUsuario(rs.getString("usuario"));
                his.setProducto(rs.getString("producto"));
                lista.add(his);
            }
        }catch(Exception e){
            
        }
        return lista;
    }
    
    public List filtrar(String mov){
        List<Historial> lista = new ArrayList<Historial>();
        String sql = "SELECT h.idHistorial, h.movimiento, h.cantidad, h.timestamp, u.nombre AS usuario, p.nombre AS producto FROM historial AS h INNER JOIN usuarios AS u ON h.idUsuario=u.idUsuario INNER JOIN productos AS p ON h.idProducto=p.idProducto WHERE h.movimiento='" + mov + "';";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Historial his = new Historial();
                his.setId(rs.getInt("idHistorial"));
                his.setMovimiento(rs.getString("movimiento"));
                his.setCantidad(rs.getInt("cantidad"));
                his.setFecha(LocalDateTime.parse(rs.getString("timestamp"), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
                his.setUsuario(rs.getString("usuario"));
                his.setProducto(rs.getString("producto"));
                lista.add(his);
            }
        }catch(Exception e){
            
        }
        return lista;
    }
    
    public int agregar(String mov, String cant, String user, String prod){
        String sql = "INSERT INTO historial (idHistorial, movimiento, cantidad, timestamp, idUsuario, idProducto) VALUES (NULL, '" + mov + "', " + cant + ", CURRENT_TIMESTAMP, '" + user + "', '" + prod + "');";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            res = ps.executeUpdate();
        }catch(Exception e){
            
        }
        return res;
    }
}
