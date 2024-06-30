package Validation;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import org.xml.sax.SAXException;

public class XSDValidation {
    private String xmlDocName;
    private String schemaDocName;

    public XSDValidation(String xmlDocName, String schemaDocName) {
        this.xmlDocName = xmlDocName;
        this.schemaDocName = schemaDocName;
    }

    public boolean validateXml() {
        try {
            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Source xsdSource = new StreamSource(schemaDocName);
            Schema schema = factory.newSchema(xsdSource);
            Validator validator = schema.newValidator();
            Source xmlSource = new StreamSource(xmlDocName);
            validator.validate(xmlSource);
            return true;
        }
        catch (SAXException e) {
            System.out.println("Validation error " + e.getMessage());
        }
        catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return false;
    }
}