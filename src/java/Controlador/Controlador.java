/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Historial;
import Modelo.HistorialDAO;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author ACER
 */
public class Controlador extends HttpServlet {

    Producto pro = new Producto();
    ProductoDAO prodao = new ProductoDAO();
    Historial his = new Historial();
    HistorialDAO hisdao = new HistorialDAO();
    UsuarioDAO udao = new UsuarioDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equalsIgnoreCase("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equalsIgnoreCase("Inventario")) {
            String usuario;
            String producto;
            String cantidad;
            String cambio;
            List<Producto> productos;
            switch (accion) {
                case "Listar":
                    productos = prodao.listar();
                    String rol = udao.rol(request.getParameter("id"));
                    request.setAttribute("rol", rol);
                    request.setAttribute("usuario", request.getParameter("id"));
                    request.setAttribute("productos", productos);
                    break;
                case "Agregar":
                    String nuevo = request.getParameter("txtagregar");
                    usuario = request.getParameter("usuarioId");
                    if (nuevo.equals("")) {
                        request.setAttribute("error", "No se ingresó un producto.");
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    } else {
                        productos = prodao.listar();
                        for (int i = 0; i < productos.size(); i++) {
                            if (productos.get(i).getNombre().equalsIgnoreCase(nuevo)) {
                                request.setAttribute("error", "El producto ingresado ya existe en el inventario.");
                                request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                                return;
                            }
                        }
                        prodao.agregar(nuevo);
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    }
                    break;
                case "Incrementar":
                    usuario = request.getParameter("usuarioId");
                    producto = request.getParameter("producto").split(" ")[0];
                    cantidad = request.getParameter("producto").split(" ")[1];
                    cambio = request.getParameter("txtcantidad");
                    if (cambio.equals("") || Integer.parseInt(cambio) == 0) {
                        request.setAttribute("error", "Ingrese un valor mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    } else if (Integer.parseInt(cambio) < 0) {
                        request.setAttribute("error", "Valores negativos no son válidos.");
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    } else {
                        int total = Integer.parseInt(cantidad) + Integer.parseInt(cambio);

                        prodao.actualizar(producto, total);
                        hisdao.agregar("ENTRADA", cambio, usuario, producto);
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    }
                    break;
                case "Estatus":
                    usuario = request.getParameter("usuarioId");
                    producto = request.getParameter("producto");
                    String estatus = request.getParameter("estatus");
                    prodao.estatus(producto, estatus);
                    request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    break;
                case "Reducir":
                    usuario = request.getParameter("usuarioId");
                    producto = request.getParameter("producto").split(" ")[0];
                    cantidad = request.getParameter("producto").split(" ")[1];
                    cambio = request.getParameter("txtcantidad");
                    if (cambio.equals("") || Integer.parseInt(cambio) == 0) {
                        request.setAttribute("error", "Ingrese un valor mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    } else if (Integer.parseInt(cambio) < 0) {
                        request.setAttribute("error", "Valores negativos no son válidos.");
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    } else if (Integer.parseInt(cantidad) == 0) {
                        request.setAttribute("error", "No hay existencias de este producto.");
                        request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                    } else {
                        int total = Integer.parseInt(cantidad) - Integer.parseInt(cambio);
                        if (total < 0) {
                            request.setAttribute("error", "No hay suficientes existencias de este producto.");
                            request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                        } else {

                            prodao.actualizar(producto, total);
                            hisdao.agregar("SALIDA", cambio, usuario, producto);
                            request.getRequestDispatcher("Controlador?menu=Inventario&accion=Listar&id=" + usuario).forward(request, response);
                        }
                    }
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Inventario.jsp").forward(request, response);
        }
        if (menu.equalsIgnoreCase("Historial")) {
            List<Historial> historial;
            switch (accion) {
                case "Listar":
                    String filtro = request.getParameter("filtro");
                    if(filtro.equalsIgnoreCase("Entrada")){
                        historial = hisdao.filtrar("ENTRADA");
                    }else if(filtro.equalsIgnoreCase("Salida")){
                        historial = hisdao.filtrar("SALIDA");
                    }else{
                        historial = hisdao.listar();
                    }
                    
                    request.setAttribute("historial", historial);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Historial.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
