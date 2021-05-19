package library;
import java.util.Date;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/notify")
public class NotifyServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		try {
			Connection con=dbutil.connect();
			String sql="select * from issuebook";
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				String uname=rs.getString("uname");
				String bid=rs.getString("bid");
				Date d=rs.getDate("Date");
				Date d1=new Date();
				int day=(int)(d1.getTime()-d.getTime())/(1000*60*60*24);
				int fine=0;
				if(day>10) {
					fine=(day-10)*10;
				}
				String m="Book Issued:"+dbutil.name(bid)+" on Date:"+d.toString()+" fine:"+fine+" Of total days:"+day;
				String sql2="insert into notification values(?,?)";
				PreparedStatement ps2=con.prepareStatement(sql2);
				ps2.setString(1, uname);
				ps2.setString(2, m);
				ps2.executeUpdate();
				sql2="update student set amt=? where uname=?";
				ps2=con.prepareStatement(sql2);
				ps2.setLong(1, fine);
				ps2.setString(2, uname);
				ps2.executeUpdate();
			}
			con.close();
			session.setAttribute("msg", "Notified....");
			resp.sendRedirect("AdminDash.jsp");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
