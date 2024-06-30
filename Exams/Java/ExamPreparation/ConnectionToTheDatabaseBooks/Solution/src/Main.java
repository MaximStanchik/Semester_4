import java.io.FileWriter;
import java.io.IOException;
import java.io.File;

public class Main{
private static final String FILENAME = "forWrite.txt";
private static final Object lock = new Object();

public static void main(String[] args) {
File file  =  new  File(FILENAME);
if(file.exists()){
file.delete();
}

Thread olgaThread = new WriteThread("OLGA");
Thread nikitaThread = new WriteThread("NIKITA");
Thread annaThread = new WriteThread("ANNA");

olgaThread.start();
nikitaThread.start();
annaThread.start();

}

static class WriteThread extends Thread {

private String message;

public WriteThread(String message){

this.message = message;

}

@Override
public void run(){
synchronized (lock) {
FileWriter filee =null;
try{
filee = new FileWriter(FILENAME, true);
for(int i = 0; i < message.length(); i++){
    filee.write(message.charAt(i));
    filee.flush();
    Thread.sleep((int)(Math.random() * 2000));
}
}
catch (IOException | InterruptedException e){
e.printStackTrace();
}

finally {
if(filee != null){
try{
filee.close();
}
catch (IOException e){
e.printStackTrace();
}
}
}
}
}
}
}







