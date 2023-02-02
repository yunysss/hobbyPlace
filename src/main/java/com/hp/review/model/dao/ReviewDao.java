package com.hp.review.model.dao;

import static com.hp.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.lesson.model.dao.LessonDao;
import com.hp.review.model.vo.Register;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(LessonDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Register> selectWriteList(Connection conn, int memNo) {
		ArrayList<Register> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWriteList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list.add(new Register(rset.getInt("reg_no"),
									  rset.getString("teach_date"),
									  rset.getString("reg_sta"),
									  rset.getString("cl_thumb"),
									  rset.getString("cl_name"),
									  rset.getString("start_time"),
									  rset.getString("distr_name")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	

}
