
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
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
        
        <div class="otro" style="margin-left: 260px; position: relative">
                <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">DNI</th>
                        <th scope="col">Fecha Nac</th>
                        <th scope="col">Nacionalidad</th>
                        <th scope="col">Celular</th>
                        <th scope="col">Email</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>
                        

                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<Cliente> clientes = (List) misession.getAttribute("listaClientes");
                    for (Cliente cliente : clientes) {
                    %> 
                                      
                    <tr> 
                           <% int id = cliente.getId();%>
                           <td><%=id %> </td>
                           
                           <% String nombre = cliente.getNombre();%>
                           <td><%=nombre %> </td>
                           
                            <% String apellido =cliente.getApellido();%>
                           <td><%=apellido %> </td>
                           
                            <% String direccion =cliente.getDireccion();%>
                           <td><%=direccion %> </td>
                           
                            <% int dni = cliente.getDni();%>
                           <td><%=dni %> </td>
                           
                            <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
                               String fecha = sdf.format(cliente.getFecha_nac());%>
                           <td><%=fecha %> </td>
                           
                           <% String nacionalidad =cliente.getNacionalidad();%>
                           <td><%=nacionalidad %> </td>
                           
                           <% String celu =cliente.getCelular();%>
                           <td><%=celu %> </td>
                           
                           <% String email =cliente.getEmail();%>
                           <td><%=email %> </td>
                           
                           <td>
                               <form action="svEliminarCliente" method="POST">
                                    <input type="hidden" name="id" value="<%=id%>">  
                                    <button type="submit" class="btn btn-danger">Eliminar</button>    
                               </form>
                           </td>
                           
                           <td>
                               <form action="svModificarCliente" method="POST">
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