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
import logica.Cliente;
import logica.Controladora;
import logica.Empleado;
import logica.ServicioTuristico;
import logica.Venta;

@WebServlet(name = "svVenta", urlPatterns = {"/svVenta"})
public class svVenta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        Controladora control = new Controladora();
        List<Venta> listaVentas = control.traerVentas();
        HttpSession misession = request.getSession();
        misession.setAttribute("listaVentas",listaVentas);
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        Controladora control = new Controladora();
        int idServicio = Integer.valueOf(request.getParameter("servicioTuristico"));
        int idCLiente = Integer.valueOf(request.getParameter("cliente"));
        int idEmpleado = Integer.valueOf(request.getParameter("empleado"));
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        String metodoPago = request.getParameter("metodoPago");
        
        request.getSession().setAttribute("idServicio", idServicio);
        request.getSession().setAttribute("idCliente", idCLiente);
        request.getSession().setAttribute("idEmpleado", idEmpleado);
        request.getSession().setAttribute("metodoPago", metodoPago);
        
        ServicioTuristico servicio = control.buscarServicio(idServicio);
        Cliente cliente = control.buscarCliente(idCLiente);
        Empleado empleado = control.buscarEmpleado(idEmpleado);
        
        
        
        control.crearVenta(servicio,cliente,empleado,fecha,metodoPago); 
        
        response.sendRedirect("VentaServicio.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
