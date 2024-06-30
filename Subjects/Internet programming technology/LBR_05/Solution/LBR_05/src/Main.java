import Task_1.CallCenter.CallCenter;
import Task_2.SkiRental.SkiRental;
import Task_3.CarParking.CarPark.CarPark;
import Task_4.RoadRepair.Road;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        SkiRental.RentalData rentalDataObj = new SkiRental.RentalData();
        Scanner userInputObj = new Scanner(System.in);

        System.out.println();
        System.out.println("Select the problem to be solved");
        System.out.println("1 -- CallCenter");
        System.out.println("2 -- SkiRental");
        System.out.println("3 -- Parking");
        System.out.println("4 -- RoadRepair");
        System.out.println("0 -- Exit");

        int userSelection = userInputObj.nextInt();
        userInputObj.nextLine();

        switch(userSelection) {
            case 1: {
                System.out.println();
                System.out.println("Implementation of the task 'CallCenter':");
                CallCenter.user_input();
                CallCenter.run();
                break;
            }
            case 2: {
                System.out.println();
                System.out.println("Implementation of the task 'SkiRental':");
                rentalDataObj.initialDataInput();
                rentalDataObj.run();
                break;
            }
            case 3: {
                System.out.println();
                System.out.println("Implementation of the task 'Parking':");
                CarPark.initialValues();
                break;
            }
            case 4: {
                System.out.println();
                System.out.println("Implementation of the task 'RoadRepair':");
                Road.initialValues();
                break;
            }
            default: {
                break;
            }
        }
    }
}