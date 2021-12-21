
<%@page import="logica.ServicioTuristico"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.PaqueteTuristico"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Cliente"%>
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
        
        <div class="otro" style="margin-left: 275px;" >
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
                    <button type="submit" class="btn btn-primary" style="">Modificar Paquete</button>
                    
                </form> 
         </div>
                <%}%>
    </body>
</html>
