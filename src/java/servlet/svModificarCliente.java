package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;

@WebServlet(name = "svModificarCliente", urlPatterns = {"/svModificarCliente"})
public class svModificarCliente extends HttpServlet {

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
        java.sql.Date fecha = java.sql.Date.valueOf(request.getParameter("fecha"));
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Cliente cliente = control.buscarCliente(id);
        
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);
        cliente.setFecha_nac(fecha);
        
        
        control.modificarCliente(cliente);
        
        request.getSession().setAttribute("listaClientes", control.traerClientes());
        
        response.sendRedirect("Clientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
         int id = Integer.parseInt(request.getParameter("id"));
         
        Controladora control = new Controladora();
        Cliente cliente = control.buscarCliente(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("cliente", cliente);
        response.sendRedirect("ModificarCliente.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
