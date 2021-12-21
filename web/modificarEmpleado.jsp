
<%@page import="logica.Empleado"%>
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

        <div class="otro" style="position: relative">
            <form class="formulario" action="svModificarEmpleado" method="GET" style="margin-left: 275px; position: relative; width: 100%" >
                <% 
                    Empleado empleado = (Empleado) misession.getAttribute("empleado");
                    
                    {%>
                <div class="mb-3">
                    <label>Nombre</label>
                    <input type="text" class="form-control" name="nombre" value="<%=empleado.getNombre()%>" required>
                </div>

                <div class="mb-3">
                    <label>Apellido</label>
                    <input type="text" class="form-control" name="apellido" value="<%=empleado.getApellido()%>" required>
                </div>

                <div class="mb-3">
                    <label>Direccion</label>
                    <input type="text" class="form-control" name="direccion" value="<%=empleado.getDireccion()%>" required>
                </div>

                <div class="mb-3">
                    <label>DNI</label>
                    <input type="text" class="form-control" name="dni" value="<%=empleado.getDni()%>" required>
                </div>

                <div class="mb-3">
                    <label>Fecha De Nacimiento</label>
                    <input class="form-control" name="fecha" type="date" value="<%=empleado.getFecha_nac()%>" required>
                </div>

                <div class="mb-3">
                    <label>Nacionalidad</label>
                    <input class="form-control" name="nacionalidad" value="<%=empleado.getNacionalidad()%>" required>
                </div>

                <div class="mb-3">
                    <label>Celular</label>
                    <input class="form-control" name="celular" value="<%=empleado.getCelular()%>" required> 
                </div>

                <div class="mb-3">
                    <label>Email</label>
                    <input class="form-control" name="email" type="email" value="<%=empleado.getEmail()%>" required>
                </div>

                <div class="mb-3">
                    <label>Cargo</label>
                    <input class="form-control" name="cargo" value="<%=empleado.getCargo()%>" required>
                </div>
                
                <div class="mb-3">
                    <label>Sueldo</label>
                    <input class="form-control" name="sueldo" value="<%=empleado.getSaldo()%>" required>
                </div>
                
                <div class="mb-3">
                    <label>Nombre Usuario</label>
                    <input class="form-control" name="nombreUsu" value="<%=empleado.getUsu().getNombreUsu()%>" required>
                </div>
                
                <div class="mb-3">
                    <label>Contraseña</label>
                    <input class="form-control" name="contrasenia" type="password" value="<%=empleado.getUsu().getContrasenia()%>" required>
                </div>
                    
                <div>
                    <input type="hidden" name="id" value="<%=empleado.getId()%>">
                </div>
                
                <button type="submit" class="btn btn-primary">Modificar</button>
                
                <%}%>
            </form>

        </div>
            
            <%}%>
    </body>
</html>