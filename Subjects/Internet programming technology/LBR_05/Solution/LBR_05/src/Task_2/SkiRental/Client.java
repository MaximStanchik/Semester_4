package Task_2.SkiRental;
import java.util.ArrayList;
import java.util.List;
public class Client {
    private List<String> clientsByAgeCategory = new ArrayList<>();

    public void addClientByAgeCategoryToTheEndOfTheList(String client) {
        clientsByAgeCategory.add(client);
    }
    public void addClientByAgeCategoryToTheStartOfTheList (String client) {
        clientsByAgeCategory.add(0, client);
    }

    public List<String> getClientsByAgeCategory() {
        return clientsByAgeCategory;
    }

    public synchronized String getNextClient() {
        if (clientsByAgeCategory.isEmpty()) {
            return null;
        } else {
            return clientsByAgeCategory.remove(0);
        }
    }

}