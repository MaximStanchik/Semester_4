package InfoAboutAccounts;
import java.io.*;
import java.io.Serializable;
import java.util.Arrays;
import java.util.stream.IntStream;
public class EntranceInAccount extends Account {
    @Override
    public int checkIfUsernameIsValid(String username) {
        return IntStream.range(0, passkeys.length)
                .filter(i -> passkeys[i][0].equals(username))
                .findFirst()
                .orElse(-1);
    }

    @Override
    public int checkIfAccessKeyIsValid(String accessKey) {
        return IntStream.range(0, passkeys.length)
                .filter(i -> passkeys[i][1].equals(accessKey))
                .findFirst()
                .orElse(-1);
    }


    @Override
    public String viewAccessLevel(int i) {
        if (passkeys[i][2].equals("administrator")) {
            return "administrator";
        } else {
            return "client";
        }
    }

    public enum CardType {
        UNITY_CASH("UnityCash"),
        AURORA_PAY("AuroraPay"),
        STELLAR_SPEND("StellarSpend"),
        NEXUS_CARD("NexusCard"),
        HARMONY_PLUS("HarmonyPlus");

        private final String displayName;

        CardType(String displayName) {
            this.displayName = displayName;
        }

        public String getDisplayName() {
            return displayName;
        }
    }
    public Object[][] passkeys = {
            {"Admin_12", "8888jjjj0000E", "administrator", new AccountData().Admin_12_ACC},
            {"Client_1", "9381vddd2221R", "client", new AccountData().Client_1_ACC},
            {"Client_2", "8723gooo4441L", "client", new AccountData().Client_2_ACC},
            {"Client_3", "2133holo1233M", "client", new AccountData().Client_3_ACC},
            {"Client_4", "1244jiji1342K", "client", new AccountData().Client_4_ACC},
            {"Client_5", "7467jirj3434O", "client", new AccountData().Client_5_ACC},
    };
    public class AccountData {
        String[][] Admin_12_ACC = {
                {CardType.UNITY_CASH.getDisplayName(), "3000", "2003 2983 2983 3984", "allowed"},
                {CardType.AURORA_PAY.getDisplayName(), "2000", "3874 9473 8374 8463", "allowed"},
        };
        String[][] Client_1_ACC = {
                {CardType.UNITY_CASH.getDisplayName(), "900", "3984 8474 8744 9333", "allowed"},
                {CardType.AURORA_PAY.getDisplayName(), "70", "3984 9484 9844 9844", "allowed"},
        };
        String[][] Client_2_ACC = {
                {CardType.STELLAR_SPEND.getDisplayName(), "1700", "8374 7464 4874 9898", "allowed"},
                {CardType.NEXUS_CARD.getDisplayName(), "1066", "3974 9844 7447 4985", "allowed"},
        };
        String[][] Client_3_ACC = {
                {CardType.AURORA_PAY.getDisplayName(), "2000", "3444 3873 8733 9444", "allowed"},
                {CardType.NEXUS_CARD.getDisplayName(), "7000", "9398 3983 9833 5865", "allowed"},
        };
        String[][] Client_4_ACC = {
                {CardType.AURORA_PAY.getDisplayName(), "7000", "9374 8474 9837 3873", "allowed"},
                {CardType.STELLAR_SPEND.getDisplayName(), "10000", "9383 8478 8738 9374", "allowed"},
        };
        String[][] Client_5_ACC = {
                {CardType.UNITY_CASH.getDisplayName(), "2000", "0393 9383 1122 3334", "allowed"},
                {CardType.AURORA_PAY.getDisplayName(), "7000", "3947 3837 9187 5674", "allowed"},
        };

        private String[][] accountData;

        public AccountData(String[][] accountData) {
            this.accountData = accountData;
        }

        public AccountData() {

        }
    }

    public void SerializeToFile(String fileName) {
        try (FileOutputStream fileOutputStream = new FileOutputStream(fileName);
             ObjectOutputStream writingInFile = new ObjectOutputStream(fileOutputStream)) {

            writingInFile.writeObject(new Object[] {
                    passkeys,
                    new AccountData().Admin_12_ACC,
                    new AccountData().Client_1_ACC,
                    new AccountData().Client_2_ACC,
                    new AccountData().Client_3_ACC,
                    new AccountData().Client_4_ACC,
                    new AccountData().Client_5_ACC,
                    CardType.UNITY_CASH,
                    CardType.AURORA_PAY,
                    CardType.STELLAR_SPEND,
                    CardType.NEXUS_CARD,
                    CardType.HARMONY_PLUS
            });

            System.out.println("Serialization successful.");
        }
        catch (IOException exception) {
            System.out.println("Serialization failed. Error: " + exception.getMessage());
        }
    }

    public void DeserializeFromFile(String fileName) {
        try (FileInputStream fileInputStream = new FileInputStream(fileName);
             ObjectInputStream readingFromFile = new ObjectInputStream(fileInputStream)) {

            Object[] serializedObjects = (Object[]) readingFromFile.readObject();
            passkeys = (Object[][]) serializedObjects[0];
            AccountData Admin_12_ACC = new AccountData((String[][]) serializedObjects[1]);
            AccountData Client_1_ACC = new AccountData((String[][]) serializedObjects[2]);
            AccountData Client_2_ACC = new AccountData((String[][]) serializedObjects[3]);
            AccountData Client_3_ACC = new AccountData((String[][]) serializedObjects[4]);
            AccountData Client_4_ACC = new AccountData((String[][]) serializedObjects[5]);
            AccountData Client_5_ACC = new AccountData((String[][]) serializedObjects[6]);
            CardType UnityCash = (CardType) serializedObjects[7];
            CardType AuroraPay = (CardType) serializedObjects[8];
            CardType StellarSpend = (CardType) serializedObjects[9];
            CardType NexusCard = (CardType) serializedObjects[10];
            CardType HarmonyPlus = (CardType) serializedObjects[11];

            System.out.println("Deserialization successful.");
        } catch (IOException exception) {
            System.out.println("Deserialization failed. Error: " + exception.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}





