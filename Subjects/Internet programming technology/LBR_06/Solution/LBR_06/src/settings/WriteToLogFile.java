package settings;
import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import java.io.FileWriter;

public class WriteToLogFile extends Config {
    static String filePath = "D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Subjects\\Internet programming technology\\LBR_06\\Solution\\LBR_06\\log\\log.xml";

    public static void writeInfoToLogXML(String output) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("log");
            doc.appendChild(rootElement);

            Element outputElement = doc.createElement("output");
            outputElement.setTextContent(output);
            rootElement.appendChild(outputElement);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");

            FileWriter writer = new FileWriter(filePath);
            StreamResult result = new StreamResult(writer);

            DOMSource source = new DOMSource(doc);
            transformer.transform(source, result);

            writer.close();
        }
        catch (ParserConfigurationException | IOException | TransformerException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}