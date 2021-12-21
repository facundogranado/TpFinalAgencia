
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.PaqueteTuristico"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Venta"%>
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
        
        <div class="otro" style="margin-left: 260px;position: relative">
                
             <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Servicios</th>
                        <th scope="col">Paquetes</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Empleado</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Metodo Pago</th>
                        <th scope="col">Total</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>


                    </tr>
                </thead>
                <tbody>
                    <% Controladora control = new Controladora();
                    List<Venta> ventas = control.traerVentas();
                    for (Venta venta : ventas) {
                  %> 
                                      
                    <tr>
                           <% int id = venta.getNum_venta();%>
                           <td><%=id %> </td>
                           
                           <% ServicioTuristico nombreser =  venta.getServiciosTuristicos();%>
                           <td><%=nombreser %> </td>
                           
                            <%PaqueteTuristico servicios = venta.getPaquetesTuristicos();%>
                            
                           <td><%=servicios %> </td>
                           
                            <% Cliente destino = venta.getClientes();%>
                           <td><%=destino %> </td>
                           
                            <% Empleado costo = venta.getEmpleados();%>
                           <td><%=costo %> </td>
                           
                            <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
                               String fecha = sdf.format(venta.getFecha_venta());%>
                           <td><%=fecha %> </td>
                           
                           <% String metodo = venta.getMetodo_pago();%>
                           <td><%=metodo %> </td>

                           <% double total = 0;
                           if (venta.getPaquetesTuristicos() == null) {
                                   total = venta.getServiciosTuristicos().getCosto_servicio();
                               }
                               else{
                                total = venta.getPaquetesTuristicos().getCosto_paquete();
                               }     
                           
                           %>
                           <td><%=total%> </td>
                           
                           <td>
                               <form action="svEliminarVenta" method="POST">
                                    <input type="hidden" name="id" value="<%=id%>">  
                                    <button type="submit" class="btn btn-danger">Eliminar</button>    
                               </form>
                           </td>
                           
                           <td>
                               <form action="#" method="POST">
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
