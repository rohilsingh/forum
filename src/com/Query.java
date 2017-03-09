package com;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Query {
	
	public Query(){
		
	}
	
	public static int count(){
		
		try {
			new Connector();
			java.sql.Statement st=Connector.con.createStatement();
			ResultSet rs=st.executeQuery("select count(id) from forumq");
			rs.next();
			return Integer.parseInt(rs.getString(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public static String question(int i){
		try {
			new Connector();
			java.sql.PreparedStatement pst=Connector.con.prepareStatement("select question from forumq where id=?");
			pst.setInt(1, i);
			ResultSet rs=pst.executeQuery();
			rs.next();
			//System.out.println(rs.getString(1));
			return rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static String[] answer(int i){
		try {
			new Connector();
			java.sql.PreparedStatement pst=Connector.con.prepareStatement("select answer from foruma where qid=?");
			pst.setInt(1, i);
			ResultSet rs=pst.executeQuery();
			int count=0;
			while(rs.next()){
				count++;
			}
			rs=pst.executeQuery();
			String ans[]=new String[count];
			for(int j=0;j<count;j++){
				rs.next();
				ans[j]=rs.getString(1);
			}
			return ans;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void addAnswer(String ans,int id){
		new Connector();
		try {
			PreparedStatement pst=Connector.con.prepareStatement("insert into foruma values(?,?)");
			pst.setInt(1,id);
			pst.setString(2, ans);
			int res=pst.executeUpdate();
			System.out.println(res);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static int addQuestion(String ques){
		new Connector();
		try {
			PreparedStatement pst=Connector.con.prepareStatement("insert into forumq (question) values(?)");
			pst.setString(1, ques);
			int res=pst.executeUpdate();
			System.out.println(res);
			int last=count();
			return last;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
}

	

	
}
