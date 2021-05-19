package library;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/changepass")
public class ChangeAdminPwd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd=req.getParameter("pwd");
		String npwd=req.getParameter("npwd");
		HttpSession session=req.getSession();
		String uname=session.getAttribute("uname").toString();
		try {
			Connection conn=dbutil.connect();
			final String sql="select * from users where uname=? and pwd=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				ps=conn.prepareStatement("update users set pwd=? where uname=?");
				ps.setString(1, npwd);
				ps.setString(2, uname);
				ps.executeUpdate();
				session.setAttribute("msg","Password Changed");
				resp.sendRedirect("ChangePass.jsp");
				
			}else {
				session.setAttribute("msg","Current Password not matched......");
				resp.sendRedirect("ChangePass.jsp");
				
			}
			
		}
		catch(Exception ex) {
			System.out.println("Error "+ex.getMessage());
		}
	}

}
