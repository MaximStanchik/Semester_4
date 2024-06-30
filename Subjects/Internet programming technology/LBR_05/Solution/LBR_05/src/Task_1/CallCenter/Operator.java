package Task_1.CallCenter;

public class Operator {
    private int id;
    private boolean isReady = true;

    public Operator(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public synchronized boolean isReady() {
        return isReady;
    }

    public synchronized void takeCall() {
        isReady = false;
    }

    public synchronized void releaseCall() {
        isReady = true;
    }

    public synchronized boolean isAvailable() {
        return isReady;
    }
}