package br.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.board.model.vo.BRBoard;

public class BRBoardDAO {
	
	public int boardInsert(Connection conn, BRBoard board) {
		String query = "INSERT INTO BR_CUSOMOR_BOARD_TBL VALUES(SEQ_CUSTOMOR_BOARD_NO.NEXTVAL,?,?,DEFAULT,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getBoardSubject());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setString(3, board.getBoardWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public List<BRBoard> selectList(Connection conn, String boardWriter) {
		String query = "SELECT CUSTOMOR_BOARD_SUBJECT, CUSTOMOR_BOARD_CONTENT FROM BR_CUSTOMOR_BOARD_TBL INNER JOIN BR_MEMBER_TBL "
				+ "ON CUSTOMOR_BOARD_WRITER = MEMBER_ID WHERE CUSTOMOR_BOARD_WRITER = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<BRBoard> bList = new ArrayList<BRBoard>(); 
		BRBoard board = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boardWriter);
			while(rset.next()) {
				board.setBoardNo(rset.getInt("CUSTOMOR_BOARD_NO"));
				board.setBoardSubject(rset.getString("CUSTOMOR_BOARD_SUBJECT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bList;
	}
}
