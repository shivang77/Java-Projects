package com.b2e.student.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.b2e.student.bean.Student;
import com.b2e.student.dao.StudentDaoImpl;

@WebServlet("/AddStudentImageServlet")
public class AddStudentImageServlet extends HttpServlet 
{
		private static final String DATA_DIRECTORY = "images/student";
	    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
	    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
	    private String filePath;
	    private String fileName;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isMultipart =ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) 
        {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                   fileName = new File(item.getName()).getName();
                   filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }


        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
        String filepath="images/student/"+fileName;
        HttpSession hs=request.getSession();
        Student student=(Student)hs.getAttribute("student");
        student.setUrl(filepath);
        boolean b=new StudentDaoImpl().insert(student);
        if(b)
        {
        	response.sendRedirect("student/student.jsp");
        }

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
