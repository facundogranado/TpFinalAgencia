package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.ServicioTuristico;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-01-04T11:29:53")
@StaticMetamodel(PaqueteTuristico.class)
public class PaqueteTuristico_ { 

    public static volatile ListAttribute<PaqueteTuristico, ServicioTuristico> servicios;
    public static volatile SingularAttribute<PaqueteTuristico, Double> costo_paquete;
    public static volatile SingularAttribute<PaqueteTuristico, Integer> codigo_paquete;

}