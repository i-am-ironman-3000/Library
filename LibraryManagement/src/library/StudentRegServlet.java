package library;

import java.io.IOException;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/Register")
public class StudentRegServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		final String sname=req.getParameter("sname");
		final String uname=req.getParameter("uname");
		final String gender=req.getParameter("gender");
		final String pwd=req.getParameter("pwd");
		final Part pic=req.getPart("pic");
		String n=uname+".jpg";
		try {
			Connection con=dbutil.connect();
			final String sql="insert into student values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, sname);
			ps.setString(2, uname);
			ps.setString(3, gender);
			ps.setString(4, pwd);
			ps.setInt(5, 0);
			ps.setString(6,"images/"+n);
			
			ps.executeUpdate();
			String path=getServletContext().getRealPath("/images/");
		    pic.write(path+n);
			con.close();
			HttpSession session=req.getSession();
			session.setAttribute("msg", "Student Registered successfully...");
			resp.sendRedirect("Login.jsp");
			
		}catch(Exception ex) {
			System.out.println("Error "+ex.getMessage());
		}
	}

}
