package Task_4.RoadRepair;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.Semaphore;

public class Road implements Runnable {
    static Scanner dataInputScanObj = new Scanner(System.in);
    public static int carsOnRightSide;
    public static int carsOnLeftSide;
    static private Semaphore rightSemaphore;
    static private Semaphore leftSemaphore;
    static ArrayList<Cars> roadWithCars;
    static class RentalData {
        public void initialDataInput() {
            System.out.println("Enter the number of cars on one side (right):");
            carsOnRightSide = dataInputScanObj.nextInt();

            System.out.println("Enter the number of cars on one side (left):");
            carsOnLeftSide = dataInputScanObj.nextInt();
        }
    }

    public Road(int carsOnRightSide, int carsOnLeftSide, ArrayList<Cars> roadWithCars) {
        this.carsOnRightSide = carsOnRightSide;
        this.carsOnLeftSide = carsOnLeftSide;
        rightSemaphore = new Semaphore(carsOnRightSide);
        leftSemaphore = new Semaphore(carsOnLeftSide);
        for (Cars cars : roadWithCars) {
            cars.setRightSemaphore(rightSemaphore);
            cars.setLeftSemaphore(leftSemaphore);
        }
    }

    public void run() {
        for (Cars roadWithCars: roadWithCars) {
            new Thread(roadWithCars).start();
        }
    }

    public static void initialValues() {
        ArrayList<Cars> cars = new ArrayList<>();
        for (int i = 0; i < carsOnRightSide + carsOnLeftSide; i++) {
            cars.add(new Cars(i));
        }
        Road roadWithCars = new Road(carsOnRightSide, carsOnLeftSide, cars);
        new Thread(roadWithCars).start();
    }
}
