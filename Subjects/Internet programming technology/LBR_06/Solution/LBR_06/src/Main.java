import settings.DataBaseInteraction;
public class Main {
    static DataBaseInteraction dbInteraction = new DataBaseInteraction();
    public static void main(String[] args) {

        dbInteraction.user_input();
        System.out.println();

        dbInteraction.infoAboutOrder();
        System.out.println();

        dbInteraction.ordersWithProduct();
        System.out.println();

        dbInteraction.deleteOrders();
        System.out.println();

        //dbInteraction.makeANewOrder();
        System.out.println();

        dbInteraction.getOrdersWithoutProductToday();
        System.out.println();

        dbInteraction.getOrderNumbers();
        System.out.println();

        dbInteraction.executeTransaction();
        System.out.println();
    }
}