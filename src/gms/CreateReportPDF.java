/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gms;
import java.io.FileNotFoundException;  
import java.io.IOException;
import java.io.FileOutputStream;  
import com.itextpdf.text.Document;  
import com.itextpdf.text.DocumentException;  
import com.itextpdf.text.Paragraph; 
import com.itextpdf.text.pdf.PdfWriter;  
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import java.time.LocalDateTime;  // Import the LocalDateTime class
import java.time.format.DateTimeFormatter;
import java.util.Random;
import javax.swing.JOptionPane;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;
import java.awt.Desktop;
import java.io.File;
/**
 *
 * @author Sundar Dumre
 */
public class CreateReportPDF  {

public CreateReportPDF(String supplierName,String productName,int id,int quantity,float perunitprice,float total){
    String randNo=Integer.toString(new Random().nextInt(10000));
    Document doc=new Document();
    LocalDateTime currDate = LocalDateTime.now(); 
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E, MMM dd yyyy HH:mm:ss");
    String formattedDate = currDate.format(myFormatObj);  
    
    
//Write PDF File
try  
{  
//generate a PDF at the specified location  
PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream("report_"+randNo+".pdf"));  
JOptionPane.showMessageDialog(null, "Receipt Generated Successfully");
//opens the PDF  
doc.open();  
//adds paragraph to the PDF file  
doc.add(new Paragraph(supplierName));
doc.add(new Paragraph("Phone:+977-xxxxx"));
doc.add(new Paragraph("Pan no:2200122-29"));
doc.add(new Paragraph("\n"));
//id,supplier,product,perunitprice,quantity,total
PdfPTable table = new PdfPTable(5);
table.setWidthPercentage(100);
PdfPCell cell = new PdfPCell();
cell.setColspan(5);
table.addCell("ID");
table.addCell("Product");
table.addCell("Per Unit Price");
table.addCell("Quantity");
table.addCell("Total");

table.addCell(Integer.toString(id));
table.addCell(productName);
table.addCell(Float.toString(perunitprice));
table.addCell(Integer.toString(quantity));
table.addCell(Float.toString(total));
doc.add(table);
doc.add(new Paragraph("\n \n"));
doc.add(new Paragraph("Bill Generated On : "+formattedDate));
//close the PDF file  
doc.close();  
//closes the writer  
writer.close();  
}   
catch ( DocumentException | FileNotFoundException e)  
{  
} 


//Read PDF File

  try {

		File pdfFile = new File("report_"+randNo+".pdf");
		if (pdfFile.exists()) {

			if (Desktop.isDesktopSupported()) {
				Desktop.getDesktop().open(pdfFile);
			} else {
				System.out.println("Awt Desktop is not supported!");
			}

		} else {
			System.out.println("File is not exists!");
		}

		System.out.println("Done");

	  } catch (Exception ex) {
		ex.printStackTrace();
          }
}  
}

    


 




 

