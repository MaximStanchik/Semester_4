package settings;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.sql.SQLException;
import java.util.Scanner;
public class DataBaseInteraction extends Config {
    static Scanner userInputObj = new Scanner(System.in);
    static WriteToLogFile writeToXMLobj = new WriteToLogFile();
    static int orderNumber;
    static int product;
    static int productQuantity;
    static int sumOfOrders;
    static String inputDate = "2024-04-01";

    public static void user_input() {
        System.out.println("Enter the number of order:");
        orderNumber = userInputObj.nextInt();
        userInputObj.nextLine();

        System.out.println("Enter the product:");
        product = userInputObj.nextInt();
        userInputObj.nextLine();

        System.out.println("Enter the quantity of products:");
        productQuantity = userInputObj.nextInt();
        userInputObj.nextLine();

        System.out.println("Enter the sum of orders:");
        sumOfOrders = userInputObj.nextInt();
        userInputObj.nextLine();
    }

    static ResultSet resultSet = null;
    static DataBaseHandler handler = new DataBaseHandler();

    public static void infoAboutOrder() {
        StringBuilder output = new StringBuilder();
        try {
            //Вывести полную информацию о заданном заказе.
            String select = "SELECT * FROM Orders o JOIN GoodsInOrder gio ON o.OrderID = " +
                    "gio.OrderID JOIN Products p ON gio.ProductID " +
                    "= p.ProductID WHERE o.OrderID = " + orderNumber + ";";
            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            resultSet = st.executeQuery();
            System.out.println("Information about order:");
            while (resultSet.next()) {
                int orderId = resultSet.getInt("OrderID");
                String dateOfReceipt = resultSet.getString("DateOfReceipt");
                int productId = resultSet.getInt("ProductID");
                String name = resultSet.getString("Name");
                String description = resultSet.getString("Description");
                float price = resultSet.getFloat("Price");
                int quantity = resultSet.getInt("QuantityOfProducts");

                System.out.println("OrderID: " + orderId);
                System.out.println("Date of Receipt: " + dateOfReceipt);
                System.out.println("ProductID: " + productId);
                System.out.println("Name: " + name);
                System.out.println("Description: " + description);
                System.out.println("Price: " + price);
                System.out.println("Quantity of Products: " + quantity);

                output.append("OrderID: " + orderId);
                output.append("Date of Receipt: " + dateOfReceipt);
                output.append("ProductID: " + productId);
                output.append("Name: " + name);
                output.append("Description: " + description);
                output.append("Price: " + price);
                output.append("Quantity of Products: " + quantity);
            }
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            output.append("The task was completed with an error");
        }
    }

    public static void ordersWithProduct() {
        StringBuilder output = new StringBuilder();
        try {
            output.append("Task: Display order numbers containing the specified product.");
            // Вывести номера заказов, содержащих заданный товар.
            String select = "SELECT Orders.OrderID\n" +
                    "FROM Orders\n" +
                    "JOIN GoodsInOrder ON Orders.OrderID = GoodsInOrder.OrderID\n" +
                    "WHERE GoodsInOrder.ProductID = ?;";
            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            st.setInt(1, product);
            ResultSet resultSet = st.executeQuery();

            System.out.println("Orders containing the specified product:");
            output.append("Orders containing the specified product:");
            while (resultSet.next()) {
                String orderID = resultSet.getString("OrderID");
                String formattedOrderID = String.format("%04d", Integer.parseInt(orderID));
                System.out.println(formattedOrderID);
                output.append(formattedOrderID);
            }
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            output.append("The task was completed with an error");
        }
    }

    public static void deleteOrders() {
        StringBuilder output = new StringBuilder();
        try {
            output.append("Task: Delete all orders containing a specified quantity of a given product.\n");
            int productQuantity = 10; // Modify with the desired quantity
            int product = 1111; // Modify with the desired product ID

            String select = "DELETE FROM Orders\n" +
                    "WHERE OrderID IN (\n" +
                    "    SELECT OrderID\n" +
                    "    FROM GoodsInOrder\n" +
                    "    WHERE ProductID IN (\n" +
                    "        SELECT ProductID\n" +
                    "        FROM Products\n" +
                    "        WHERE ProductID = " + product + "\n" +
                    "    )\n" +
                    "    AND QuantityOfProducts = " + productQuantity + "\n" +
                    ");";

            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            int affectedRows = st.executeUpdate();

            output.append("Removal was successful. Affected rows: ").append(affectedRows);
            System.out.println("Removal was successful. Affected rows: " + affectedRows);

            writeToXMLobj.writeInfoToLogXML(output.toString());
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            output.append("The task was completed with an error");
        }
    }

    public static void makeANewOrder() {
        StringBuilder output = new StringBuilder();
        try {
            output.append("Task: Create a new order consisting of goods ordered in this day");
            // Сформировать новый заказ, состоящий из товаров, заказанных в текущий день.
            String select = "INSERT INTO Orders (OrderID, DateOfReceipt) " +
                    "SELECT '0005', o.DateOfReceipt FROM Orders o " +
                    "JOIN GoodsInOrder gio ON o.OrderID = gio.OrderID " +
                    "WHERE o.DateOfReceipt = '2024-04-01';";
            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            int affectedRows = st.executeUpdate();
            System.out.println("New order created. Affected rows: " + affectedRows);
            output.append("New order created. Affected rows: " + affectedRows);
            writeToXMLobj.writeInfoToLogXML(output.toString());
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            output.append("The task was completed with an error");
        }
    }

