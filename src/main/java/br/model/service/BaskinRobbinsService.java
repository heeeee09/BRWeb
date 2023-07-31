package br.model.service;

import java.sql.Connection;

import br.model.dao.BaskinRobbinsDAO;
import br.model.vo.BaskinRobbins;
import common.JDBCTemplate;

public class BaskinRobbinsService {
	
	JDBCTemplate jdbcTemplate;
	BaskinRobbinsDAO bDao;
	public BaskinRobbinsService() {
		jdbcTemplate = JDBCTemplate.getInstance();
		bDao = new BaskinRobbinsDAO();
	}
	
	public int insertMember(BaskinRobbins member) {
		// TODO Auto-generated method stub
		Connection conn = jdbcTemplate.createConnection();
		int result = bDao.insertMember(conn, member);
		
		if(result > 0) {
			jdbcTemplate.commit(conn);
		}else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}

	public BaskinRobbins checkLogin(BaskinRobbins member) {
		Connection conn = jdbcTemplate.createConnection();
		BaskinRobbins mOne = bDao.checkLogin(conn, member);
		jdbcTemplate.close(conn);
		return mOne;
	}

//	public BaskinRobbins memberDelete(String memberPw) {
//		Connection conn = jdbcTemplate.createConnection();
//		BaskinRobbins mOnePass = bDao.deleteMember(conn, memberPw);
//		jdbcTemplate.close(conn);
//		return mOnePass;
//	}

	public int deleteMember(BaskinRobbins member) {
		Connection conn = jdbcTemplate.createConnection();
		int result = bDao.deleteMember(conn, member);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		}else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}

}
