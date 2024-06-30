package Task_2.SkiRental;

public class RentalWorker implements Runnable {
    private final int workerId;
    static Client classClientObj = new Client();
    private final SkiRental.RentalData rentalData;

    public RentalWorker(int workerId, Client classClientObj, SkiRental.RentalData rentalData) {
        this.workerId = workerId;
        this.classClientObj = classClientObj;
        this.rentalData = rentalData;
    }

    @Override
    public void run() {
        while (true) {
            try {
                String client = classClientObj.getNextClient();
                if (client != null) {
                    System.out.println("Worker " + workerId + " is serving client: " + client);
                    Thread.sleep(2000);
                    System.out.println("Worker " + workerId + " has finished serving client: " + client);
                } else {
                    System.out.println("No clients at the moment. Worker " + workerId + " is waiting.");
                    Thread.sleep(1000);
                }
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}