<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Salida de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Historial de Movimientos</h1>
        <div class="card col-sm-12">
            <div class="card-body">
                <a class="btn btn-success" href="Controlador?menu=Historial&accion=Listar&filtro=Entrada">ENTRADAS</a>
                <a class="btn btn-warning" href="Controlador?menu=Historial&accion=Listar&filtro=Salida">SALIDAS</a>
                <a class="btn btn-info" href="Controlador?menu=Historial&accion=Listar&filtro=No">TODOS</a>
            </div>
        </div>
        <div class="card col-sm-12">
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Movimiento</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="h" items="${historial}">
                            <c:choose>
                                <c:when test="${h.getMovimiento().equalsIgnoreCase('ENTRADA')}"><tr class="table-success"></c:when>
                                <c:when test="${h.getMovimiento().equalsIgnoreCase('SALIDA')}"><tr class="table-warning"></c:when>
                                <c:when test="${h.getMovimiento().equalsIgnoreCase('CREAR')}"><tr class="table-info"></c:when>
                            </c:choose>
                            <th scope="row">${h.getId()}</th>
                            <td>${h.getMovimiento()}</td>
                            <td>${h.getCantidad()}</td>
                            <td>${h.getProducto()}</td>
                            <td>${h.getUsuario()}</td>
                            <td>${h.getFecha()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
