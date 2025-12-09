package com.printPdf.controller;


import java.io.*;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.BarcodeEAN;
import com.printPdf.bean.PatientData;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class ExportPdf {

	 public JasperPrint exportPdf(PatientData patientData) throws JRException, IOException, WriterException
	 {
		// Compile jrxml file.
		 
		 	generateQrCode(patientData);
		 	generateSampleUid(patientData.getSampleUID());
	       // Parameters for report
	       Map<String, Object> parameters = new HashMap<String, Object>();
	       	
		   	parameters.put("name",patientData.getName());
		   	parameters.put("age",patientData.getAge());
		   	parameters.put("gender",patientData.getGender());
		   	parameters.put("aadharNo",patientData.getAadharNo());
		   	parameters.put("patientLoc",patientData.getPatientLoc());
		   	parameters.put("contactNo",patientData.getContactNo());
		   	parameters.put("doctorName",patientData.getDoctorName());
		   	parameters.put("centre",patientData.getCentre());
		   	parameters.put("collectionTime",patientData.getCollectionTime());
		   	parameters.put("acceptenceTime",patientData.getAcceptenceTime());
		   	parameters.put("reportedOn",patientData.getReportedOn());
		   	parameters.put("sampleUID",patientData.getSampleUID());
		   	parameters.put("org",patientData.getOrg());
		   	parameters.put("testResult",patientData.getTestResult());
		   	parameters.put("passportNo",patientData.getPassportNo());
		   	
		   	File logoImg = new File(this.getClass().getResource("/images/logo.PNG").getFile());
		   	File footer = new File(this.getClass().getResource("/images/signatureFooter.PNG").getFile());
		   	
		   	parameters.put("image",logoImg.getAbsolutePath());
		   	parameters.put("qrCode","D:\\Workspace\\CovidReportGeneration\\WebContent\\images\\qrCode.jpg");
		   	parameters.put("sampleUidBarcode","D:\\Workspace\\CovidReportGeneration\\WebContent\\images\\barcode.jpg");
		   	parameters.put("footer",footer.getAbsolutePath());
	       // DataSource
	       // This is simple example, no database.
	       // then using empty datasource.
	       JRDataSource dataSource = new JREmptyDataSource();
	       
	       File jrxml = null;
	       JasperReport jasperReport = null;
	       if(!patientData.getPassportNo().isEmpty() || !"".equalsIgnoreCase(patientData.getPassportNo()))
	       {
	    	   jrxml = new File(this.getClass().getResource("/report/passportReport.jrxml").getFile());
		       jasperReport = JasperCompileManager
		               .compileReport(jrxml.getAbsolutePath());
	       }
		   else if(!patientData.getAadharNo().isEmpty() || !"".equalsIgnoreCase(patientData.getAadharNo()))
		   {
			   jrxml = new File(this.getClass().getResource("/report/aadharReport.jrxml").getFile());
	       		jasperReport = JasperCompileManager
	               .compileReport(jrxml.getAbsolutePath());
		   }
	       
	       JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
	               parameters, dataSource);

	   
	       // Make sure the output directory exists.
	       File outDir = new File("D:\\Workspace\\CovidReportGeneration\\WebContent\\reports");
	       outDir.mkdirs();

	       System.out.println("Printed Successfully!");
	    
		 
		 
		return jasperPrint;
	 }
	 
	 public void generateQrCode(PatientData patientData) throws IOException, WriterException
	 {
		 String path = "D:\\Workspace\\CovidReportGeneration\\WebContent\\images\\qrCode.jpg";
		 
		 String content = "Name : "+patientData.getName()+"\n"+"Patient ID:"+patientData.getSampleUID()+"\n"+"Collection Date and Time:"+patientData.getCollectionTime();
		 BitMatrix matrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, 78, 66);
		 MatrixToImageWriter.writeToPath(matrix, "jpg", Paths.get(path));
		 System.out.println("QRCode Generated");
	 }
	 
	 public void generateSampleUid(String sampleUid) throws WriterException, IOException
	 {
		 String path = "D:\\Workspace\\CovidReportGeneration\\WebContent\\images\\barcode.jpg";
		 
		 String content = sampleUid;
		 BitMatrix matrix = new MultiFormatWriter().encode(content, BarcodeFormat.CODE_128, 197, 26);
		 MatrixToImageWriter.writeToPath(matrix, "jpg", Paths.get(path));
		 System.out.println("Barcode Generated");
	 }
}
