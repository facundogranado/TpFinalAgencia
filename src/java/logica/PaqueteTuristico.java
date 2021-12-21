package logica;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "paquetes_turisticos")
public class PaqueteTuristico implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private int codigo_paquete;
    @Basic
    private double costo_paquete;
    @ManyToMany(fetch=FetchType.EAGER)
    private List<ServicioTuristico> servicios = new ArrayList<>();

    public PaqueteTuristico() {
    }

    public PaqueteTuristico(int codigo_paquete, double costo_paquete, List<ServicioTuristico> servicios) {
        this.codigo_paquete = codigo_paquete;
        this.costo_paquete = costo_paquete;
        this.servicios = servicios;
    }



    public int getCodigo_paquete() {
        return codigo_paquete;
    }

    public void setCodigo_paquete(int codigo_paquete) {
        this.codigo_paquete = codigo_paquete;
    }

    public double getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(double costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public List<ServicioTuristico> getServicios() {
        return servicios;
    }

    public void setServicios(List<ServicioTuristico> servicios) {
        this.servicios = servicios;
    }

    @Override
    public String toString() {
        return "PaqueteTuristico{" + "servicios=" + servicios + '}';
    }

 
    
    

}
