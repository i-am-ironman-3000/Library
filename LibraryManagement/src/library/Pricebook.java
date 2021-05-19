package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/price")
public class Pricebook extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid=req.getParameter("bid");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			String sql="select price from books where bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				resp.getWriter().println("You Have To Pay:"+rs.getLong("price"));
				session.setAttribute("fine",rs.getLong("price"));
				
			}
			else {
				resp.getWriter().println("Invalid Id");
			}
		}
		catch(Exception e) {
			
		}
	}
}
