package cn.edu.bzu.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bzu.entity.trade;

public class tradeDAO {
    public List readFirstTitle(){
        List<trade> list =new ArrayList<trade>();
        Connection con=null;
        PreparedStatement psmt=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        try {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/T2?useSSL=false","root","aptx4869");
            String sql="select * from trade";
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();
            
            while(rs.next())
            {
            	String thing=rs.getString("thing");
            	int number=rs.getInt("number");
                int price=rs.getInt("price");
                trade tl=new trade(thing, number, price);
                list.add(tl);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally
        {
            try {
                if(rs!=null)
                {
                    rs.close();
                }
                if(psmt!=null)
                {
                    psmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }  
}