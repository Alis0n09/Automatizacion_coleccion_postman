import com.intuit.karate.junit5.Karate;

class Segumientos {
    @Karate.Test
    Karate testSeguimientos() {
        return Karate.run("seguimientos").relativeTo(getClass());
    }
}