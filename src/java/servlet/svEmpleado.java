package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;

@WebServlet(name = "svEmpleado", urlPatterns = {"/svEmpleado"})
public class svEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        Controladora control = new Controladora();
        
        List<Empleado> empleados = control.traerEmpleados();
        
        HttpSession misession = request.getSession();
        
        misession.setAttribute("listaEmpleados", empleados);
        
        response.sendRedirect("listaEmpleado.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        Controladora control = new Controladora();
        
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
        String nombreUsu = request.getParameter("nombreUsu");
        String contrasenia = request.getParameter("contrasenia");
        
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("apellido", apellido);
        request.getSession().setAttribute("direccion", direccion);
        request.getSession().setAttribute("dni", dni);
        request.getSession().setAttribute("nacionalidad", nacionalidad);
        request.getSession().setAttribute("celular", celular);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("fecha", fecha);
        request.getSession().setAttribute("sueldo", sueldo);
        request.getSession().setAttribute("cargo", cargo);
        request.getSession().setAttribute("nombreUsu", nombreUsu);
        request.getSession().setAttribute("contrasenia", contrasenia);
        
        control.crearEmpleado(nombre,apellido,direccion,dni,nacionalidad,celular,email,fecha,sueldo,cargo,nombreUsu,contrasenia);
        
        response.sendRedirect("crearEmpleado.jsp");
        
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
