package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/checkreg")
public class CheckRegServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		try {
			Connection con=dbutil.connect();
			String sql="select * from student where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				resp.getWriter().println("yes");
			}
			else {
				resp.getWriter().println("no");
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
