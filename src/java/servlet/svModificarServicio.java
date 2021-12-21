package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.ServicioTuristico;
@WebServlet(name = "svModificarServicio", urlPatterns = {"/svModificarServicio"})
public class svModificarServicio extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
            Controladora control = new Controladora();
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String destinoservicio = request.getParameter("destino_servicio");
            Double costo = Double.parseDouble(request.getParameter("costo_servico"));
            Date fecha = Date.valueOf(request.getParameter("fecha_servicio"));
            
            ServicioTuristico servicio = control.buscarServicio(id);
            servicio.setNombre(nombre);
            servicio.setCosto_servicio(costo);
            servicio.setDescripcion(descripcion);
            servicio.setFecha_servicio(fecha);
            servicio.setDestino_servicio(destinoservicio);
            
            control.modificarServcio(servicio);
            
            request.getSession().setAttribute("listaServicios", control.traerServicios());
            response.sendRedirect("listaServicio.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        ServicioTuristico servi = control.buscarServicio(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("servicio", servi);
        response.sendRedirect("modificarServicio.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
