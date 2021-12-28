
<%@page import="logica.PaqueteTuristico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Empleado"%>
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

        <title>Paquetes</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

                    <hr class="sidebar-divider">


                <li class="nav-item active">
                    <form action="svEmpleado" method="GET"><a href="svEmpleado" class="SUBMIT nav-link" href="Empleados.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i><span>Empleados</span></a></a></form>

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
                                                    Paquetes Totales</div>
                                                    <%
                                                        HttpSession misession = request.getSession();
                                                        List<PaqueteTuristico> paquetes = (List) misession.getAttribute("listaPaquetes");
                                                        int totalclientes = paquetes.size();
                                                    %>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=totalclientes%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->


                            <!-- Earnings (Monthly) Card Example -->


                            <!-- Pending Requests Card Example -->

                            <div class="col-xl-3 col-md-6 mb-4">
                                <a href="CrearPaquete.jsp">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">

                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                        Crear Paquete</div>

                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
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
                                    <th scope="col">Id</th>
                                    <th scope="col">Servicios</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Eliminar</th>
                                    <th scope="col">Modificar</th>



                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (PaqueteTuristico paquete : paquetes) {
                                %> 

                                <tr> 
                                    <% int id = paquete.getCodigo_paquete();%>
                                    <td><%=id%> </td>

                                    <%List<ServicioTuristico> servicios = paquete.getServicios();
                                        ArrayList<String> servinombre = new ArrayList<>();
                                        for (ServicioTuristico servicio : servicios) {
                                            servinombre.add(servicio.getNombre());
                                        }


                                    %>
                                    <td><%=servinombre%> </td>

                                    <% double costo = paquete.getCosto_paquete();%>
                                    <td><%=costo%> </td>

                                    <td>
                                        <form action="svEliminarPaquete" method="POST">
                                            <input type="hidden" name="id" value="<%=id%>">  
                                            <button type="submit" class="btn btn-danger">Eliminar</button>    
                                        </form>
                                    </td>

                                    <td>
                                        <form action="svModificarPaquete" method="POST">
                                            <input type="hidden" name="id" value="<%=id%>">  
                                            <button type="submit" class="btn btn-info" >Modificar</button>    
                                        </form>
                                    </td>

                                </tr>
                                <%}%>


                            </tbody>
                        </table>
                    </div>



                </div>




            </div>


    </body>

</html>
