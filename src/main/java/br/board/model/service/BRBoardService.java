package br.board.model.service;

import java.sql.Connection;
import java.util.List;

import br.board.model.dao.BRBoardDAO;
import br.board.model.vo.BRBoard;
import br.board.model.vo.PageData;
import common.JDBCTemplate;

public class BRBoardService {
	
	private JDBCTemplate jdbcTemplate;
	private BRBoardDAO bDao;
	
	public BRBoardService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		bDao = new BRBoardDAO();
	}

	public PageData selectBoardList(int currentPage, String boardWriter) {
		Connection conn = jdbcTemplate.createConnection();
		List<BRBoard>bList = bDao.selectBoardList(conn, currentPage, boardWriter);
		String pageNavi = bDao.generatePageNavi(currentPage);
		PageData pd = new PageData(bList, pageNavi);
		jdbcTemplate.close(conn);
		return pd;
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

	public PageData selectBoardNavi(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

}
