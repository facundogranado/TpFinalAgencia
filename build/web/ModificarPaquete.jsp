
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.PaqueteTuristico"%>
<%@page import="logica.PaqueteTuristico"%>
<%@page import="logica.ServicioTuristico"%>
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

        <title>Modificar Paquete</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styles.css"/>
        <script src="https://kit.fontawesome.com/3b47a2eb14.js" crossorigin="anonymous"></script>
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
                <%HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");

            if (usu == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>
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
                    <form action="svCliente" method="GET"><a href="svCliente" class="SUBMIT nav-link" href="Clientes.jsp"><i class="fas fa-fw fa-tachometer-alt"></i><span>Clientes</span></a></a></form>
                </li>


                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <form action="svServicio" method="GET"><a href="svServicio" class="SUBMIT nav-link" href="Servicios.jsp"><i class="fas fa-fw fa-tachometer-alt"></i><span>Servicios</span></a></a></form>

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
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 200px">Nombre</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Agregar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="svModificarPaquete" method="GET" class="formulario" style="width: 100%;position: relative;">
                        <%
                            PaqueteTuristico paquete = (PaqueteTuristico) misession.getAttribute("paquete");
                            Controladora control = new Controladora();
                            List<ServicioTuristico> servicios = control.traerServicios();
                            for (ServicioTuristico servicio : servicios) {
                        %> 
                        <tr>


                            <% String nombreser = servicio.getNombre();%>
                            <td><%=nombreser%></td>

                            <% double precio = servicio.getCosto_servicio();%>
                            <td><%=precio%></td>

                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" name="idServicios" value="<%=servicio.getCodigo_servicio()%>"> 
                                </div>                     
                            </td>
                        </tr>
                        <%}%>


                        </tbody>


                </table>   
                <input type="hidden" name="id" value="<%=paquete.getCodigo_paquete()%>">
                <button type="submit" class="btn btn-primary" style="width: 100px">Modificar Paquete</button>

                </form> 


            </div>
<%}%> 

    </body>

</html>
