
<%@page import="logica.PaqueteTuristico"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Venta Paquete</title>

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

                <form action="svVentaPaquetes" class="formulario" style="width: 100%" method="POST">
                    <div class="mb-3">
                        <label for="inputState" class="form-label">Paquete Turistico</label>
                        <select id="inputState" class="form-select" name="paqueteTuristico" style="width: 300px" required>
                            <option selected value="">Elegir...</option>
                            <%Controladora control = new Controladora();
                                List<PaqueteTuristico> paquetes = control.traerPaquetes();

                                for (PaqueteTuristico paquete : paquetes) {
                            %>  
                            <%
                                List<ServicioTuristico> servicios = paquete.getServicios();
                                ArrayList<String> servinombre = new ArrayList<>();
                                for (ServicioTuristico servicio : servicios) {
                                    servinombre.add(servicio.getNombre());
                                }
                                int id = paquete.getCodigo_paquete();%>

                            <option value="<%=id%>"><%=servinombre%></option>

                            <%}%>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="inputState" class="form-label">Cliente</label>
                        <select id="inputState" class="form-select" name="cliente" style="width: 300px" required>
                            <option selected value="">Elegir...</option>
                            <%
                                List<Cliente> clientes = control.traerClientes();

                                for (Cliente cliente : clientes) {
                            %>  
                            <% String nombre = cliente.getNombre();%>
                            <% String apellido = cliente.getApellido();%>
                            <% int idcliente = cliente.getId();%>
                            <option value="<%=idcliente%>"><%=nombre%> <%=apellido%></option>

                            <%}%>

                        </select>
                    </div>   

                    <div class="mb-3">
                        <label for="inputState" class="form-label">Empleado</label>
                        <select id="inputState" class="form-select" name="empleado" style="width: 300px" required>
                            <option selected value="">Elegir...</option>

                            <%
                                List<Empleado> empleado = control.traerEmpleados();

                                for (Empleado empleado1 : empleado) {
                            %>  
                            <% String nombre = empleado1.getNombre();%>
                            <% String apellido = empleado1.getApellido();%>
                            <% int idempleado = empleado1.getId();%>
                            <option value="<%=idempleado%>"><%=nombre%>  <%=apellido%> </option>

                            <%}%>


                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="inputState" class="form-label">Metodo de Pago</label>
                        <select id="inputState" class="form-select" name="metodoPago" style="width: 300px" required>
                            <option selected value="">Elegir...</option>
                            <option>Efectivo</option>
                            <option>Tarjeta de Debito</option>
                            <option>Tarjeta de Credito</option>
                            <option>Monedero Virtual</option>
                            <option>Transferencia</option>

                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Fecha</label>
                        <input class="form-control" name="fecha" type="date" style="margin-left: 0; width: 300px" required>
                    </div>


                    <button type="submit" class="btn btn-primary">Aceptar</button>

                </form>



            </div>

<%}%> 
    </body>

</html>
