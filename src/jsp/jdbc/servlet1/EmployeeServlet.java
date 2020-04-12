package jsp.jdbc.servlet1;

import jsp.jdbc.bean.Employee;
import jsp.jdbc.database.EmployeeDao;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDao employeeDao;

    public void init() {
        employeeDao = new EmployeeDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	String submitType = request.getParameter("submit");
		System.out.println(submitType);
	    if(submitType.equals("Login"))
	    {
	    	HttpSession session = request.getSession();
	    	
	    	String user = request.getParameter("uname");    
		    String pwd = request.getParameter("pass");
		   
		    Employee ep1 = employeeDao.getPatient(user, pwd);
		    System.out.println(ep1.getFname());
	    	if(ep1!=null && ep1.getFname()!=null){
	    	session.setAttribute("userid",ep1.getFname());
	    	request.getRequestDispatcher("Search.jsp").forward(request, response);
	    	}
	    	else {
	    		session.setAttribute("userid",null);
		    	request.getRequestDispatcher("Login.jsp").forward(request, response);
		    }
	    }
	    
	    
	    else if(submitType.equals("Sign Up"))
	    {
	    	 String user = request.getParameter("uname");    
	 		 String pwd = request.getParameter("pass");
	    	 Employee ep1 = employeeDao.getPatient(user, pwd);
	    	 if(ep1.getUname()==null) {
	    		 Employee employee = new Employee();
	    		 String fname = request.getParameter("fname");
	    		 String lname = request.getParameter("lname");
	    		 String age = request.getParameter("age");
	    		 String loc = request.getParameter("loc");
	    		 String mob = request.getParameter("mob");
	    		 String email = request.getParameter("email");
	    		 //String submitType = request.getParameter("submit");
	    		 employee.setFname(fname);
	    		 employee.setLname(lname);
	    		 employee.setAge(Integer.parseInt(age));
	    		 employee.setLoc(loc);
	    		 employee.setMob(mob);
	    		 employee.setEmail(email);
	    		 employee.setUname(user);
	    		 employee.setPass(pwd);
	    		 try {
	    			 employeeDao.registerEmployee(employee);
	    		 	} catch (Exception e) {
	    			 // TODO Auto-generated catch block
	    			 e.printStackTrace();
	    		 }
	    		 request.setAttribute("message","Data found");
	    		 request.getRequestDispatcher("Login.jsp").forward(request, response);
	    	 }
	    	 else{
	    		 
		    	request.getRequestDispatcher("Login.jsp").forward(request, response);
	    	 }
	    }
	    else if(submitType.equals("Search"))
	    {
	    	
	        try {
	        	HttpSession session = request.getSession();
	        	
	            String eid = request.getParameter("loc");
	            String eid1 = request.getParameter("spec");
	            ArrayList al = null;
	            ArrayList pid_list = new ArrayList();
	           
	            ResultSet rs = employeeDao.searchPatient(eid, eid1);
	            
	            while (rs.next()) {
	                al = new ArrayList();
	                al.add(rs.getString(1));
	                al.add(rs.getString(2));
	                al.add(rs.getString(3));
	                al.add(rs.getString(4));
	                al.add(rs.getString(5));
	                al.add(rs.getString(6));
	                System.out.println("al :: " + al);
	                pid_list.add(al);
	            }
	            Employee e=new Employee();
	            session.setAttribute("message",e.getUname());
	            request.setAttribute("piList", pid_list);
	            RequestDispatcher view = request.getRequestDispatcher("view.jsp");
	            view.forward(request, response);
	     
	            System.out.println("Disconnected!");
	        } catch (Exception e) {
	            e.printStackTrace();
	           
	        }
	       /* HttpSession session = request.getSession(false);
	    	if(session!=null) {
	    	session.setAttribute("userid", null);
	    	session.invalidate();
	    	request.getRequestDispatcher("Login.jsp").forward(request, response);
	    	}*/
	    }
	    /*else if(submitType.equals("View"))
	    {
	    	HttpSession session = request.getSession(false);
			if(session!=null)
			{
				session.setAttribute("userid", null);
			}	
				session.invalidate();
				//request.setAttribute("message","logged out");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
				requestDispatcher.forward(request,response);
				
			
	    }*/
	    else {
	    	HttpSession session = request.getSession(false);
	    	if(session!=null) {
	    	session.setAttribute("userid", null);
	    	session.invalidate();
	    	request.getRequestDispatcher("Login.jsp").forward(request, response);
	    	}
	    }	
	    
    }    
}