/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ACER
 */
public class UsuarioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public Usuario validar(String correo, String contra){
        Usuario user = new Usuario();
        String sql = "SELECT u.idUsuario, u.nombre, u.correo, u.contraseña, u.estatus, r.valor AS rol FROM usuarios AS u INNER JOIN roles AS r ON u.idRol=r.idRol WHERE correo=? AND contraseña=?;";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contra);
            rs = ps.executeQuery();
            
            while(rs.next()){
                user.setId(rs.getInt("idUsuario"));
                user.setNombre(rs.getString("nombre"));
                user.setCorreo(rs.getString("correo"));
                user.setContra(rs.getString("contraseña"));
                user.setRol(rs.getString("rol"));
                user.setEstatus(rs.getInt("estatus"));
            }
        }catch(Exception e){
            
        }
        return user;
    }
    
    public String rol(String id){
        String sql = "SELECT r.valor AS rol FROM usuarios AS u INNER JOIN roles AS r ON u.idRol=r.idRol WHERE idUsuario=?;";
        String res = "";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            rs.next();
            res = rs.getString("rol");
        }catch(Exception e){
            
        }
        return res;
    }
}
