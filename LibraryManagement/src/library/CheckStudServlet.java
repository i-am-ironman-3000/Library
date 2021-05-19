package library;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/checkstud")
public class CheckStudServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		try {
			Connection con=dbutil.connect();
			String sql="select * from student where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ResultSet rs=ps.executeQuery();
			HttpSession session=req.getSession();
			if(!rs.next()) {
				resp.getWriter().println("yes");
			}
			else {
				String path=rs.getString("pic");
				sql="select * from issuebook where uname=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, uname);
				rs=ps.executeQuery();
				session.setAttribute("path", path);
				if(rs.next()) {
					resp.getWriter().println("User Already get a book name"+dbutil.name(rs.getString("bid")+" On date:")+rs.getDate("Date").toString());
				}
				else {
					
					resp.getWriter().println("");
				}
			}
		}
		catch(Exception e) {
			resp.getWriter().println(e.getMessage());
		}
	}
}
