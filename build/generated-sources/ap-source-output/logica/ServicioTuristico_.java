package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2021-12-20T19:44:46")
@StaticMetamodel(ServicioTuristico.class)
public class ServicioTuristico_ { 

    public static volatile SingularAttribute<ServicioTuristico, String> descripcion;
    public static volatile SingularAttribute<ServicioTuristico, Date> fecha_servicio;
    public static volatile SingularAttribute<ServicioTuristico, Double> costo_servicio;
    public static volatile SingularAttribute<ServicioTuristico, Integer> codigo_servicio;
    public static volatile SingularAttribute<ServicioTuristico, String> nombre;
    public static volatile SingularAttribute<ServicioTuristico, String> destino_servicio;

}