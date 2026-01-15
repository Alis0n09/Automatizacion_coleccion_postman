import com.intuit.karate.junit5.Karate;

class Carreras {
    @Karate.Test
    Karate testCarreras() {
        return Karate.run("carreras").relativeTo(getClass());
    }
}