package com.example.ex_5_realization;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LoggerUtil {
    private static final Logger logger = Logger.getLogger(LoggerUtil.class.getName());
    private static FileHandler fileHandler;

    static {
        try {
            fileHandler = new FileHandler("D:\\User\\Desktop\\StudyAtBSTU\\Course_2\\Semester_4\\Exams\\Java\\ExamPreparation\\SessiaTIMOUT1020\\Solution\\Ex_5_Realization\\src\\main\\java\\com\\example\\ex_5_realization\\log.txt");
            fileHandler.setFormatter(new SimpleFormatter());
            logger.addHandler(fileHandler);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void logInfo(String loginValue, String sessionId, long sessionCreationTime, String loginURL) {
        String message = "Login successful for user: " + loginValue
                + "\nSession ID: " + sessionId
                + "\nSession Creation Time: " + sessionCreationTime
                + "\nLogin URL: " + loginURL;
        logger.log(Level.INFO, message);
    }

    public static void logError(String message) {
        logger.log(Level.SEVERE, message);
    }

    public static void closeLogger() {
        if (fileHandler != null) {
            fileHandler.close();
        }
    }
}