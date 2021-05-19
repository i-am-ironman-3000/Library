package library;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/addcat")
public class AddCatServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cname=req.getParameter("cname");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			final String sql="insert into catogery(cname) values(?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, cname);
			ps.executeUpdate();
			con.close();
			session.setAttribute("msg", "Catogary Added..");
			resp.sendRedirect("cat.jsp");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("cat.jsp");
		}
	}
}
