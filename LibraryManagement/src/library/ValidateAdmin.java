package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Resultset;
@WebServlet("/User")
public class ValidateAdmin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("suname");
		String pwd=req.getParameter("spwd");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			final String sql="select * from users where uname=? and pwd=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				session.setAttribute("uname", uname);
				session.setAttribute("name", rs.getString("name"));
				resp.sendRedirect("AdminDash.jsp");
			}
			else {
				session.setAttribute("msg","password didn't match :(");
				resp.sendRedirect("Login.jsp");
			}
		}
		catch(Exception e) {
			session.setAttribute("msg",e.getMessage());
			resp.sendRedirect("Login.jsp");
		}
	}
}
