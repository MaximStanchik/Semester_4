package Task_1.CallCenter;

import java.util.Scanner;

public class CallCenter {
    static Scanner userInputObj = new Scanner(System.in);
    static int numberOfOperators;
    static int numberOfClients;
    static Operator[] operators;
    static int[] clients;

    public static void user_input() {
        System.out.println("Enter the number of operators:");
        numberOfOperators = userInputObj.nextInt();
        userInputObj.nextLine();

        System.out.println("Enter the number of clients:");
        numberOfClients = userInputObj.nextInt();
        userInputObj.nextLine();
    }

    public static void run() {
        operators = new Operator[numberOfOperators];
        clients = new int[numberOfClients];

        for (int i = 0; i < operators.length; i++) {
            operators[i] = new Operator(i);
        }

        for (int i = 0; i < clients.length; i++) {
            clients[i] = i + 1;
            final int clientIndex = i;
            Thread clientThread = new Thread(() -> {
                try {
                    Thread.sleep((int) (Math.random() * 5000 + 1000));
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                boolean served = false;
                int operatorIndex = clientIndex % operators.length;
                while (!served) {
                    Operator operator = operators[operatorIndex];
                    synchronized (operator) {
                        if (operator.isReady()) {
                            operator.takeCall();

                            int operatorId = 1 + operator.getId();
                            System.out.println("Client " + clients[clientIndex] + " is being served by Operator " + operatorId);
                            served = true;
                            operator.releaseCall();
                        }
                    }

                    if (!served) {
                        operatorIndex = (operatorIndex + 1) % operators.length;
                        synchronized (clients) {
                            if (clients.length > 0) {
                                System.out.println("Client " + clients[clientIndex] + " is waiting for an available operator.");
                            } else {
                                try {
                                    Thread.sleep((int) (Math.random() * 3000 + 1000));
                                } catch (InterruptedException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    }
                }
            });
            clientThread.start();
        }
    }
}