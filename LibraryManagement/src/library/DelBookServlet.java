package library;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/delbook")
public class DelBookServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid=req.getParameter("bid");
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			final String sql="delete from books where bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bid);
			ps.executeUpdate();
			con.close();
			session.setAttribute("msg", "Book deleted successfully");
			resp.sendRedirect("ViewBook.jsp");
			
		}catch(Exception ex) {
			System.out.println("Error "+ex.getMessage());
		}
	}

}
