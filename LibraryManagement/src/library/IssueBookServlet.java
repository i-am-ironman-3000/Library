package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/issuebook")
public class IssueBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		String bid=req.getParameter("bid");
		String date=req.getParameter("Date");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			String sql="insert into issuebook values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ps.setString(2, uname);
			ps.setString(3, date);
			ps.executeUpdate();
			sql="select * from books where bid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int n=rs.getInt("qty");
			sql="update books set qty=? where bid=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, n-1);
			ps.setString(2, bid);
			ps.executeUpdate();
			sql="insert into notification values(?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			String m="Issued a book Book Id:"+bid+" On Date"+date;
			ps.setString(2, m);
			ps.executeUpdate();
			session.setAttribute("msg", "book Issued");
			resp.sendRedirect("issuebook.jsp");
		}
		catch(Exception e) {
			resp.getWriter().println(e.getMessage());
		}
	}
}
