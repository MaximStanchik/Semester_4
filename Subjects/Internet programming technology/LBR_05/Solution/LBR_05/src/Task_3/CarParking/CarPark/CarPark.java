package Task_3.CarParking.CarPark;

import Task_3.CarParking.Car.Car;

import java.util.ArrayList;
import java.util.concurrent.Semaphore;

public class CarPark implements Runnable {
    static private int _firstPark;
    static private int _secondPark;
    static private Semaphore firstSemaphore;
    static private Semaphore secondSemaphore;
    static ArrayList<Car> cars;

    public CarPark (int firstCount,int secondCount, ArrayList<Car> ListCars) {
        _firstPark = firstCount;
        _secondPark = secondCount;
        firstSemaphore = new Semaphore(_firstPark);
        secondSemaphore = new Semaphore(_secondPark);
        cars = ListCars;
        for(Car car: cars) {
            car.setFirstSemaphore(firstSemaphore);
            car.setSecondSemaphore(firstSemaphore);
        }
    }

    public void run() {
        for (Car car:cars) {
            new Thread(car).start();
        }
    }

    public static void initialValues () {
        ArrayList<Car> cars = new ArrayList<Car>();
        cars.add(new Car(1));
        cars.add(new Car(2));
        cars.add(new Car(3));
        cars.add(new Car(4));
        cars.add(new Car(5));
        cars.add(new Car(6));
        cars.add(new Car(7));
        cars.add(new Car(8));
        cars.add(new Car(9));
        cars.add(new Car(10));
        cars.add(new Car(11));
        CarPark park = new CarPark (3,3,cars);
        new Thread(park).start();
    }
}