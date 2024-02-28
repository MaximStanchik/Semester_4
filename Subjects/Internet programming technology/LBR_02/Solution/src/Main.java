import by.belstu.it.Stanchik.WrapperString;
import by.belstu.it.Stanchik.basejava.JavaTest;

public class Main {
    /**
     * Главный метод программы.
     *
     * @param args аргументы командной строки
     */
    public static void main(String[] args) {
        /*
          Вызов метода java_test() из класса JavaTest.

          @throws SomeException исключение, если что-то идет не так
         */
        JavaTest.java_test();
        /*
          Создание объекта класса WrapperString.

          @value myObject объект класса WrapperString
         * @see WrapperString
         */
        WrapperString myObject = new WrapperString("") {

            @Override
            public void replace(char oldChar, char newChar) {
                int m = 0;
            }

            public void delete(char charToDelete) {
            }
        };
    }
}


