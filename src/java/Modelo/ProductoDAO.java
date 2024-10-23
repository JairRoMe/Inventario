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

/**
 *
 * @author ACER
 */
public class ProductoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int res;
    
    public List listar(){
        List<Producto>lista = new ArrayList<Producto>();
        String sql = "SELECT * FROM productos;";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Producto pr = new Producto();
                pr.setId(rs.getInt("idProducto"));
                pr.setNombre(rs.getString("nombre"));
                pr.setCantidad(rs.getInt("cantidad"));
                pr.setEstatus(rs.getInt("estatus"));
                lista.add(pr);
            }
        }catch(Exception e){
            
        }
        return lista;
    }
    
    public int agregar(String producto){
        String sql = "INSERT INTO productos (idProducto, nombre, cantidad, estatus) VALUES (NULL, '" + producto + "', 0, 1);";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            res = ps.executeUpdate();
        }catch(Exception e){
            
        }
        return res;
    }
    
    public int actualizar(String id, int cantidad){
        String sql = "UPDATE productos SET cantidad=? WHERE idProducto=?;";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cantidad);
            ps.setString(2, id);
            res = ps.executeUpdate();
            
            while(rs.next()){
                
            }
        }catch(Exception e){
            
        }
        return res;
    }
    
    public int estatus(String id, String estatus){
        String sql = "UPDATE productos SET estatus=? WHERE idProducto=?;";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, estatus);
            ps.setString(2, id);
            res = ps.executeUpdate();
            
            while(rs.next()){
                
            }
        }catch(Exception e){
            
        }
        return res;
    }
}
