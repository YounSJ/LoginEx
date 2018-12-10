package com.loginex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection conn;
	private Statement stmt;
	
	String name, id, pw, pwconfig;
	
	String query = "update ex set name ='" + name + "'";
	
	HttpSession session;
	
    public ModifyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		
		session = request.getSession();
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		pwconfig = request.getParameter("pwconfig");
		
		if(pwConfirm()) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
				stmt = conn.createStatement();
				int i = stmt.executeUpdate(query);
				if(i == 1){
					System.out.println("update success");
					session.setAttribute("name", name);
					response.sendRedirect("modifyResult.jsp");
				} else {
					System.out.println("update fail");
					response.sendRedirect("modify.jsp");
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch (Exception e) {}
			}
				
			}else {
				System.out.println("NG");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private boolean pwConfirm() {
		boolean rs = false;
		
		String sessionPw = (String)session.getAttribute("pw"); //session pw = modify.jsp에서 입력한 pw
		
		if(sessionPw.equals(pw)) {
			rs = true;
		} else {
			rs = false;
		}
		
		return rs;
	}

}
