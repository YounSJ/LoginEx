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

@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private Connection conn;
	private Statement stmt;
	
	
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwconfig = request.getParameter("pwconfig");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "scott";
		String dbpw = "tiger";
		
		String query = null;
		if(pw.equals(pwconfig)) {
			query = "insert into ex values('" + name + "', '" + id + "', '" + pw + "', '" + pwconfig + "')";		
		}else {
			System.out.println("Insert Fail");
			response.sendRedirect("JoinFail.html");
		}
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, dbid, dbpw);
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(query);
			
			if(i == 1) {
				System.out.println("Insert Success");
				response.sendRedirect("Login.html");
			}else {
				System.out.println("Insert Fail");
				response.sendRedirect("Join.html");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
