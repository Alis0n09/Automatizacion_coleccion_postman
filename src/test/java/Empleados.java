import com.intuit.karate.junit5.Karate;

class Empleados {
    @Karate.Test
    Karate testEmpleados() {
        return Karate.run("empleados").relativeTo(getClass());
    }
}