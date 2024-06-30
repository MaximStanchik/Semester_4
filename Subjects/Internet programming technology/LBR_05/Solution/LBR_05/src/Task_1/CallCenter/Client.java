package Task_1.CallCenter;

public class Client {
    private int id;

    public Client(int id) {
        this.id = id;
    }

    public void makeAnotherCall() {
        try {
            Thread.sleep((int) (Math.random() * 5000 + 1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        CallCenter.run();
    }
}