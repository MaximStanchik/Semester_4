package InfoAboutAccounts;
interface UsernameValidator {
    boolean isValidUsername(String username);
}

interface AccessKeyValidator {
    boolean isValidAccessKey(String accessKey);
}

interface AccessLevelViewer {
    String getAccessLevel(int index);
}
public abstract class Account implements UsernameValidator, AccessKeyValidator, AccessLevelViewer {
    public abstract int checkIfUsernameIsValid(String username);

    public abstract int checkIfAccessKeyIsValid(String accessKey);

    public abstract String viewAccessLevel(int i);

    public Account() {
    }

    public Account(String param1) {
    }

    public Account(String param1, int param2) {
    }

    @Override
    public boolean isValidUsername(String username) {
        return false;
    }

    @Override
    public boolean isValidAccessKey(String accessKey) {
        return false;
    }

    @Override
    public String getAccessLevel(int index) {
        return "";
    }
}