/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gms;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;


/**
 *
 * @author Sundar Dumre
 */
public class BackupData {

    /**
     *
     * @param ip
     * @param host
     * @param userName
     * @param password
     * @param databaseName
     * @param savePath
     * @param fileName
     * @throws FileNotFoundException
     * @throws IOException
     * @throws java.lang.InterruptedException
     */
    public BackupData(String userName,String databaseName, String savePath) throws FileNotFoundException, IOException, InterruptedException{
        
        String executeCmd = "mysqldump -u " + userName +" "+databaseName +" > "+savePath;
        System.out.println(executeCmd);
		try {
                        Process process = Runtime.getRuntime().exec(new String[] { "cmd.exe", "/c", executeCmd });
                        int processComplete = process.waitFor();
                        System.out.print(processComplete);
                        if (processComplete == 0)
                         {
                    System.out.println("Backup created successfully");
                 
                }
                else
                {
                    System.out.println("Could not create the backup");
                }
                }
			
			catch (IOException e) {
			}
		}		
}