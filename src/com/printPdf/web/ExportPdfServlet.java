package com.printPdf.web;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.printPdf.bean.PatientData;
import com.printPdf.controller.ExportPdf;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;



/**
 * Author Ankit anchal
 */

@WebServlet("/exportPdf")
public class ExportPdfServlet extends HttpServlet {
    private ExportPdf exportPdfController;

    public void init() {
    	exportPdfController = new ExportPdf();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	String name = request.getParameter("name");
    	String age = request.getParameter("age");
    	String gender = request.getParameter("gender");
    	String aadharNo = request.getParameter("aadharNo");
    	String patientLoc = request.getParameter("patientLoc");
    	String contactNo = request.getParameter("contactNo");
    	String doctorName = request.getParameter("doctorName");
    	String centre = request.getParameter("centre");
    	String collectionTime = request.getParameter("collectionTime");
    	String acceptenceTime = request.getParameter("acceptenceTime");
    	String reportedOn = request.getParameter("reportedOn");
    	String sampleUID = request.getParameter("sampleUID");
    	String organization = request.getParameter("org");
    	String testResult = request.getParameter("testResult");
    	String passportNo = request.getParameter("passportNo");
        
        PatientData patientData = new PatientData();
        patientData.setName(name);
        patientData.setAge(age);
        patientData.setGender(gender);
        patientData.setAadharNo(aadharNo);
        patientData.setPatientLoc(patientLoc);
        patientData.setContactNo(contactNo);
        patientData.setDoctorName(doctorName);
        patientData.setCentre(centre);
        patientData.setCollectionTime(collectionTime);
        patientData.setAcceptenceTime(acceptenceTime);
        patientData.setReportedOn(reportedOn);
        patientData.setSampleUID(sampleUID);
        patientData.setOrg(organization);
        patientData.setTestResult(testResult);
        patientData.setPassportNo(passportNo);
        try {
        	
        	JasperPrint jasperPrint = exportPdfController.exportPdf(patientData);
            
                //HttpSession session = request.getSession();
                //session.setAttribute("username",username);
        	if(jasperPrint!=null) {
            	response.setContentType("application/x-download");
            	response.addHeader("Content-disposition", "attachment; filename=CovidReport_"+ patientData.getName() +".pdf");
            	OutputStream out = response.getOutputStream();
            	JasperExportManager.exportReportToPdfStream(jasperPrint,out);
            } else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                response.sendRedirect("Login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}