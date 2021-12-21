package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "servicios_turisticos")
public class ServicioTuristico implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true,nullable = false)
    private int codigo_servicio;
    @Basic
    private String nombre;
    private String descripcion;
    private String destino_servicio;
    private double costo_servicio;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;

    public ServicioTuristico() {
    }

    public ServicioTuristico(int codigo_servicio, String nombre, String descripcion, String destino_servicio, double costo_servicio, Date fecha_servicio) {
        this.codigo_servicio = codigo_servicio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.destino_servicio = destino_servicio;
        this.costo_servicio = costo_servicio;
        this.fecha_servicio = fecha_servicio;

    }

   


    public int getCodigo_servicio() {
        return codigo_servicio;
    }

    public void setCodigo_servicio(int codigo_servicio) {
        this.codigo_servicio = codigo_servicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDestino_servicio() {
        return destino_servicio;
    }

    public void setDestino_servicio(String destino_servicio) {
        this.destino_servicio = destino_servicio;
    }

    public double getCosto_servicio() {
        return costo_servicio;
    }

    public void setCosto_servicio(double costo_servicio) {
        this.costo_servicio = costo_servicio;
    }

    public Date getFecha_servicio() {
        return fecha_servicio;
    }

    public void setFecha_servicio(Date fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    @Override
    public String toString() {
        return "ServicioTuristico{" + "codigo_servicio=" + codigo_servicio + ", nombre=" + nombre + '}';
    }
    
    

}
