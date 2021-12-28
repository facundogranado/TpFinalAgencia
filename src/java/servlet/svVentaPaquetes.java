package servlet;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente;
import logica.Controladora;
import logica.Empleado;
import logica.PaqueteTuristico;

@WebServlet(name = "svVentaPaquetes", urlPatterns = {"/svVentaPaquetes"})
public class svVentaPaquetes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        
         int idPaquete= Integer.valueOf(request.getParameter("paqueteTuristico"));
        int idCLiente = Integer.valueOf(request.getParameter("cliente"));
        int idEmpleado = Integer.valueOf(request.getParameter("empleado"));
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        String metodoPago = request.getParameter("metodoPago");
        
        Controladora control = new Controladora();
        
        PaqueteTuristico paquete = control.buscarPaquete(idPaquete);
        Cliente cliente = control.buscarCliente(idCLiente);
        Empleado empleado = control.buscarEmpleado(idEmpleado);
        
        
        control.crearVenta(paquete, cliente, empleado,fecha,metodoPago);
        
        response.sendRedirect("VentaPaquete.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
