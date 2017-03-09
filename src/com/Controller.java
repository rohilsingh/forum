package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Controller() {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	if(request.getParameter("id")!=null){
    		String answer=request.getParameter("answer");
        	int id=Integer.parseInt(request.getParameter("id"));
    		
    	    response.setContentType("text/html");
    	    
    	    Query.addAnswer(answer, id);
    	    
    	    request.getRequestDispatcher("index.jsp?q="+id).forward(request, response);
    	}
    	
    	if(request.getParameter("question")!=null){
    		String question=request.getParameter("question");
    		response.setContentType("text/html");
    		int id=Query.addQuestion(question);
    	    
    	    request.getRequestDispatcher("index.jsp?q="+id).forward(request, response);

    		
    	}
	    
	    
	    
	}

}
