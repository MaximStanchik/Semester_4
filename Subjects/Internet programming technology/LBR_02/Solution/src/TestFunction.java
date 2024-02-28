public class TestFunction {

    public int getTest() {
        return test;
    }

    public void setSetter(int setter) {
        this.setter = setter;
    }

    int setter;

    public int test;
    public String getValue() {
        extracted();
        return "Hello from first project";
    }

    private static void extracted() {
        System.out.println("I added a little code, just a little )))))");
    }
}