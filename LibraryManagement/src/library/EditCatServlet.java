package library;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/EditCat")
public class EditCatServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String catid=req.getParameter("catid");
		String cname=req.getParameter("cname");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			final String sql="update catogery set cname=? where catid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, cname);
			ps.setString(2, catid);
			ps.executeUpdate();
			con.close();
			session.setAttribute("msg", "Updated...");
			resp.sendRedirect("cat.jsp");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("cat.jsp");
		}
	}
}
