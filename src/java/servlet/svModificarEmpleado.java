package servlet;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;

@WebServlet(name = "svModificarEmpleado", urlPatterns = {"/svModificarEmpleado"})
public class svModificarEmpleado extends HttpServlet {
    
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        int dni = Integer.valueOf(request.getParameter("dni"));
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        java.sql.Date fecha = Date.valueOf(request.getParameter("fecha"));
        String cargo = request.getParameter("cargo");
        Double sueldo = Double.valueOf(request.getParameter("sueldo"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        Empleado empleado = control.buscarEmpleado(id);
        
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setFecha_nac(fecha);
        empleado.setCargo(cargo);
        empleado.setSaldo(sueldo);
        
        control.modificarEmpleado(empleado);
        
        request.getSession().setAttribute("listaEmpleados", control.traerEmpleados());
        
        response.sendRedirect("Empleados.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Empleado empleado = control.buscarEmpleado(id);
        
        HttpSession misession = request.getSession();
        
        misession.setAttribute("empleado", empleado);
        
        response.sendRedirect("ModificarEmpleado.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
