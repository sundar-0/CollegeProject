/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gms;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;




/**
 *
 * @author Sundar Dumre
 */
public class Chart {
   private Connection dbcon=null;
   public Chart() throws SQLException, IOException{
       dbConnection("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/gms","root","");
       SalesDetailPie();
   }
    private Connection dbConnection(String driverClass,String driverPath,String userName,String pass){
         try{  
                    Class.forName(driverClass); 
                    dbcon = DriverManager.getConnection(driverPath,userName,pass);
         } catch (ClassNotFoundException | SQLException ex) {
             Logger.getLogger(customers.class.getName()).log(Level.SEVERE, null, ex);
    }
         return dbcon;
    }
    private void SalesDetailPie() throws SQLException, IOException{
    DefaultPieDataset dataset = new DefaultPieDataset( );
    PreparedStatement pst=this.dbcon.prepareStatement("SELECT prodname,quantity FROM product JOIN sales on product.prodid=sales.product");
    ResultSet rs=pst.executeQuery();
    while(rs.next()){
    dataset.setValue(rs.getString(1),Double.parseDouble(rs.getString(2)));
    }
    JFreeChart chart = ChartFactory.createPieChart(
         "Grocery Sales",   // chart title
         dataset,          // data
         true,             // include legend
         true,
         false);
         
      int width = 640;   /* Width of the image */
      int height = 480;  /* Height of the image */ 
      File pieChart = new File( "PieChart.jpeg" ); 
      ChartUtilities.saveChartAsJPEG( pieChart , chart , width , height );
      
    }
    
       
    public static void main(String[] args) throws SQLException, IOException {
      Chart c=new Chart();
    }
    
    

     
   
}
