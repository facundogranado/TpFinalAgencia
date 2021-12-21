package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.PaqueteTuristico;
import logica.ServicioTuristico;
import logica.Usuario;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {

    ServicioTuristicoJpaController servicioTuristicoJpaController = new ServicioTuristicoJpaController();
    ClienteJpaController clienteJpaController = new ClienteJpaController();
    EmpleadoJpaController empleadoJpaController = new EmpleadoJpaController();
    UsuarioJpaController usuarioJpaController = new UsuarioJpaController();
    PaqueteTuristicoJpaController paqueteTuristicoJpaController = new PaqueteTuristicoJpaController();
    VentaJpaController ventaJpaController = new VentaJpaController();
    
    public void crearServicio(ServicioTuristico servicioTuristico) {
        servicioTuristicoJpaController.create(servicioTuristico);
    }
    
    public List<ServicioTuristico> traerServicios(){
        return servicioTuristicoJpaController.findServicioTuristicoEntities();
    }

    public void crearCliente(Cliente cliente) {
        clienteJpaController.create(cliente);
    }

    public List<Cliente> traerClientes() {
        return clienteJpaController.findClienteEntities();
    }

    public void crearEmpleado(Empleado empleado) {
        try {
            empleadoJpaController.create(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public void crearUsuario(Usuario usuario) {
        usuarioJpaController.create(usuario);
    }

    public List<Empleado> traerEmpleados() {
        return empleadoJpaController.findEmpleadoEntities();
    }

    public void eliminarServicioId(int id) {
        try {
            servicioTuristicoJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ServicioTuristico buscarServicio(int id) {
        return servicioTuristicoJpaController.findServicioTuristico(id);
    }

    public void modificarServicio(ServicioTuristico servicio) {
        try {
            servicioTuristicoJpaController.edit(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarClienteId(int id) {
        try {
            clienteJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cliente buscarCliente(int id) {
        return clienteJpaController.findCliente(id);
    }

    public void modificarCliente(Cliente cliente) {
        try {
            clienteJpaController.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarEmpleado(int id) {
        try {
            empleadoJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Empleado buscarEmpleado(int id) {
        return empleadoJpaController.findEmpleado(id);
    }

    public void modificarEmpleado(Empleado empleado) {
        try {
            empleadoJpaController.edit(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearPaquete(PaqueteTuristico paquete) {
        paqueteTuristicoJpaController.create(paquete);
    }

    public List<PaqueteTuristico> traerPaquetes() {
       return paqueteTuristicoJpaController.findPaqueteTuristicoEntities();
    }

    public void eliminarPaquete(int id) {
        try {
            paqueteTuristicoJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearVenta(Venta venta) {
        ventaJpaController.create(venta);
    }

    public List<Usuario> traerUsuarios() {
        return usuarioJpaController.findUsuarioEntities();
    }

    public List<Venta> traerVentas() {
        return ventaJpaController.findVentaEntities();
    }

    public PaqueteTuristico buscarPaquete(int idPaquete) {
       return paqueteTuristicoJpaController.findPaqueteTuristico(idPaquete);
    }

    public void eliminarVenta(int id) {
        try {
            ventaJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarUsuario(int idUsu) {
        try {
            usuarioJpaController.destroy(idUsu);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarPaquete(PaqueteTuristico paquete) {
        try {
            paqueteTuristicoJpaController.edit(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
