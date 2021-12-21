/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
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

@WebServlet(name = "svPaquete", urlPatterns = {"/svPaquete"})
public class svPaquete extends HttpServlet {
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
//          Controladora control = new Controladora();
//        
//        List<PaqueteTuristico> paquetes = control.traerPaquetes();
//        
//        HttpSession misession = request.getSession();
//        
//        misession.setAttribute("paquetes", paquetes);
//        
//        response.sendRedirect("listaPaquete.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String ids_servicios[] = request.getParameterValues("id");
        List<ServicioTuristico> servicios = new ArrayList<ServicioTuristico>();
        for (String ids_servicio : ids_servicios) {
            int id = Integer.parseInt(ids_servicio);
            servicios.add(control.buscarServicio(id));
        }
        
       control.crearPaquete(servicios);              
       
       List<PaqueteTuristico> paquetes = control.traerPaquetes();
      
       request.getSession().setAttribute("paquetes", paquetes);
       
        response.sendRedirect("crearPaquete.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
