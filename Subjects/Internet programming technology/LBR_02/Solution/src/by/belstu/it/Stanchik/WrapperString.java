package by.belstu.it.Stanchik;

import java.util.Objects;

/**
 * Класс WrapperString представляет обертку для строки.
 *
 * @author Станчик Максим
 * @version 1.0
 */
public class WrapperString {
    /**
     * Возвращает значение приватного поля privateStringField.
     *
     * @return значение приватного поля privateStringField
     */
    private String privateStringField;
    /**
     * Возвращает значение приватного поля privateStringField.
     *
     * @return значение приватного поля privateStringField
     */
    public WrapperString(String privateStringField) {
        this.privateStringField = privateStringField;
    }
    /**
     * Устанавливает значение приватного поля privateStringField.
     *
     */
    public String getPrivateStringField() {
        return privateStringField;
    }



    public void setPrivateStringField(String privateStringField) {
        this.privateStringField = privateStringField;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WrapperString that = (WrapperString) o;
        return Objects.equals(privateStringField, that.privateStringField);
    }

    /**
     * Переопределенный метод equals.
     * <p>
     * пареметр -- объект o
     *
     * @return true, если объекты равны, иначе false
     */

    @Override
    public int hashCode() {
        return Objects.hash(privateStringField);
    }

    /**
     * Переопределенный метод hashCode.
     *
     * @return хэш-код объекта
     */

    @Override
    public String toString() {
        return "WrapperString{" +
                "privateStringField='" + privateStringField + '\'' +
                '}';
    }

    /**
     * Переопределенный метод toString.
     * <p>
     * строковое представление объекта
     */


    /**
     *
     * @param oldchar
     * @param newchar
     */

    public void replace(char oldchar, char newchar) {

    }
}
