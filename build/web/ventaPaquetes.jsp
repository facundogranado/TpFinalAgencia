
<%@page import="java.util.ArrayList"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.PaqueteTuristico"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/3b47a2eb14.js"crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/styles.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Document</title>
    </head>
    <body>
        
                            <%HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");

            if (usu == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>
        
        <div class="caja">
            <nav class="wrapper">
                <div class="sidebar">
                     <div class="vab">
            <p><a href="#">Admin</a></p>
        </div>
                    <ul>
                        <li>
                            <a href="#"><i class="fas fa-tag"></i></a>Ventas
                            <ul>
                                <li><a href="index.jsp">Venta de Servicios</a></li>
                                <li><a href="ventaPaquetes.jsp">Venta de Paquetes</a></li>
                                <li><a href="listaVentas.jsp">Lista de Ventas</a> </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class=" far fa-grin"></i></a>Clientes
                            <ul>
                                <li><a href="crearCliente.jsp">Crear Cliente</a> </li>
                                <li><form action="svListaClientes" method="GET"><a href="svListaClientes" class="SUBMIT">Lista Clientes</a></form></li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="fab fa-bitbucket"></i> </a>Servicios
                            <ul>
                                <li> <a href="crearServicio.jsp">Crear Servicio</a></li>
                                <li> <form action="svListaServicios" method="GET"><a href="svListaServicios" class="SUBMIT">Lista Servicios</a></form></li>
                            </ul></li>
                        <li><a href="#"><i class="fas fa-archive"></i></a>Paquetes
                            <ul>
                                <li><a href="crearPaquete.jsp">Crear Paquete</a> </li>
                                <li><a href="listaPaquete.jsp">Lista de Paquetes </a></li>
                            </ul></li>
                        <li><a href="#"><i class="fas fa-user"></i></a>Empleados
                            <ul>
                                <li><a href="crearEmpleado.jsp">Crear Empleado</a> </li>
                                <li><form action="svEmpleado" method="GET"><a href="svEmpleado" class="SUBMIT">Lista Empleado</a></form></li>
                            </ul></li>
                    </ul>
                </div>
            </nav>
        </div>
        
        <div class="otro" style="margin-left: 275px">
            
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
                            int id =  paquete.getCodigo_paquete();%>
                            
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
