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
@WebServlet("/addbook")
@MultipartConfig
public class AddBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String catid=req.getParameter("catid");
		String bname=req.getParameter("bname");
		String price=req.getParameter("price");
		String qty=req.getParameter("qty");
		Part pic=req.getPart("file");
		HttpSession session=req.getSession();
		try {
			String n=dbutil.count("books")+".jpg";
			Connection con=dbutil.connect();
			final String sql="insert into books(bname,catid,price,qty,path) values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, bname);
			ps.setString(2, catid);
			ps.setString(3, price);
			ps.setString(4, qty);
			ps.setString(5, "images/"+n);
			String path=getServletContext().getRealPath("/images/");
			pic.write(path+n);
			ps.executeUpdate();
			con.close();
			session.setAttribute("msg", "pic Added");
			resp.sendRedirect("AddBook.jsp");
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("AddBook.jsp");
		}
	}
}
