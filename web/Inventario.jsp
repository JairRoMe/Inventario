<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ver Inventario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Inventario</h1>
        <div class="d-flex">
            <c:if test="${rol.equalsIgnoreCase('ADMINISTRADOR')}">
                <div class="card col-sm-4">
                    <c:if test="${error != null}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <strong>¡Advertencia!</strong> ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <div class="card-body">
                        <form action="Controlador?menu=Inventario" method="POST">
                            <select name="producto" class="form-select" aria-label="Default select example">
                                <c:forEach var="p" items="${productos}">
                                    <c:if test="${p.getEstatus() != 0}">
                                        <option value="${p.getId()} ${p.getCantidad()}">${p.getNombre()}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <div class="mt-3">
                                <label for="txtcantidad" class="form-label">Entrada:</label>
                                <input type="number" step="1" class="form-control" name="txtcantidad" placeholder="0">
                            </div>
                            <div class="d-grid gap-2 mt-4">
                                <input type="submit" name="accion" value="Incrementar" class="btn btn-info btn-block"/>
                            </div>
                            <input type="hidden" name="usuarioId" value="${usuario}"/>
                        </form>
                    </div>
                    <div class="card-body">
                        <form action="Controlador?menu=Inventario" method="POST">
                            <div class="mt-3">
                                <label for="txtagregar" class="form-label">Nuevo producto:</label>
                                <input type="text" class="form-control" name="txtagregar" placeholder="Nuevo producto">
                            </div>
                            <div class="d-grid gap-2 mt-4">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-success btn-block"/>
                            </div>
                            <input type="hidden" name="usuarioId" value="${usuario}"/>
                        </form>
                    </div>
                </div>
            </c:if>
            <c:if test="${!rol.equalsIgnoreCase('ADMINISTRADOR')}">
                <div class="card col-sm-4">
                    <c:if test="${error != null}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <strong>¡Advertencia!</strong> ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <div class="card-body">
                        <form action="Controlador?menu=Inventario" method="POST">
                            <select name="producto" class="form-select" aria-label="Default select example">
                                <c:forEach var="p" items="${productos}">
                                    <c:if test="${p.getEstatus() != 0}">
                                        <option value="${p.getId()} ${p.getCantidad()}">${p.getNombre()}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <div class="mt-3">
                                <label for="txtcantidad" class="form-label">Salida:</label>
                                <input type="number" step="1" class="form-control" name="txtcantidad" placeholder="0">
                            </div>
                            <div class="d-grid gap-2 mt-4">
                                <input type="submit" name="accion" value="Reducir" class="btn btn-info btn-block"/>
                            </div>
                            <input type="hidden" name="usuarioId" value="${usuario}"/>
                        </form>
                    </div>
                </div>
            </c:if>
            <div class="card col-sm-8">
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Existencias</th>
                                <th scope="col">Estatus</th>
                                    <c:if test="${rol.equalsIgnoreCase('ADMINISTRADOR')}">
                                    <th scope="col">Botones</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${productos}">
                                <c:choose>
                                    <c:when test="${p.getEstatus() == 0}">
                                        <tr class="table-secondary">
                                            <th scope="row">${p.getId()}</th>
                                            <td>${p.getNombre()}</td>
                                            <td>${p.getCantidad()}</td>
                                            <td>${p.getEstatus()}</td>
                                            <c:if test="${rol.equalsIgnoreCase('ADMINISTRADOR')}">
                                                <td scope="col">
                                                    <a class="btn btn-primary" href="Controlador?menu=Inventario&accion=Estatus&estatus=1&producto=${p.getId()}&usuarioId=${usuario}">ALTA</a>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <th scope="row">${p.getId()}</th>
                                            <td>${p.getNombre()}</td>
                                            <td>${p.getCantidad()}</td>
                                            <td>${p.getEstatus()}</td>
                                            <c:if test="${rol.equalsIgnoreCase('ADMINISTRADOR')}">
                                                <td scope="col">
                                                    <a class="btn btn-danger" href="Controlador?menu=Inventario&accion=Estatus&estatus=0&producto=${p.getId()}&usuarioId=${usuario}">BAJA</a>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
