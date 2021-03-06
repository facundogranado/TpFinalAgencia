package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.PaqueteTuristico;
import logica.ServicioTuristico;
import logica.Venta;

@WebServlet(name = "svEliminarServicio", urlPatterns = {"/svEliminarServicio"})
public class svEliminarServicio extends HttpServlet {
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
        
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();

        try{
            control.eliminarServicioId(id);
            request.getSession().setAttribute("listaServicios", control.traerServicios());
            response.sendRedirect("Servicios.jsp");
            }
        catch(Exception e){
             response.sendRedirect("EliminarServicioPaquete.jsp");
        }
       
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