    public static void getOrdersWithoutProductToday() {
        StringBuilder output = new StringBuilder();
        try {
            output.append("Task: Select order numbers that do not contain the specified product and were received on the current day");
            String select = "SELECT o.OrderID\n" +
                    "FROM Orders o\n" +
                    "JOIN (\n" +
                    "    SELECT g.OrderID, COUNT(DISTINCT g.ProductID) AS NumProducts, SUM(p.Price * g.QuantityOfProducts) AS TotalAmount\n" +
                    "    FROM GoodsInOrder g\n" +
                    "    JOIN Products p ON g.ProductID = p.ProductID\n" +
                    "    GROUP BY g.OrderID\n" +
                    "    HAVING NumProducts = ? AND TotalAmount <= ?\n" +
                    ") sub ON o.OrderID = sub.OrderID;";
            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            st.setInt(1, productQuantity);
            st.setDouble(2, sumOfOrders);
            ResultSet rs = st.executeQuery();
            System.out.println("Orders without product " + product + " received today:");
            output.append("Orders without product " + product + " received today:");
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                System.out.println(orderID);
                output.append("orderID: " + orderID);
            }
            writeToXMLobj.writeInfoToLogXML(output.toString());
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            output.append("The task was completed with an error");
        }
    }

    public static void getOrderNumbers() {
        StringBuilder output = new StringBuilder();
        try {
            output.append("Task: Print the numbers of orders whose total does not exceed the specified one and the number of different products is equal to the specified one.\n");

            String select = "SELECT o.OrderID\n" +
                    "FROM Orders o\n" +
                    "JOIN (\n" +
                    "    SELECT OrderID,\n" +
                    "           COUNT(DISTINCT g.ProductID) AS NumProducts,\n" +
                    "           SUM(p.Price * g.QuantityOfProducts) AS TotalAmount\n" +
                    "    FROM GoodsInOrder g\n" +
                    "    JOIN Products p ON g.ProductID = p.ProductID\n" +
                    "    GROUP BY OrderID\n" +
                    "    HAVING NumProducts = " + productQuantity + " AND TotalAmount <= " + sumOfOrders + "\n" +
                    ") sub ON o.OrderID = sub.OrderID;";

            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            ResultSet rs = st.executeQuery();

            output.append("Orders with product quantity ").append(productQuantity).append(" and total amount not exceeding ")
                    .append(sumOfOrders).append(":\n");
            System.out.println("Orders with product quantity " + productQuantity + " and total amount not exceeding " + sumOfOrders + ":");

            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                output.append(orderID).append("\n");
                System.out.println(orderID);
            }

            writeToXMLobj.writeInfoToLogXML(output.toString());
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            output.append("The task was completed with an error");
        }
    }

    public static void executeTransaction() {
        StringBuilder output = new StringBuilder();
        try {
            output.append("Executing the transaction.\n");

            handler.getDbConnection().setAutoCommit(false);

            Statement statement = handler.getDbConnection().createStatement();
            statement.execute("START TRANSACTION");

            statement.execute("INSERT INTO Orders (DateOfReceipt) VALUES ('2024-04-01')");
            statement.execute("INSERT INTO Orders (OrderID, DateOfReceipt) VALUES ('2024-04-02')");
            statement.execute("INSERT INTO Orders (OrderID, DateOfReceipt) VALUES ('2024-04-03')");

            statement.execute("INSERT INTO GoodsInOrder (ProductID, QuantityOfProducts) VALUES (1111, 10)");
            statement.execute("INSERT INTO GoodsInOrder (ProductID, QuantityOfProducts) VALUES (112, 20)");
            statement.execute("INSERT INTO GoodsInOrder (ProductID, QuantityOfProducts) VALUES (1113, 30)");

            statement.execute("INSERT INTO Products (Name, Description, Price) VALUES ('Burger', 'Very tasty and american', 2.50)");
            statement.execute("INSERT INTO Products (Name, Description, Price) VALUES ('French fries', 'It is not french it is AMERICAN', 1.50)");
            statement.execute("INSERT INTO Products (Name, Description, Price) VALUES ('BigTasty', 'Too delicious and extraamerican', 3.50)");

            handler.getDbConnection().commit();

            output.append("Transaction executed successfully.\n");
            System.out.println("Transaction executed successfully.");

            writeToXMLobj.writeInfoToLogXML(output.toString());
        } catch (SQLException e) {
            try {
                if (handler.getDbConnection() != null) {
                    handler.getDbConnection().rollback();
                }
            } catch (SQLException ex) {
                System.out.println("Error rolling back transaction: " + ex.getMessage());
            }

            System.out.println("MySQL error: " + e.getMessage());
            output.append("The transaction was not successful");
        }
    }
}