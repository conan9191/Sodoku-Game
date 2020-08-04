package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import Entity.rank;
import util.DBHelper;
import util.MyComparator;

public class rankDAO {
	
	public ArrayList<rank> getAllRank(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<rank> list = new ArrayList<rank>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from rank order by second ASC ;";		
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();  
	    	
			while(rs.next()) {
				rank r = new rank();
				r.setId(rs.getInt("id"));
				r.setName(rs.getString("name"));
				r.setSecond(rs.getInt("second"));
				r.setDifficulty(rs.getString("difficulty"));
				list.add(r);
			}
			return list;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return null; 
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
					rs = null;
				}
				catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			if(stmt!=null) {
				try {
					stmt.close();
					stmt = null;
				}
				catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	public void AddNewRank(String name,int second,String difficulty){
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBHelper.getConnection();
			String sql = "Insert into rank(name,second,difficulty) values('" + name + "','" + second + "','" + difficulty + "')";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
	    	
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(stmt!=null) {
				try {
					stmt.close();
					stmt = null;
				}
				catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}

	}
}
