
<%@page import="logica.Cliente"%>
<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modificar Cliente</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styles.css"/>
        <script src="https://kit.fontawesome.com/3b47a2eb14.js" crossorigin="anonymous"></script>
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin</div>
                </a>


                <hr class="sidebar-divider my-0">


                <li class="nav-item active">
                    <form action="svVenta" method="GET"><a href="svVenta" class="SUBMIT nav-link" href=Ventas.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i><span>Ventas</span></a></a></form>

                </li>


                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <form action="svListaClientes" method="GET"><a href="svListaClientes" class="SUBMIT nav-link" href="Clientes.jsp"><i class="fas fa-fw fa-tachometer-alt"></i><span>Clientes</span></a></a></form>
                </li>


                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <form action="svListaServicios" method="GET"><a href="svListaServicios" class="SUBMIT nav-link" href="Servicios.jsp"><i class="fas fa-fw fa-tachometer-alt"></i><span>Servicios</span></a></a></form>

                </li>

                <hr class="sidebar-divider">


                <li class="nav-item active">
                    <form action="svPaquete" method="GET"><a href="svPaquete" class="SUBMIT nav-link" href="Paquetes.jsp"><i class="fas fa-fw fa-tachometer-alt"></i><span>Paquete</span></a></a></form>

                </li>
                <hr class="sidebar-divider">


                <li class="nav-item active">
                    <form action="svEmpleado" method="GET"><a href="svEmpleado" class="SUBMIT nav-link" href="Empleados.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i><span>Empleados</span></a></a></form>

                </li>
                <hr class="sidebar-divider">


            </ul>

            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <form class="formulario" action="svModificarCliente" method="GET" style="width: 100%">
                    <% HttpSession misession = request.getSession();
                        Cliente cliente = (Cliente) misession.getAttribute("cliente");
                        {%>

                    <div class="mb-3">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="<%=cliente.getNombre()%>" required>
                    </div>

                    <div class="mb-3">
                        <label>Apellido</label>
                        <input type="text" class="form-control" name="apellido" value="<%=cliente.getApellido()%> "required>
                    </div>

                    <div class="mb-3">
                        <label>Direccion</label>
                        <input type="text" class="form-control" name="direccion" value="<%=cliente.getDireccion()%> "required>
                    </div>

                    <div class="mb-3">
                        <label>DNI</label>
                        <input type="text" class="form-control" name="dni" value="<%=cliente.getDni()%> "required>
                    </div>

                    <div class="mb-3">
                        <label>Fecha De Nacimiento</label>
                        <input class="form-control" name="fecha" type="date" required>
                    </div>

                    <div class="mb-3">
                        <label>Nacionalidad</label>
                        <input class="form-control" name="nacionalidad" value="<%=cliente.getNacionalidad()%> " required>
                    </div>

                    <div class="mb-3">
                        <label>Celular</label>
                        <input class="form-control" name="celular" value="<%=cliente.getCelular()%>" required>
                    </div>

                    <div class="mb-3">
                        <label>Email</label>
                        <input class="form-control" name="email" type="email" value="<%=cliente.getEmail()%>" required>
                    </div>

                    <div>
                        <input type="hidden" name="id" value="<%=cliente.getId()%>">
                    </div>

                    <button type="submit" class="btn btn-primary">Modificar</button>

                    <%}%>
                </form>

            </div>


    </body>

</html>
