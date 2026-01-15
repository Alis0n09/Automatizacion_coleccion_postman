import com.intuit.karate.junit5.Karate;

class Clientes {
    @Karate.Test
    Karate testClientes() {
        return Karate.run("clientes").relativeTo(getClass());
    }
}