package br.board.model.service;

import java.sql.Connection;
import java.util.List;

import br.board.model.dao.BRBoardDAO;
import br.board.model.vo.BRBoard;
import common.JDBCTemplate;

public class BRBoardService {
	
	private JDBCTemplate jdbcTemplate;
	private BRBoardDAO bDao;
	
	public BRBoardService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		bDao = new BRBoardDAO();
	}

	public List<BRBoard> selectBoardList(String boardWriter) {
		Connection conn = jdbcTemplate.createConnection();
		List<BRBoard>bList = bDao.selectList(conn, boardWriter);
		jdbcTemplate.close(conn);
		return bList;
	}
	
	public int boardInsert(BRBoard board) {
		Connection conn = jdbcTemplate.createConnection();
		int result = bDao.boardInsert(conn, board);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		}else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}

}
