package Task_2.SkiRental;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SkiRental {
    static Client classClientObj = new Client();
    static Scanner dataInputScanObj = new Scanner(System.in);
    public static class RentalData {
        public int numberOfClients;
        public int numberOfAlpineSkis;
        public int numberOfRentalWorkers;
        public boolean isValidFirstCondition = true;
        public boolean isValidSecondCondition = true;
        public int userInput;

        public boolean compareTwoNumbers(int firstNumber, int secondNumber) {
            if (firstNumber >= secondNumber) {
                return true;
            }
            else {
                return false;
            }
        }

        public void initialDataInput() {
            while (isValidFirstCondition) {
                System.out.println("Enter the number of clients:");
                numberOfClients = dataInputScanObj.nextInt();
                for (int i = 0; i < numberOfClients; i++) {
                    System.out.println("Indicate the client's age category:");
                    System.out.println("1--Child");
                    System.out.println("2--Adult");
                    System.out.println("3--Pensioner");
                    userInput = dataInputScanObj.nextInt();

                    switch (userInput) {
                        case 1: {
                            classClientObj.addClientByAgeCategoryToTheEndOfTheList("Child");
                            break;
                        }
                        case 2: {
                            classClientObj.addClientByAgeCategoryToTheEndOfTheList("Adult");
                            break;
                        }
                        case 3: {
                            classClientObj.addClientByAgeCategoryToTheStartOfTheList("Pensioner");
                            break;
                        }
                        default:
                            System.out.println("Invalid age category. Defaulting to Adult.");
                            classClientObj.addClientByAgeCategoryToTheStartOfTheList("Adult");
                            break;
                    }
                }
                System.out.println("Enter the number of alpine skis:");
                numberOfAlpineSkis = dataInputScanObj.nextInt();

                if (compareTwoNumbers(numberOfClients, numberOfAlpineSkis)) {
                    isValidFirstCondition = false;
                }
                else {
                    System.out.println("The number of clients must be greater than or equal to the number of skis. Please try again.");
                }
            }

            while (isValidSecondCondition) {
                System.out.println("Enter the number of rental workers:");
                numberOfRentalWorkers = dataInputScanObj.nextInt();

                if (compareTwoNumbers(numberOfClients, numberOfRentalWorkers)) {
                    isValidSecondCondition = false;
                }
                else {
                    System.out.println("The number of clients must be greater than or equal to the number of rental workers. Please try again.");
                }
            }

            if (numberOfAlpineSkis < numberOfClients) {
                numberOfClients = numberOfAlpineSkis;
            }
        }

        public void run() {
            List<Thread> workerThreads = new ArrayList<>();
            for (int i = 0; i < numberOfRentalWorkers; i++) {
                RentalWorker rentalWorker = new RentalWorker(i + 1, classClientObj, this);
                Thread workerThread = new Thread(rentalWorker);
                workerThreads.add(workerThread);
                workerThread.start();
            }

            for (Thread workerThread : workerThreads) {
                try {
                    workerThread.join();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}