package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/OkServlet")
public class OkBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		String bid=req.getParameter("bid");
		String date=req.getParameter("date");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			String sql="delete from issuebook where uname=? and bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,uname);
			ps.setString(2, bid);
			ps.executeUpdate();
			sql="insert into fine values(?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, date);
			ps.setLong(2, (long)session.getAttribute("fine"));
			ps.executeUpdate();
			sql="insert into notification values(?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, "You Lost a book"+dbutil.name(bid)+", and Pay the fine"+session.getAttribute("fine"));
			ps.executeUpdate();
			session.removeAttribute("fine");
			resp.sendRedirect("AdminDash.jsp");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
