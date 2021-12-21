package logica;

import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controladoraPersistencia = new ControladoraPersistencia();
 

    public void crearServicio(String nombre, String descripcio, String destinoservicio, Double costo, Date fecha) {
        ServicioTuristico servicio = new ServicioTuristico();
        servicio.setNombre(nombre);
        servicio.setDescripcion(descripcio);
        servicio.setDestino_servicio(destinoservicio);
        servicio.setCosto_servicio(costo);
        servicio.setFecha_servicio(fecha);
        controladoraPersistencia.crearServicio(servicio);
    
    }
    
    public List<ServicioTuristico> traerServicios(){
        return controladoraPersistencia.traerServicios();
    }



    public void crearCliente(String nombre, String apellido, String direccion, int dni,String nacionalidad, String celular, String email,Date fecha) {
        Cliente cliente = new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);
        cliente.setFecha_nac(fecha);
        controladoraPersistencia.crearCliente(cliente);
        
    }

    public List<Cliente> traerClientes() {
        return controladoraPersistencia.traerClientes();
    }

    public void crearEmpleado(String nombre, String apellido, String direccion, int dni, String nacionalidad, String celular, String email,Date fecha, Double sueldo, String cargo, String nombreUsu, String contrasenia) {
        Empleado empleado = new Empleado();
        Usuario usuario = new Usuario();

        
        usuario.setContrasenia(contrasenia);
        usuario.setNombreUsu(nombreUsu);
        
        controladoraPersistencia.crearUsuario(usuario);
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setFecha_nac(fecha);
        empleado.setCargo(cargo);
        empleado.setSaldo(sueldo);
        empleado.setUsu(usuario);
        controladoraPersistencia.crearEmpleado(empleado);
        
        
    }

    public List<Empleado> traerEmpleados() {
       return controladoraPersistencia.traerEmpleados();
    }

    public void eliminarServicioId(int id) {
        controladoraPersistencia.eliminarServicioId(id);
    }

    public ServicioTuristico buscarServicio(int id) {
        return controladoraPersistencia.buscarServicio(id);
    }

    public void modificarServcio(ServicioTuristico servicio) {
        controladoraPersistencia.modificarServicio(servicio);
    }

    public void eliminarClienteId(int id) {
        controladoraPersistencia.eliminarClienteId(id);
    }

    public Cliente buscarCliente(int id) {
        return controladoraPersistencia.buscarCliente(id);
    }

    public void modificarCliente(Cliente cliente) {
        controladoraPersistencia.modificarCliente(cliente);
    }

    public void eliminarEmpleado(int id) {
        controladoraPersistencia.eliminarEmpleado(id);
    }

    public Empleado buscarEmpleado(int id) {
        return controladoraPersistencia.buscarEmpleado(id);
    }

    public void modificarEmpleado(Empleado empleado) {
        controladoraPersistencia.modificarEmpleado(empleado);
    }

    public void crearPaquete(List<ServicioTuristico> servicios) {
        
        double total = 0,totalDescuento = 0;
        for (ServicioTuristico servicio : servicios) {
            total += servicio.getCosto_servicio();
        }
        totalDescuento = (10*total)/100;
        total -= totalDescuento; 
        PaqueteTuristico paquete = new PaqueteTuristico();
        paquete.setServicios(servicios);
        paquete.setCosto_paquete(total);
        controladoraPersistencia.crearPaquete(paquete);
    }
    
  public List<PaqueteTuristico> traerPaquetes(){
      return controladoraPersistencia.traerPaquetes();
  }

    public void eliminarPaqueteId(int id) {
        controladoraPersistencia.eliminarPaquete(id);
    }


    
    public boolean verificarUsuario(String usuario,String contra){
        
        List<Usuario> listaUsuario = controladoraPersistencia.traerUsuarios();
        
        if (listaUsuario != null){
            for (Usuario usuario1 : listaUsuario) {
                if (usuario1.getNombreUsu().equals(usuario) && usuario1.getContrasenia().equals(contra)) {
                    return  true;
                }
            }
        }
        
        return false;
    
    }
    
    
    public List<Venta> traerVentas(){
        return controladoraPersistencia.traerVentas();
    }

    public PaqueteTuristico buscarPaquete(int idPaquete) {
        return controladoraPersistencia.buscarPaquete(idPaquete);
    }


    public void crearVenta(PaqueteTuristico paquete, Cliente cliente, Empleado empleado,Date fecha,String metodoPago) {
        Venta venta = new Venta();
        
        venta.setClientes(cliente);
        venta.setEmpleados(empleado);
        venta.setFecha_venta(fecha);
        venta.setPaquetesTuristicos(paquete);
        venta.setMetodo_pago(metodoPago);
        
        controladoraPersistencia.crearVenta(venta);
        
    }

    public void crearVenta(ServicioTuristico servicio, Cliente cliente, Empleado empleado,Date fecha, String metodoPago) {
                Venta venta = new Venta();
        
        venta.setClientes(cliente);
        venta.setEmpleados(empleado);
        venta.setFecha_venta(fecha);
        venta.setServiciosTuristicos(servicio);
        venta.setMetodo_pago(metodoPago);
        
        controladoraPersistencia.crearVenta(venta);
        

    }

    public void eliminarVenta(int id) {
        controladoraPersistencia.eliminarVenta(id);
    }

    public void eliminarUsuario(int idUsu) {
        controladoraPersistencia.eliminarUsuario(idUsu);
    }

    public void modificarPaquete(PaqueteTuristico paquete) {
        controladoraPersistencia.modificarPaquete(paquete);
        
    }

    
}
