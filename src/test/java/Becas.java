import com.intuit.karate.junit5.Karate;

class Becas {
    @Karate.Test
    Karate testBecas() {
        return Karate.run("becas").relativeTo(getClass());
    }
}