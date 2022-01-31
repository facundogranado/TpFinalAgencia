package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Cliente;
import logica.Empleado;
import logica.PaqueteTuristico;
import logica.ServicioTuristico;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-01-04T11:29:53")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, Integer> num_venta;
    public static volatile SingularAttribute<Venta, ServicioTuristico> serviciosTuristicos;
    public static volatile SingularAttribute<Venta, PaqueteTuristico> paquetesTuristicos;
    public static volatile SingularAttribute<Venta, Empleado> empleados;
    public static volatile SingularAttribute<Venta, Date> fecha_venta;
    public static volatile SingularAttribute<Venta, String> metodo_pago;
    public static volatile SingularAttribute<Venta, Cliente> clientes;

}