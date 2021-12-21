package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "ventas")
public class Venta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true,nullable = false)
    private int num_venta;
    @Temporal(TemporalType.DATE)
    private Date fecha_venta;
    @Basic
    private String metodo_pago;
    
    @ManyToOne
    private Cliente clientes;
    @ManyToOne
    private Empleado empleados;
    @ManyToOne
    private PaqueteTuristico paquetesTuristicos;
    @ManyToOne
    private ServicioTuristico serviciosTuristicos;
 

    public Venta() {
    }

    public Venta(int num_venta, Date fecha_venta, String metodo_pago, Cliente clientes, Empleado empleados, PaqueteTuristico paquetesTuristicos, ServicioTuristico serviciosTuristicos) {
        this.num_venta = num_venta;
        this.fecha_venta = fecha_venta;
        this.metodo_pago = metodo_pago;
        this.clientes = clientes;
        this.empleados = empleados;
        this.paquetesTuristicos = paquetesTuristicos;
        this.serviciosTuristicos = serviciosTuristicos;
    }
  
    public int getNum_venta() {
        return num_venta;
    }

    public void setNum_venta(int num_venta) {
        this.num_venta = num_venta;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public String getMetodo_pago() {
        return metodo_pago;
    }

    public void setMetodo_pago(String metodo_pago) {
        this.metodo_pago = metodo_pago;
    }

    public Cliente getClientes() {
        return clientes;
    }

    public void setClientes(Cliente clientes) {
        this.clientes = clientes;
    }

    public Empleado getEmpleados() {
        return empleados;
    }

    public void setEmpleados(Empleado empleados) {
        this.empleados = empleados;
    }

    public PaqueteTuristico getPaquetesTuristicos() {
        return paquetesTuristicos;
    }

    public void setPaquetesTuristicos(PaqueteTuristico paquetesTuristicos) {
        this.paquetesTuristicos = paquetesTuristicos;
    }

    public ServicioTuristico getServiciosTuristicos() {
        return serviciosTuristicos;
    }

    public void setServiciosTuristicos(ServicioTuristico serviciosTuristicos) {
        this.serviciosTuristicos = serviciosTuristicos;
    }

    
    
}
