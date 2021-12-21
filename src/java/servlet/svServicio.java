package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

/**
 *
 * @author facundo
 */
@WebServlet(name = "svServicio", urlPatterns = {"/svServicio"})
public class svServicio extends HttpServlet {

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
            Controladora control = new Controladora();
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String destinoservicio = request.getParameter("destino_servicio");
            Double costo = Double.parseDouble(request.getParameter("costo_servico"));
            Date fecha = Date.valueOf(request.getParameter("fecha_servicio"));
            
            request.getSession().setAttribute("nombre", nombre);
            request.getSession().setAttribute("descripcion", descripcion);
            request.getSession().setAttribute("destinoservicio", destinoservicio);
            request.getSession().setAttribute("costo", costo);
            request.getSession().setAttribute("fecha", fecha);
            
            
            control.crearServicio(nombre,descripcion,destinoservicio,costo,fecha);
            
            
        
            response.sendRedirect("crearServicio.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
