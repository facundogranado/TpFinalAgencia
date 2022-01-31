
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Servicios</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
                    <form action="svVenta" method="GET"><a href="svVenta" class="SUBMIT nav-link" href=Ventas.jsp"> <i class=" fas fa-solid fa-cash-register"></i><span>Ventas</span></a></a></form>
                </li>


                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <form action="svCliente" method="GET"><a href="svCliente" class="SUBMIT nav-link" href="Clientes.jsp"><i class=" fas fa-solid fa-user"></i><span>Clientes</span></a></a></form>
                </li>

                <hr class="sidebar-divider">

                <li class="nav-item active">
                    <form action="svServicio" method="GET"><a href="svServicio" class="SUBMIT nav-link" href="Servicios.jsp"><i class="fas fa-fw fa-tachometer-alt"></i><span>Servicios</span></a></a></form>

                </li>

                <hr class="sidebar-divider">


                <li class="nav-item active">
                    <form action="svPaquete" method="GET"><a href="svPaquete" class="SUBMIT nav-link" href="Paquetes.jsp"><i class="fas fa-solid fa-box"></i><span>Paquete</span></a></a></form>

                </li>
                <hr class="sidebar-divider">


                <li class="nav-item active">
                    <form action="svEmpleado" method="GET"><a href="svEmpleado" class="SUBMIT nav-link" href="Empleados.jsp"> <i class=" fas fa-solid fa-user-tie"></i><span>Empleados</span></a></a></form>

                </li>
                <hr class="sidebar-divider">


            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Begin Page Content -->
                    <div class="container-fluid">


                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Servicios Totales</div>
                                                    <%
                                                        List<ServicioTuristico> servicios = (List) misession.getAttribute("listaServicios");
                                                        int totalclientes = servicios.size();
                                                    %>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=totalclientes%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-network-wired fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->


                            <!-- Earnings (Monthly) Card Example -->


                            <!-- Pending Requests Card Example -->

                            <div class="col-xl-3 col-md-6 mb-4">
                                <a href="CrearServicio.jsp">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">

                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                        Crear Servicio</div>

                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-object-group fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                            </div>
                        </div>




                    </div>


                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Destino Servicio</th>
                                    <th>Costo Servicio</th>
                                    <th>Fecha Servicio</th>
                                    <th>Eliminar</th>
                                    <th>Modificar</th>


                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    for (ServicioTuristico servicio : servicios) {
                                %> 

                                <tr>
                                    <% int id = servicio.getCodigo_servicio();%>
                                    <td><%=id%> </td>

                                    <% String nombreser = servicio.getNombre();%>
                                    <td><%=nombreser%> </td>

                                    <% String descripcion = servicio.getDescripcion();%>
                                    <td><%=descripcion%> </td>

                                    <% String destino = servicio.getDestino_servicio();%>
                                    <td><%=destino%> </td>

                                    <% Double costo = servicio.getCosto_servicio();%>
                                    <td><%=costo%> </td>

                                    <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                                String fecha = sdf.format(servicio.getFecha_servicio());%>
                                    <td><%=fecha%> </td>

                                    <td>
                                        <form action="svEliminarServicio" method="POST">
                                            <input type="hidden" name="id" value="<%=id%>">  
                                            <button type="submit" class="btn btn-danger">Eliminar</button>    
                                        </form>
                                    </td>

                                    <td>
                                        <form action="svModificarServicio" method="POST">
                                            <input type="hidden" name="id" value="<%=id%>">  
                                            <button type="submit" class="btn btn-info">Modificar</button>    
                                        </form>
                                    </td>

                                </tr>

                                <%}%>



                            </tbody>
                        </table>
                    </div>



                </div>




            </div>

                                <%}%>
    </body>

</html>
