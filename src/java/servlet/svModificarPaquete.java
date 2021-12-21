/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.PaqueteTuristico;
import logica.ServicioTuristico;


@WebServlet(name = "svModificarPaquete", urlPatterns = {"/svModificarPaquete"})
public class svModificarPaquete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int idpaquete = Integer.valueOf(request.getParameter("id"));
        
        String idServicios[] = request.getParameterValues("idServicios");
        
        Controladora control = new Controladora();
         List<ServicioTuristico> servicios = new ArrayList<ServicioTuristico>();
        for (String ids_servicio : idServicios) {
            int id = Integer.parseInt(ids_servicio);
            servicios.add(control.buscarServicio(id));
        }
        
        PaqueteTuristico paquete = control.buscarPaquete(idpaquete);
        
        paquete.setServicios(servicios);
        
        control.modificarPaquete(paquete);
        
        request.getSession().setAttribute("listaPaquetes", control.traerPaquetes());
        
        response.sendRedirect("listaPaquete.jsp");
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.valueOf(request.getParameter("id"));
        
        Controladora control = new Controladora();
        
        PaqueteTuristico paquete = control.buscarPaquete(id);
        
        HttpSession misession = request.getSession();
        
        misession.setAttribute("paquete", paquete);
        
        response.sendRedirect("modificarPaquete.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
