package Tasks.Task_1;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

public class GetResources {
    public Document getResourceFromSite(String url) throws IOException {
        Document doc = Jsoup.connect(url).get();
        return doc;
    };
    public void getAllLinksFromDoc(Document doc) {
        Elements links = doc.select("a[href]");
        for (Element link : links) {
            System.out.println(link.attr("href"));
        }
    };
};