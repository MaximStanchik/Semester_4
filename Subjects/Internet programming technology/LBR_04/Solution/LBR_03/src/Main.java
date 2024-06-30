import java.util.Scanner;
import InfoAboutAccounts.EntranceInAccount;
import java.io.File;
import java.io.Serializable;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import Validation.XSDValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import Validation.DOMParser;

public class Main implements Serializable {
    public static void main(String[] args) {
        EntranceInAccount EntranceInAccountObj= new EntranceInAccount();
        Scanner consoleInputObj = new Scanner(System.in);
        EntranceInAccount.CardType[] cardTypes = EntranceInAccount.CardType.values();

        String xmlDoc = "D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Subjects\\Internet programming technology\\LBR_04\\Solution\\LBR_03\\files\\Bank.xml";
        String schemaDoc = "D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Subjects\\Internet programming technology\\LBR_04\\Solution\\LBR_03\\files\\Bank.xsd";
        XSDValidation XSDvalidator = new XSDValidation(xmlDoc, schemaDoc);

        EntranceInAccountObj.DeserializeFromFile("D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Subjects\\Internet programming technology\\LBR_04\\Solution\\LBR_03\\SaveData\\SaveData.json");
        int inputValue = 0;

        System.out.println();
        System.out.println("--------------Everglade Bank--------------");
        System.out.println();
        System.out.println("--------------Exchange rates--------------");
        System.out.println("From Feb 16 16:00      purchase      sale ");
        System.out.println("1 USD                      3.21      3.275");
        System.out.println("1 EUR                      3.45      3.52 ");
        System.out.println("100 RUB                    3.45      3.52 ");
        System.out.println("10 CNY                     4.46      4.56 ");
        System.out.println();

        System.out.println("1--Enter");
        System.out.println("0--Exit");
        System.out.println();

        inputValue = consoleInputObj.nextInt();
        consoleInputObj.nextLine();

        switch(inputValue){
            case 0: {
                System.exit(0);
                break;
            }
            case 1: {
                System.out.println("Enter the data:");
                System.out.print("Username:");
                String username = consoleInputObj.nextLine();
                if ( EntranceInAccountObj.checkIfUsernameIsValid(username) != -1) {
                    System.out.print("Access key:");
                    String accessKey = consoleInputObj.nextLine();
                    System.out.println();
                    int accessKeyResult = EntranceInAccountObj.checkIfAccessKeyIsValid(accessKey);
                    if (accessKeyResult != -1) {
                        System.out.println("--------------Personal Area--------------");
                        System.out.println("1--View balance");
                        System.out.println("2--Top up your card balance");
                        System.out.println("3--Block the card");
                        System.out.println("4--Transfer money to card");
                        if (EntranceInAccountObj.viewAccessLevel(accessKeyResult) == "administrator"){
                            System.out.println("5--Block the card");
                            System.out.println("6--Reissue a bank card");
                            System.out.println("7--Check xml document for validity");
                            System.out.println("8--Parsing xml document");
                        }
                        System.out.println("0--Exit");

                        Object[] accountInfo = EntranceInAccountObj.passkeys[accessKeyResult];
                        Object[][] accountDetails = (Object[][]) accountInfo[3];

                        String cardNumberRegex = "\\d{4}( \\d{4}){3}";

                        inputValue = consoleInputObj.nextInt();
                        consoleInputObj.nextLine();

                        switch(inputValue){
                            case 0: {
                                break;
                            }
                            case 1: {
                                for (int i = 0; i < accountDetails.length; i++ ) {
                                    System.out.println("____________________________________________");
                                    System.out.println("|              Everglade Bank              ");
                                    System.out.println("|Card Type: " + accountDetails[i][0] + "   ");
                                    System.out.println("|Balance: " + accountDetails[i][1] + "     ");
                                    System.out.println("|                                          ");
                                    System.out.println("|Access: " + accountDetails[i][3] + "      ");
                                    System.out.println("|Card Number: " + accountDetails[i][2] + " ");
                                    System.out.println("|__________________________________________");
                                }
                                break;
                            }
                            case 2: {
                                System.out.println("Example: xxxx xxxx xxxx xxxx (x c [0;9])");

                                System.out.println("Enter the card number from which you want to transfer funds:");
                                String firstUserCardNumber = consoleInputObj.nextLine();
                                boolean firstUserCardNumberChecking = firstUserCardNumber.matches(cardNumberRegex);

                                if (!firstUserCardNumberChecking){
                                    System.out.println("The card number entered does not match the example");
                                    //тут как-то надо цикл добавить
                                }
                                else {
                                    System.out.println("Enter the card number to which you want to transfer funds:");
                                    String secondUserCardNumber = consoleInputObj.nextLine();
                                    boolean secondUserCardNumberChecking = secondUserCardNumber.matches(cardNumberRegex);//////

                                    if (!secondUserCardNumberChecking){
                                        System.out.println("The card number entered does not match the example");
                                        //тут как-то надо цикл добавить
                                    }
                                    else {
                                        for (int i = 0; i < accountDetails.length; i++ ) {
                                            System.out.println("firstUserCardNumber: " + firstUserCardNumber);
                                            System.out.println("accountDetails[i][2].toString(): " + accountDetails[i][2].toString());
                                            if (accountDetails[i][2].toString().compareTo(firstUserCardNumber) == 0) {
                                                int moneyInTheFirstAcc = Integer.parseInt(accountDetails[i][1].toString());
                                                for (int m = 0; m < accountDetails.length; m++) {
                                                    if (accountDetails[m][2].toString().compareTo(secondUserCardNumber) ==0) {
                                                        int moneyInTheSecondAcc = Integer.parseInt(accountDetails[i][1].toString());
                                                        System.out.println("Enter the amount of money to transfer:");
                                                        String amountOfMoneyToTransferUserInput = consoleInputObj.nextLine();
                                                        int amountOfMoneyToTransfer = Integer.parseInt(amountOfMoneyToTransferUserInput);

                                                        if (amountOfMoneyToTransfer < 0) {
                                                            System.out.println("Invalid input");
                                                            //добавить цикл
                                                        }
                                                        else if (amountOfMoneyToTransfer > moneyInTheFirstAcc) {
                                                            System.out.println("Insufficient funds for transfer");
                                                            //добавить цикл
                                                        }
                                                        else {
                                                            moneyInTheSecondAcc = moneyInTheSecondAcc + amountOfMoneyToTransfer;
                                                            accountDetails[i][1] = String.valueOf(moneyInTheSecondAcc);
                                                            System.out.println("Money was successfully transferred to the card account with the number " + secondUserCardNumber);
                                                        }
                                                    }
                                                }
                                            }
                                            else {
                                                System.out.println("The card number from which you want to transfer funds not found");
                                            }
                                        }
                                    }
                                }
                                break;
                            }
                            case 3: {
                                System.out.println("Example: xxxx xxxx xxxx xxxx (x c [0;9])");
                                System.out.println("Enter the number of the card you want to block:");

                                String userCardNumber = consoleInputObj.nextLine();

                                boolean inputValueChecking = userCardNumber.matches(cardNumberRegex);

                                if (!inputValueChecking){
                                    System.out.println("The card number entered does not match the example");
                                    //добавить цикл
                                }
                                else {
                                    for (int i = 0; i < accountDetails.length; i++ ) {
                                        if (accountDetails[i][2].toString().compareTo(userCardNumber) == 0) {
                                            accountDetails[i][3] = "blocked";
                                            System.out.println("The card was successfully blocked");
                                        }
                                        else {
                                            System.out.println("Card number not found");
                                        }
                                    }
                                }
                                break;
                            }
                            case 4: {
                                System.out.println("Enter the card number to which you want to transfer money:");
                                break;
                            }
                            case 5: {
                                System.out.println("Enter user:");
                                String user = consoleInputObj.nextLine();
                                for (int i = 0; i < EntranceInAccountObj.passkeys.length; i++) {
                                    if (EntranceInAccountObj.passkeys[i][0].toString().compareTo(user) == 0) {
                                        Object[][] passkeys = EntranceInAccountObj.passkeys;
                                        Object[][] account = (Object[][]) passkeys[i][3];

                                        System.out.println("All user cards:");
                                        System.out.println();

                                        for (int m = 0; m < account.length; m++) {
                                            System.out.println("____________________________________________");
                                            System.out.println("|              Everglade Bank               ");
                                            System.out.println("|Card Type: " + account[m][0] + "           ");
                                            System.out.println("|Balance: " + account[m][1] + "             ");
                                            System.out.println("|                                           ");
                                            System.out.println("|Access: " + account[m][3] + "              ");
                                            System.out.println("|Card Number: " + account[m][2] + "         ");
                                            System.out.println("|___________________________________________");
                                        }
                                        System.out.println("Example: xxxx xxxx xxxx xxxx (x c [0;9])");
                                        System.out.println("Enter the number of the card you want to block:");

                                        String userCardNumber = consoleInputObj.nextLine();

                                        boolean inputValueChecking = userCardNumber.matches(cardNumberRegex);

                                        if (!inputValueChecking) {
                                            System.out.println("The card number entered does not match the example");
                                            //добавить цикл
                                        }

                                        int l;
                                        boolean cardFound = false;
                                        for (l = 0; l < account.length; l++) {
                                            if (account[l][2].toString().compareTo(userCardNumber) == 0) {
                                                cardFound = true;
                                                break;
                                            }
                                        }
                                        if (!cardFound) {
                                            System.out.println("The card with the entered number is missing");
                                            //добавить цикл
                                        }
                                        else {
                                            System.out.println("Set access level:");
                                            System.out.println("1--Allowed");
                                            System.out.println("2--Blocked");
                                            System.out.println("0--Exit");

                                            inputValue = consoleInputObj.nextInt();
                                            consoleInputObj.nextLine();

                                            switch(inputValue) {
                                                case 1: {
                                                    account[l][3] = "allowed";
                                                    break;
                                                }
                                                case 2: {
                                                    account[l][3] = "blocked";
                                                    break;
                                                }
                                                case 0: {
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }

                                break;
                            }
                            case 6: {
                                System.out.println("Enter user:");
                                String user = consoleInputObj.nextLine();
                                for (int i = 0; i < EntranceInAccountObj.passkeys.length; i++){
                                    if(EntranceInAccountObj.passkeys[i][0].toString().compareTo(user)==0) {
                                        Object[][] passkeys = EntranceInAccountObj.passkeys;
                                        Object[][] account = (Object[][]) passkeys[i][3];

                                        System.out.println("All user cards:");
                                        System.out.println();

                                        for (int m = 0; m < account.length; m++ ) {
                                            System.out.println("___________________________________________");
                                            System.out.println("|              Everglade Bank              ");
                                            System.out.println("|Card Type: " + account[m][0] + "          ");
                                            System.out.println("|Balance: " + account[m][1] + "            ");
                                            System.out.println("|                                          ");
                                            System.out.println("|Access: " + account[m][3] + "             ");
                                            System.out.println("|Card Number: " + account[m][2] +"         ");
                                            System.out.println("|__________________________________________");
                                        }

                                        System.out.println("Example: xxxx xxxx xxxx xxxx (x c [0;9])");
                                        System.out.println("Enter the number of the card you want to reissue:");

                                        String userCardNumber = consoleInputObj.nextLine();

                                        boolean inputValueChecking = userCardNumber.matches(cardNumberRegex);

                                        if (!inputValueChecking) {
                                            System.out.println("The card number entered does not match the example");
                                            //добавить цикл
                                        }

                                        int m;
                                        boolean cardFound = false;
                                        for (m = 0; m < account.length; m++) {
                                            if (account[m][2].toString().compareTo(userCardNumber) == 0) {
                                                cardFound = true;
                                                break;
                                            }
                                        }

                                        if (!cardFound) {
                                            System.out.println("The card with the entered number is missing");
                                            //добавить цикл
                                        }

                                        System.out.println("1--Change card number");
                                        System.out.println("2--Change card type");
                                        System.out.println("0--Exit");
                                        System.out.println();
                                        System.out.println("Enter value:");

                                        inputValue = consoleInputObj.nextInt();
                                        consoleInputObj.nextLine();

                                        switch(inputValue) {
                                            case 1: {
                                                System.out.println("Example: xxxx xxxx xxxx xxxx (x c [0;9])");
                                                System.out.println("Enter a new bank card number according to the example:");

                                                String newUserCardNumber = consoleInputObj.nextLine();

                                                boolean newUserCardNumberChecking = userCardNumber.matches(cardNumberRegex);

                                                if (!newUserCardNumberChecking) {
                                                    System.out.println("The card number entered does not match the example");
                                                    //добавить цикл
                                                }
                                                else {
                                                    userCardNumber = newUserCardNumber;
                                                    account[m][2] = userCardNumber;
                                                    System.out.println("New card number has been successfully installed");
                                                }
                                                break;
                                            }
                                            case 2: {
                                                System.out.println("Select a new type of bank card:");
                                                System.out.println("1--UnityCash");
                                                System.out.println("2--AuroraPay");
                                                System.out.println("3--StellarSpend");
                                                System.out.println("4--NexusCard");
                                                System.out.println("5--HarmonyPlus");
                                                System.out.println();
                                                System.out.println("Enter value:");

                                                inputValue = consoleInputObj.nextInt();
                                                consoleInputObj.nextLine();

                                                switch (inputValue) {
                                                    case 1: {
                                                        account[m][0] = cardTypes[0].getDisplayName();
                                                        break;
                                                    }
                                                    case 2: {
                                                        account[m][0] = cardTypes[1].getDisplayName();
                                                        break;
                                                    }
                                                    case 3: {
                                                        account[m][0] = cardTypes[2].getDisplayName();
                                                        break;
                                                    }
                                                    case 4: {
                                                        account[m][0] = cardTypes[3].getDisplayName();
                                                        break;
                                                    }
                                                    case 5: {
                                                        account[m][0] = cardTypes[4].getDisplayName();
                                                        break;
                                                    }
                                                    default: {
                                                        System.out.println("Invalid value entered");
                                                        break;
                                                    }

                                                }
                                            }
                                            case 0: {
                                                break;
                                            }
                                            default: {
                                                System.out.println("Invalid value entered");
                                                break;
                                            }
                                        }


                                    }
                                    else {
                                        System.out.println("User not found");
                                        break;
                                    }

                                }


                                break;
                            }
                            case 7: {
                                boolean isValid = XSDvalidator.validateXml();

                                if (isValid) {
                                    System.out.println("XML is valid.");
                                }
                                else {
                                    System.out.println("XML is invalid.");
                                }

                                break;
                            }
                            case 8: {
                                DOMParser xmlParser = new DOMParser();
                                xmlParser.parseXML("D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Subjects\\Internet programming technology\\LBR_04\\Solution\\LBR_03\\files\\Bank.xml");
                                break;
                            }
                            default: {
                                System.out.println("Invalid input");
                                break;
                            }
                        }

                    }
                    else {
                        System.out.println("Invalid access key. Such user does not exist. Access denied.");
                    }
                }
                else {
                    System.out.println("Invalid username. Such user does not exist. Access denied.");
                }
                break;
            }
            default: {
                System.out.println("Incorrect value");
                break;
            }
        }
        EntranceInAccountObj.SerializeToFile("D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Subjects\\Internet programming technology\\LBR_04\\Solution\\LBR_03\\SaveData\\SaveData.json");
    }
}