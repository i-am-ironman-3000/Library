package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/deletecat")
public class DelCatServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String catid=req.getParameter("catid");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			final String sql="delete from catogery where catid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,catid);
			ps.executeUpdate();
			con.close();
			session.setAttribute("msg","Catogary deletd Succesfuly");
			resp.sendRedirect("cat.jsp");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("cat.jsp");
		}
	}
}
