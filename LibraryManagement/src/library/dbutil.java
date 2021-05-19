package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class dbutil {
	public static Connection connect() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		final String URL="jdbc:mysql://localhost/library";
		final String USER="root";
		final String PWD="tannu";
		Connection con=DriverManager.getConnection(URL,USER,PWD);
		return con;
	}
	public static int count(String table)throws Exception{
		Connection con=connect();
		final String sql="select count(*) from "+table;
		ResultSet rs=con.createStatement().executeQuery(sql);
		rs.next();
		return rs.getInt(1);
		
	}
	public static String name(String bid) throws Exception{
		String bname;
		Connection con=connect();
		String sql="select * from books where bid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, bid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		bname=rs.getString("bname");
		return bname;
	}
	public static long sum() throws Exception {
		Connection con=connect();
		String sql="select sum(amt) from student";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		long l=0;
		if(rs.next()) {
			l=rs.getLong("sum(amt)");
		}
		return l;
	}
}
