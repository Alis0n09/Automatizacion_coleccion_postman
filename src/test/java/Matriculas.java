import com.intuit.karate.junit5.Karate;

class Matriculas {
    @Karate.Test
    Karate testMatriculas() {
        return Karate.run("matriculas").relativeTo(getClass());
    }
}