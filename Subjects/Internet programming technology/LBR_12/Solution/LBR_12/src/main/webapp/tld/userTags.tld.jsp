<?xml version ="1.0" encoding="ISO-8859-1" ?>

<taglib xmlns ="http://java.sun.com/xml/ns/javaee"
        xmlns:xsi ="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation ="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web"
        version ="2.1">
  <tlib-version>1.0</tlib-version>
  <short-name>Submit</short-name>
  <uri>userTags</uri>

  <tag>
    <name>KadSubmit</name>
    <tag-class>com.example.lab_12.TagManager.Kadsubmit</tag-class>
    <body-content>empty</body-content>
  </tag>

  <tag>
    <name>KadPrintTable</name>
    <tag-class>com.example.lab_12.TagManager.KadPrintTable</tag-class>
    <body-content>empty</body-content>

    <attribute>
      <name>nameTable</name>
      <required>true</required>
      <rtexprvalue>true</rtexprvalue>
    </attribute>
    <attribute>
      <name>nameDB</name>
      <required>true</required>
      <rtexprvalue>true</rtexprvalue>
    </attribute>
  </tag>
</taglib>