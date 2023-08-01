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

	public int oneMemberModify(BaskinRobbins memberEdit) {
		Connection conn = jdbcTemplate.createConnection();
		int result = bDao.oneMemberModify(conn, memberEdit);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		}else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}

	public Boolean userCheck(String memberId, String pwCheck) {
		// 로그인 되어 있는 아이디와 확인을 위해 입력한 비밀번호의 값을 체크한다.
		// 저장된 정보가 있으면 true 리턴, 없으면 false 리턴
		Connection conn = jdbcTemplate.createConnection();
		BaskinRobbins check = bDao.checkPassword(conn, memberId, pwCheck);
		if(check != null) {
			return true;
		} else {
			return false;
		}
	}

	public int deleteMember(String memberId, String memberPw) {
		Connection conn = jdbcTemplate.createConnection();
		int result = bDao.deleteMember(conn, memberId, memberPw);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		}else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}

	public int noticeInsert(BaskinRobbins notice) {
		Connection conn = jdbcTemplate.createConnection();
		int result = bDao.noticeInsert(notice);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		}else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}
}
