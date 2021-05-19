package library;

import java.io.IOException;
import java.util.*;
import java.util.Date;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/ReturnBook")
public class ReturnBookServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
		String bid=req.getParameter("bid");
		String date=req.getParameter("date");
		HttpSession session=req.getSession();
		Date d=new Date();
		int fine=0;
		long total;
		try {
			Connection con=dbutil.connect();
			String sql="select * from issuebook where uname=? and bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, bid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				Date d2=rs.getDate("Date");
				int day=(int)(d.getTime()-d2.getTime())/(1000*60*60*24);
				if(day>10) {
				fine=(day-10)*10;
				}
				session.setAttribute("msg", "Fine rs"+fine);
				sql="insert into notification values(?,?)";
				ps=con.prepareStatement(sql);
				ps.setString(1, uname);
				String n="You Have Submitted your Book:"+bid+ " on "+d.toString()+" With Fine of rs:-"+fine;
				ps.setString(2, n);
				ps.executeUpdate();
				sql="delete from issuebook where uname=? and bid=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, uname);
				ps.setString(2, bid);
				ps.executeUpdate();
				sql="select * from books where bid=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, bid);
				rs=ps.executeQuery();
				rs.next();
				int qty=rs.getInt("qty");
				sql="update books set qty=? where bid=?";
				ps=con.prepareStatement(sql);
				ps.setInt(1, qty+1);
				ps.setString(2, bid);
				ps.executeUpdate();
				sql="update student set amt=? where uname=?";
				ps=con.prepareStatement(sql);
				ps.setLong(1, 0);
				ps.setString(2, uname);
				ps.executeUpdate();
				sql="insert into fine values(?,?)";
				ps=con.prepareStatement(sql);
				int y=d.getYear()+1900;
				int m=d.getMonth()+1;
				int dm=d.getDay();
				String s=y+"/"+m+"/"+dm;
				ps.setString(1,date);
				ps.setLong(2, fine);
				ps.executeUpdate();
				resp.sendRedirect("ReturnBook.jsp");
			}
			else {
				session.setAttribute("msg","Wrong uname or book id");
				resp.sendRedirect("ReturnBook.jsp");
			}
			con.close();
		}
		catch(Exception e) {
			session.setAttribute("msg", e.getMessage());
			resp.sendRedirect("ReturnBook.jsp");
		}
	}
}
