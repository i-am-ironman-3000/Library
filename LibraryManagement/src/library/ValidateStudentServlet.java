package library;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Login")
public class ValidateStudentServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	final String uname=req.getParameter("uname");
	final String pwd=req.getParameter("pwd");
	HttpSession session=req.getSession();
	try {
		Connection con=dbutil.connect();
		final String sql="select * from student where uname=? and pwd=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, uname);
        ps.setString(2, pwd);
        ResultSet rs=ps.executeQuery();
        if(rs.next()) {
        	session.setAttribute("uname", uname);
        	session.setAttribute("sname", rs.getString("name"));
        	session.setAttribute("pic", rs.getString("pic"));
        	resp.sendRedirect("SDashboard.jsp");
        }else {
        	session.setAttribute("msg", "Invalid user name or password");
        	resp.sendRedirect("Login.jsp");
        }
		
	}catch(Exception ex) {
		System.out.println("Error "+ex.getMessage());
	}
	
}
}
