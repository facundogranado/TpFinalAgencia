package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "svEliminarCliente", urlPatterns = {"/svEliminarCliente"})
public class svEliminarCliente extends HttpServlet {

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
        control.eliminarClienteId(id);
        
        request.getSession().setAttribute("listaClientes", control.traerClientes());
        response.sendRedirect("listaCliente.jsp");
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
