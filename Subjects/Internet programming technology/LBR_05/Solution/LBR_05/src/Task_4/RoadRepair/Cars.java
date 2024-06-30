package Task_4.RoadRepair;
import java.util.concurrent.Semaphore;
public class Cars implements Runnable {
    private Semaphore rightSemaphore;
    private Semaphore leftSemaphore;
    public void setRightSemaphore(Semaphore rightSemaphore) {
        this.rightSemaphore = rightSemaphore;
    }

    public void setLeftSemaphore(Semaphore leftSemaphore) {
        this.leftSemaphore = leftSemaphore;
    }

    public Semaphore getRightSemaphore() {
        return rightSemaphore;
    }

    public Semaphore getLeftSemaphore() {
        return leftSemaphore;
    }
    private int id;
    public Cars(int id) {this.id = id;}
    public int getId() {return id;}

    public void run() {}
}