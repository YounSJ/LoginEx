package com.loginex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection conn;
	private Statement stmt;
	private ResultSet res;
	
	private String name, id, pw, pwconfig;
	
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		String query = "select * from ex where id = '" + id + "' and pw = '" + pw + "'";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "scott";
		String dbpw = "tiger";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, dbid, dbpw);
			stmt = conn.createStatement();
			res = stmt.executeQuery(query);
			
			Boolean isTrue = false;
			while(res.next()) {
				name = res.getString("name");
				id = res.getString("id");
				pw = res.getString("pw");
				pwconfig = res.getString("pwconfig");
				isTrue = true;
			}
			if(isTrue) {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				session.setAttribute("pwconfig", pwconfig);
				
				response.sendRedirect("LoginOkPage.jsp");
			}else {
				response.sendRedirect("LoginFail.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(res != null) res.close();
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
