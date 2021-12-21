package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;

@WebServlet(name = "svUsuario", urlPatterns = {"/svUsuario"})
public class svUsuario extends HttpServlet {

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
        
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contrasenia");
        
        Controladora control = new Controladora();
        
        boolean autorizado = control.verificarUsuario(usuario, contra);
        
        if (autorizado) {
            HttpSession misession = request.getSession();
            misession.setAttribute("contrasenia", contra);
            misession.setAttribute("usuario", usuario);
            
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("login.jsp");
        }
        
        
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
