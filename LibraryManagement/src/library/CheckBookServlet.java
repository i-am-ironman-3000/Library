package library;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/checkbook")
public class CheckBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid=req.getParameter("bid");
		try {
			Connection con=dbutil.connect();
			String sql="select * from books where bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				if(rs.getInt("qty")>0) {
					resp.getWriter().println("");
				}
				else {
					resp.getWriter().println("yes");
				}
			}
			else {
				resp.getWriter().println("invalid Book Id");
			}
		}
		catch(Exception e) {
			resp.getWriter().println(e.getMessage());
		}
	}
}
