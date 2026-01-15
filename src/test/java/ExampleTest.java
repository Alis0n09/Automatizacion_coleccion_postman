import com.intuit.karate.junit5.Karate;

class ExampleTest {
    @Karate.Test
    Karate testExample() {
        return Karate.run("example").relativeTo(getClass());
    }
}
