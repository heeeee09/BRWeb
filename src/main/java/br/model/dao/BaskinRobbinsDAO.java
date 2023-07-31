package br.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.model.vo.BaskinRobbins;

public class BaskinRobbinsDAO {

	public int insertMember(Connection conn, BaskinRobbins member) {
		
		String query = "INSERT INTO BR_MEMBER_TBL VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberBirth());
			pstmt.setString(5, member.getMemberGender());
			pstmt.setString(6, member.getMemberEmail());
			pstmt.setString(7, member.getMemberPhone());
			pstmt.setString(8, member.getMemberAddress());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int deleteMember(Connection conn, BaskinRobbins member) {
		String query = "DELETE FROM BR_MEMBER_TBL WHERE MEMBER_ID=? AND MEMBER_PWD=?";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public BaskinRobbins checkLogin(Connection conn, BaskinRobbins member) {
		String query = "SELECT * FROM BR_MEMBER_TBL WHERE MEMBER_ID=? AND MEMBER_PWD=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BaskinRobbins mOne = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				mOne = rsetToMember(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mOne;
	}
	
	public BaskinRobbins rsetToMember(ResultSet rset) throws SQLException {
		BaskinRobbins member = new BaskinRobbins();
		member.setMemberId(rset.getString("MEMBER_ID"));
		member.setMemberPw(rset.getString("MEMBER_PWD"));
		member.setMemberName(rset.getString("MEMBER_NAME"));
		member.setMemberBirth(rset.getString("MEMBER_BIRTHDAY"));
		member.setMemberGender(rset.getString("MEMBER_GENDER"));
		member.setMemberEmail(rset.getString("MEMBER_EMAIL"));
		member.setMemberPhone(rset.getString("MEMBER_PHONE"));
		member.setMemberAddress(rset.getString("MEMBER_ADDRESS"));
		return member;
	}

}
