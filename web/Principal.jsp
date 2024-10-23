<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Principal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <!--  <form action=""Controlador?menu=Inventario&accion=Listar" method="POST"><input type="hidden" name="usuario" value=""/></form> -->
                            <a class="nav-link" href="Controlador?menu=Inventario&accion=Listar&id=${usuario.getId()}" target="miFrame">Inventario</a>
                        </li>
                        <c:if test="${usuario.getRol().equalsIgnoreCase('ADMINISTRADOR')}">
                            <li class="nav-item">
                                <a class="nav-link" href="Controlador?menu=Historial&accion=Listar&filtro=No" target="miFrame">Historial</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <div class="dropdown">
                    <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                        ${usuario.getNombre()}
                    </button>
                    <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end text-center">
                        <li><a class="dropdown-item btn btn-dark">${usuario.getRol()}</a></li>
                        <li><a class="dropdown-item btn btn-dark">${usuario.getCorreo()}</a></li>
                        <li><div class="dropdown-divider bg-light"></div></li>
                        <li>
                            <form action="Validar" method="POST">
                                <div class="d-grid gap-2">
                                    <button name="accion" value="Salir" class="btn btn-danger btn-block" href="#">Salir</button>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="m-3" style="height: 900px;">
            <iframe name="miFrame" style="height: 100%; width: 100%;" frameBorder="0"></iframe>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
