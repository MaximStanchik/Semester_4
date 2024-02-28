package by.belstu.it.Stanchik.basejava;
import static java.lang.Math.*;
import java.util.Random;
import java.util.Arrays;
public class JavaTest {
    static int sint;
    final int finalConst = 10;
    public final int publicFinalConst = 20;
    public static final int publicStaticFinalConst = 30;
    public static void java_test() {
        System.out.println("Implementation of the second laboratory work:");
        char    variable_1 = 'a';
        int     variable_2 = 5;
        short   variable_3 = 7;
        byte    variable_4 = 5;
        long    variable_5 = 21123;
        boolean variable_6 = true;

        String str0 = "Nothing";
        double double1 = (double) variable_2;
        String str2 = Integer.toString(variable_2);
        String resultString0 = str0 + variable_2;
        String resultString1 = str0 + variable_1;
        String resultString2 = str0 + variable_1;
        String resultString3 = str0 + double1;
        byte someVar = (byte) (variable_4 + variable_2);
        int anothVar = (int) (double1 + variable_5);



        System.out.println("Implementation of outputting values:");
        System.out.println("Variable of char type: " + variable_1);
        System.out.println("Variable of int type: " + variable_2);
        System.out.println("Variable of short type: " + variable_3);
        System.out.println("Variable of byte type: " + variable_4);
        System.out.println("Variable of long type: " + variable_5);
        System.out.println("Variable of boolean type: " + variable_6);

        System.out.println("2147483647 + 5: ");

        boolean boolVar1 = true && true;
        System.out.println("true && true: " + boolVar1);

        boolean boolVar2 = true ^ true;
        System.out.println("true ^ true: " + boolVar2);

        System.out.println("boolean + boolean: execution is impossible");

        System.out.println("Output value without initialization: " + sint);

        long biggestNumberToo = 9223372036854775807L;
        long biggestNumber = 0x7fff_ffff_fffL;

        char variable_7 = 'a';
        char variable_8 = '\u0061';
        char variable_9 = 97;

        System.out.println("Initialized and output char:");
        System.out.println("First variable: " + variable_7);
        System.out.println("Second variable: " + variable_8);
        System.out.println("Third variable: " + variable_9);

        char sumOfChars = (char) (variable_7 + variable_8 + variable_9);
        System.out.println("Sum of first, second and third variables: " + variable_9);

        double operation0 = 3.45 % 2.4;
        double operation1 = 1.0/0.0;
        double operation2 = 0.0/0.0;
        double operation3 = Math.log(-345);
        System.out.println("3.45 % 2.4 : " + operation0);
        System.out.println("1.0/0.0 : " + operation1);
        System.out.println("0.0/0.0 : " + operation2);
        System.out.println("Math.log(-345) : " + operation3);

        Float.intBitsToFloat(0x7F800000);
        Float.intBitsToFloat(0xFF800000);

        int decimalNumber = 42;
        int zero = 0;
        int negativeNumber = -123;

        System.out.println("Десятичная система:");
        System.out.println(decimalNumber);
        System.out.println(zero);
        System.out.println(negativeNumber);

        int hexNumber1 = 0x2A;
        int hexNumber2 = 0xFF;
        int negativeHexNumber = -0x7B;

        System.out.println("Шестнадцатеричная система:");
        System.out.println(hexNumber1);
        System.out.println(hexNumber2);
        System.out.println(negativeHexNumber);

        int octalNumber1 = 052;
        int octalNumber2 = 077;
        int negativeOctalNumber = -0173;

        System.out.println("Восьмеричная система:");
        System.out.println(octalNumber1);
        System.out.println(octalNumber2);
        System.out.println(negativeOctalNumber);

        int binaryNumber1 = 0b101010;
        int binaryNumber2 = 0b11111111;
        int negativeBinaryNumber = -0b1111011;

        System.out.println("Двоичная система:");
        System.out.println(binaryNumber1);
        System.out.println(binaryNumber2);
        System.out.println(negativeBinaryNumber);

        System.out.println("Число пи: " + Math.PI);
        System.out.println("Округленное значение числа пи: " + Math.round(Math.PI));

        System.out.println("Экспонента: " + Math.E);
        System.out.println("Округленное значение экспоненты: " + Math.round(Math.E));

        System.out.println("Вывод наименьшего значения (экспонента меньше, чем число пи): " + Math.min(Math.PI, Math.E));

        Random randomValueGenerator = new Random();
        double randomValue = randomValueGenerator.nextDouble();
        System.out.println("Случайное число из диапазона [0, 1): "+ randomValue);

        Integer intNum = 42;
        Boolean trueOrFalse = Boolean.valueOf(true);
        Character symbol = 'a';
        Byte byteNumber = 126;
        Short shortNumber = 12;
        Long longNum = Long.valueOf(30L);
        Double doubleNumber = Double.valueOf(20.12);

        System.out.println("Максимальное число long: " + Long.MAX_VALUE);
        System.out.println("Максимальное число double: " + Double.MAX_VALUE);
        System.out.println("Минимальное число long: " + Long.MIN_VALUE);
        System.out.println("Минимальное число double: " + Double.MIN_VALUE);

        int intValue = 42;
        Integer boxedInteger = Integer.valueOf(intValue);

        byte byteValue = 10;
        Byte boxedByte = Byte.valueOf(byteValue);

        int resultAddition = intNum + shortNumber;
        double resultMultiplication = doubleNumber * longNum;

        boolean resultLogicalAnd = trueOrFalse && true;
        boolean resultLogicalOr = trueOrFalse || false;

        int resultBitwiseAnd = intNum & byteNumber;
        int resultBitwiseOr = intNum | byteNumber;
        int resultBitwiseShiftRight = intNum >> 2;
        int resultBitwiseShiftLeft = intNum << 3;
        int resultBitwiseComplement = ~intNum;

        int parsedInt = Integer.parseInt("123");
        System.out.println(parsedInt);

        String hexString = Integer.toHexString(intValue);
        System.out.println(hexString);

        int comparisonResult = Integer.compare(intNum, 50);
        if (comparisonResult == -1) {
            System.out.println("intNum меньше 50");
        }
        else if (comparisonResult == 0) {
            System.out.println("intNum равен 50");
        }
        else {
            System.out.println("intNum больше 50");
        }

        String strRepresentation = intNum.toString();
        System.out.println(strRepresentation);

        int numBits = Integer.bitCount(intNum);
        System.out.println(numBits);

        boolean isNotANumber = Double.isNaN(intNum.doubleValue());
        System.out.println(isNotANumber);

        String s34 = "2345";

        int number2 = Integer.valueOf(s34);
        System.out.println(number2);

        int number3 = Integer.parseInt(s34);
        System.out.println(number3);

        String str = "Hello, World!";

        byte[] byteArray = str.getBytes();
        System.out.println(Arrays.toString(byteArray));

        String strFromBytes = new String(byteArray);
        System.out.println(strFromBytes);

        String trueString = "true";
        String falseString = "false";

        boolean bool1 = Boolean.valueOf(trueString);
        boolean bool2 = Boolean.valueOf(falseString);
        System.out.println(bool1);
        System.out.println(bool2);

        boolean bool3 = Boolean.parseBoolean(trueString);
        boolean bool4 = Boolean.parseBoolean(falseString);
        System.out.println(bool3);
        System.out.println(bool4);

        String string1 = "Hello";
        String string2 = new String("Hello");

        System.out.println("ВОТ ЗДЕСЬ!!!!!!!!!!!!!!!");
        System.out.println(string1 == string2);
        System.out.println(string1.equals(string2));
        System.out.println(string1.compareTo(string2));

        string1 = null;

        System.out.println(string1 == string2);

        String[] words = str.split(", ");
        System.out.println(Arrays.toString(words));

        boolean containsHello = str.contains("Hello");
        System.out.println(containsHello);

        int hashCode = str.hashCode();
        System.out.println(hashCode);

        int indexOfWorld = str.indexOf("World");
        System.out.println(indexOfWorld);

        int length = str.length();
        System.out.println(length);

        String replacedStr = str.replace("Hello", "Hi");
        System.out.println(replacedStr);

        char[][] c1;
        char[] c2[];
        char c3[][];
        int[] emptyArray = new int[0];

        c1 = new char[3][];
        System.out.println("Длина каждой строки по умолчанию (установлена разработчиком): " + c1.length);
        for (int i = 0; i < 3; i++) {
            c1[i] = new char[i + 2];
            c1[i][i + 1] = '\0';
            System.out.println(i + "-ая строка: " + Arrays.toString(c1[i]));
        }
        System.out.println();
        System.out.println("Длина " + 0 + "-ой строки: " + c1[0].length);
        System.out.println("Длина " + 1 + "-ой строки: " + c1[1].length);
        System.out.println("Длина " + 2 + "-ой строки: " + c1[2].length);

        c2 = new char[3][3];
        c2[0] = new char[]{'a', 'b', 'c'};
        c2[1] = new char[]{'d', 'e', 'f'};
        c2[2] = new char[]{'g', 'h', 'k'};

        c3 = new char[3][3];
        c3[0] = new char[]{'a', 'b', 'c'};
        c3[1] = new char[]{'a', 'b', 'c'};
        c3[2] = new char[]{'a', 'b', 'c'};

        boolean comRez = c2==c3;
        System.out.println("Равны ли массивы c2 и с3? " + comRez);
        c2 = c3;

        System.out.println("Вывод элементов массива c3:");
        for (char[] row : c3) {
            for (char value : row) {
                System.out.print(value + " ");
            }
            System.out.println();
        }
    }
}
