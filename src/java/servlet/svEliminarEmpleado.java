package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Empleado;

@WebServlet(name = "svEliminarEmpleado", urlPatterns = {"/svEliminarEmpleado"})
public class svEliminarEmpleado extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Empleado empleado = control.buscarEmpleado(id);
        
        int idUsu = empleado.getUsu().getIdUsu();
        control.eliminarEmpleado(id);
        
        control.eliminarUsuario(idUsu);
        
        
        
        request.getSession().setAttribute("listaEmpleados", control.traerEmpleados());
        response.sendRedirect("Empleados.jsp");
               
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
