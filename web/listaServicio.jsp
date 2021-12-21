
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="logica.ServicioTuristico"%>
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

        <div class="otro" style="margin-left: 260px; position: relative ">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Destino</th>
                        <th scope="col">Costo</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>


                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<ServicioTuristico> servicios = (List) misession.getAttribute("listaServicios");
                    for (ServicioTuristico servicio : servicios) {
                  %> 
                                      
                    <tr>
                           <% int id = servicio.getCodigo_servicio();%>
                           <td><%=id %> </td>
                           
                           <% String nombreser = servicio.getNombre();%>
                           <td><%=nombreser %> </td>
                           
                            <% String descripcion = servicio.getDescripcion();%>
                           <td><%=descripcion %> </td>
                           
                            <% String destino = servicio.getDestino_servicio();%>
                           <td><%=destino %> </td>
                           
                            <% Double costo = servicio.getCosto_servicio();%>
                           <td><%=costo %> </td>
                           
                            <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
                               String fecha = sdf.format(servicio.getFecha_servicio());%>
                           <td><%=fecha %> </td>
                           
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
                        <%}%>
    </body>
</html>
