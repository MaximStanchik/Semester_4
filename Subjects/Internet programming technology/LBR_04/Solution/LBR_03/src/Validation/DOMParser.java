package Validation;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
public class DOMParser {
    public void parseXML(String filePath) {
        try {
            File inputFile = new File(filePath);

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(inputFile);

            document.getDocumentElement().normalize();

            NodeList nodeList = document.getElementsByTagName("passkeys");

            for (int temp = 0; temp < nodeList.getLength(); temp++) {
                Node node = nodeList.item(temp);

                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) node;
                    NodeList cardNodes = element.getElementsByTagName("card");

                    for (int i = 0; i < cardNodes.getLength(); i++) {
                        Element cardElement = (Element) cardNodes.item(i);
                        String cardType = cardElement.getElementsByTagName("cardType").item(0).getTextContent();
                        String bankAccount = cardElement.getElementsByTagName("BankAccount").item(0).getTextContent();
                        String bankNumber = cardElement.getElementsByTagName("bankNumber").item(0).getTextContent();

                        System.out.println("Card Type: " + cardType);
                        System.out.println("Bank Account: " + bankAccount);
                        System.out.println("Bank Number: " + bankNumber);
                        System.out.println("--------------------------------");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
