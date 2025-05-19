package com.studentcourse.util;

import java.io.*;
import java.util.*;

public class FileUtil {
    // Relative path that will work in deployed environment
    private static final String FILE_NAME = "payments.txt";

    public static List<String> readFile() {
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(getFilePath()))) {
            String line;
            while ((line = br.readLine()) != null) {
                lines.add(line);
            }
        } catch (IOException e) {
            System.err.println("Error reading payment file: " + e.getMessage());
        }
        return lines;
    }

    public static void writeFile(List<String> lines) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(getFilePath()))) {
            for (String line : lines) {
                bw.write(line);
                bw.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error writing to payment file: " + e.getMessage());
        }
    }

    private static String getFilePath() {
        // For development environment (when running from IDE)
        String devPath = System.getProperty("user.dir") + File.separator + "src" +
                File.separator + "main" + File.separator + "resources" +
                File.separator + FILE_NAME;

        // For deployed environment (in Tomcat)
        String deployedPath = System.getProperty("catalina.base") + File.separator +
                "webapps" + File.separator + "your-app-name" +
                File.separator + "WEB-INF" + File.separator + "classes" +
                File.separator + FILE_NAME;

        // Check which path exists and use it
        File devFile = new File(devPath);
        if (devFile.exists()) {
            return devPath;
        }

        File deployedFile = new File(deployedPath);
        if (deployedFile.exists()) {
            return deployedPath;
        }

        // If file doesn't exist, create it in the deployed location
        try {
            deployedFile.getParentFile().mkdirs();
            deployedFile.createNewFile();
            return deployedPath;
        } catch (IOException e) {
            System.err.println("Could not create payment file: " + e.getMessage());
            return devPath; // fallback
        }
    }
}