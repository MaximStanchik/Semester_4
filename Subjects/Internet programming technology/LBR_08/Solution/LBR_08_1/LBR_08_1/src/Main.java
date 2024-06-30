import org.jsoup.nodes.Document;

import Tasks.Task_1.GetResources;


import java.io.IOException;
public class Main {
    public static void main(String[] args) throws IOException {
        GetResources Task_1Obj = new GetResources();

        System.out.println();
        System.out.println("Демонстрация выполнения первого задания:");
        Document doc = Task_1Obj.getResourceFromSite("https://javarush.com/quests/lectures/questservlets.level02.lecture02");
        Task_1Obj.getAllLinksFromDoc(doc);

    }
}