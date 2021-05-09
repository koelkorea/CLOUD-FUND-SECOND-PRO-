package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;


import cmn.ConnectionMaker;
import cmn.DTO;
import cmn.JDBCUtil;
import cmn.StringUtil;
import cmn.WorkStandard;
import vo.MemberVO;
import vo.SearchVO;

public class MemberDao implements WorkStandard {
	
	final Logger LOG = Logger.getLogger(MemberDao.class);
	
	final static String DB_URL="jdbc:oracle:thin:@211.238.142.124:1521:xe";	
	final static String USER_ID="HAO";
	final static String USER_PASS="hao2";
	
	public MemberDao() {
		
		
	}
	
	/**
	 * 사용자 ID 유무 확인
	 * @param param
	 * @return 1/0
	 */
	public int idCheck(DTO param) {
		MemberVO inVO = (MemberVO) param;
		LOG.debug("idCheck()");
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb = new StringBuffer(500);
			sb.append(" SELECT COUNT(*) cnt ");
			sb.append(" FROM  member");
			sb.append(" WHERE m_id = :v0");
			
			LOG.debug("2.1 쿼리 실행 PreparedStatement:\n"+sb.toString());
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3. PreparedStatement"+pstmt);
			pstmt.setString(1, inVO.getM_id());
			
			rs = pstmt.executeQuery();
			LOG.debug("3.1 ResultSet :"+ rs);
			if(rs.next()==true) {
				flag = rs.getInt("cnt");
			}
			
		}catch(SQLException e) {
			LOG.debug("SQLException:"+e.getMessage());
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
			
		}
		return flag;
	}
	
	/**
	 * 사용자 ID/비번 체크 
	 * @param param
	 * @return 1/0
	 */
	public int passwordCheck(DTO param) {
		MemberVO inVO = (MemberVO) param;
		LOG.debug("passwordCheck()");
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb = new StringBuffer(500);
			sb.append(" SELECT COUNT(*) cnt ");
			sb.append(" FROM  member");
			sb.append(" WHERE m_id = :v0");
			sb.append(" AND   m_passwd    = :v2");
			
			LOG.debug("2.1 쿼리 실행 PreparedStatement:\n"+sb.toString());
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3. PreparedStatement"+pstmt);
			pstmt.setString(1, inVO.getM_id());
			pstmt.setString(2, inVO.getM_passwd());
			
			rs = pstmt.executeQuery();
			LOG.debug("3.1 ResultSet :"+ rs);
			if(rs.next()==true) {
				flag = rs.getInt("cnt");
			}
			
		}catch(SQLException e) {
			LOG.debug("SQLException:"+e.getMessage());
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
			
		}
		return flag;
	}

	@Override
	public int doInsert(DTO param) {
		int flag=0;
		
		
		MemberVO inVO = (MemberVO) param;
		
		Connection connection=null;
		PreparedStatement pstmt = null;
		
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션:"+connection);
			
			StringBuffer sb= new StringBuffer(1000);
			
			 sb.append("INSERT INTO member (\n ");
			 sb.append("m_id,                  \n ");
			 sb.append("m_name,                \n ");
			 sb.append("m_passwd,            \n ");
			 sb.append("m_status,              \n ");
			 sb.append("m_phone,               \n ");
			 sb.append("m_addr,                \n ");
			 sb.append("m_card,                \n ");
			 sb.append("reg_dt,                \n ");
			 sb.append("mod_id,                \n ");
			 sb.append("mod_dt                 \n ");
			 sb.append(")                      \n ");
			 sb.append("VALUES (               \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?,                     \n ");
			 sb.append("?                      \n ");
			 sb.append(")                      \n ");
			
			 pstmt=connection.prepareStatement(sb.toString());
			
			 LOG.debug("sb.toString() \n"+sb.toString());
			 
			 pstmt.setString(1, inVO.getM_id());	
			 pstmt.setString(2, inVO.getM_name());
			 pstmt.setString(3, inVO.getM_passwd());
			 pstmt.setString(4, inVO.getM_status());
			 pstmt.setString(5, inVO.getM_phone());
			 pstmt.setString(6, inVO.getM_addr());
			 pstmt.setString(7, inVO.getM_card());
			 pstmt.setString(8, inVO.getReg_dt());
			 pstmt.setString(9, inVO.getMod_id());
			 pstmt.setString(10, inVO.getMod_dt());
			 
			 flag = pstmt.executeUpdate();
			 LOG.debug("4.쿼리 실행 flag"+flag);
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
		
		}
		
		
		return flag;
	}//doInsert
	
	@Override
	public int doUpdate(DTO param) {
		
				int flag = 0;
				MemberVO inVO = (MemberVO) param;
				LOG.debug("0 param : " + param);
				
				Connection connection = null;
				PreparedStatement pstmt = null;
				
				try {
					connection = ConnectionMaker.getConnection();
					LOG.debug("2. 데이터베이스 커넥션 : " + connection);
					
					StringBuffer sb = new StringBuffer(1000);
					sb.append("UPDATE member       \n");
					sb.append("SET m_name = ?,     	\n");
					sb.append("	   m_passwd = ?,    \n");
					sb.append("	   m_status = ?,    \n");
					sb.append("	   m_phone = ?,     \n");
					sb.append("	   m_addr = ?,      \n");
					sb.append("    m_card = ?,		\n");
					sb.append("	   reg_dt = ?,      \n");
					sb.append("	   mod_id = ?,      \n");
					sb.append("	   mod_dt = SYSDATE      \n");
					sb.append("WHERE m_id = ?      	\n");
					LOG.debug("3. 쿼리 실행(DB) StringBuffer : " + sb.toString());
					
					pstmt = connection.prepareStatement(sb.toString());			

					pstmt.setString(1, inVO.getM_name());
					pstmt.setString(2, inVO.getM_passwd());
					pstmt.setString(3, inVO.getM_status());
					pstmt.setString(4, inVO.getM_phone());
					pstmt.setString(5, inVO.getM_addr());
					pstmt.setString(6, inVO.getM_card());
					pstmt.setString(7, inVO.getReg_dt());
					pstmt.setString(8, inVO.getM_id());
					//pstmt.setString(9, inVO.getMod_dt());
					pstmt.setString(9, inVO.getM_id());
					
					LOG.debug("4. 쿼리 실행(JAVA) PreparedStatement : " + pstmt);

					flag = pstmt.executeUpdate();
					LOG.debug("5. 쿼리 실행 결과 falg : " + flag);
				} catch (SQLException e) {
					LOG.debug("SQLException : " + e.getMessage());
					e.printStackTrace();
				} finally {

					JDBCUtil.close(pstmt);
					
					JDBCUtil.close(connection);
				}

				return flag;
	}//doUpdate


	@Override
	public DTO doSelectOne(DTO param) {//오류
		MemberVO outVO = null;
		MemberVO inVO = (MemberVO) param;
		LOG.debug("doSelectOne()");
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb = new StringBuffer(500);
			sb.append("SELECT");
			sb.append("    m_id,");
			sb.append("    m_name,");
			sb.append("    m_passwd,");
			sb.append("    m_status,");
			sb.append("    m_phone,");
			sb.append("    m_addr,");
			sb.append("    m_card,");
			sb.append("    reg_dt,");
			sb.append("    mod_id,");
			sb.append("    mod_dt ");
			sb.append("FROM  member ");
			sb.append("WHERE m_id = :v0");
			
			LOG.debug("2.1 쿼리 실행 PreparedStatement:\n"+sb.toString());
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3. PreparedStatement"+pstmt);
			pstmt.setString(1, inVO.getM_id());
			
			rs = pstmt.executeQuery();
			LOG.debug("3.1 ResultSet :"+ rs);
			if(rs.next()==true) {
				outVO =new MemberVO();
				outVO.setM_id(rs.getString("m_id"));
				outVO.setM_name(rs.getString("m_name"));
				outVO.setM_passwd(rs.getString("m_passwd"));
				outVO.setM_status(rs.getString("m_status"));
				outVO.setM_phone(rs.getString("m_phone"));
				outVO.setM_addr(rs.getString("m_addr"));
				outVO.setM_card(rs.getString("m_card"));
				outVO.setReg_dt(rs.getString("reg_dt"));
				outVO.setMod_id(rs.getString("mod_id"));
				outVO.setMod_dt(rs.getString("mod_dt"));
			}
			LOG.debug("3.2 outVO:"+outVO);
			
		}catch(SQLException e) {
			LOG.debug("SQLException:"+e.getMessage());
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
			
		}
		return outVO;
	}
	
	@Override
	public List<?> doRetrieve(DTO param) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		SearchVO inVO = (SearchVO)param;
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sbWhere = new StringBuffer(500);//동적 검색
			//m_name(10) m_id(20) m_phone(30)
			if(null !=inVO && inVO.getSearchDiv() !="") {
				
				if(inVO.getSearchDiv().equals("10")) {
					sbWhere.append("WHERE m_name LIKE ? || '%' \n");
					
				}else if(inVO.getSearchDiv().equals("20")){
					sbWhere.append("WHERE m_id LIKE ? || '%' \n");
					
				}else if(inVO.getSearchDiv().equals("30")){
					sbWhere.append("WHERE m_phone LIKE ? || '%' \n");
				}
			}
			
			StringBuffer sb = new StringBuffer(2000);//Main Query
			sb.append(" SELECT TT1.RNUM num,                                                                                               \n"); 
			sb.append("        TT1.m_id,                                                                                              \n");
			sb.append("        TT1.m_name,                                                                                                   \n");
			sb.append("        TT1.m_passwd,                                                                                                 \n");
			sb.append("        TT1.m_status,                                                                                                  \n");
			sb.append("        TT1.m_phone,                                                                                                    \n");
			sb.append("        TT1.m_addr,                                                                                                    \n");
			sb.append("        TT1.m_card,                                                                                                    \n");
			sb.append("        TT1.mod_id,                                                                                                 \n");
			sb.append("        CASE WHEN TO_CHAR(SYSDATE,'YYYY/MM/DD')=TO_CHAR(TT1.mod_dt,'YYYY/MM/DD')  THEN TO_CHAR(TT1.mod_dt,'HH24:MI')\n");
			sb.append("           ELSE TO_CHAR(TT1.mod_dt,'YYYY/MM/DD')                                                                    \n");
			sb.append("        END mod_dt                                                                                                  \n");
			sb.append(" FROM (                                                                                                             \n");
			sb.append("     SELECT rownum rnum,T1.*                                                                                        \n");
			sb.append("     FROM (                                                                                                         \n");
			sb.append("         SELECT *                                                                                                   \n");
			sb.append("         FROM member                                                                                                \n");
			sb.append("         WHERE m_id>'0'                                                                                        \n");
			//----------------------------------------------------------------------------------------------------------------------------------------
			//where
			//----------------------------------------------------------------------------------------------------------------------------------------
			
			//****************************
			sb.append(sbWhere.toString());
			//****************************
			
			sb.append("         ORDER BY MOD_DT DESC                                                                                       \n");
			sb.append("     )T1                                                                                                            \n");
			sb.append(" )TT1                                                                                                               \n");
			sb.append(" WHERE rnum BETWEEN ?*(?-1)+1 AND ? * (?-1)+?                                                                       \n");
			//sb.append(" WHERE rnum BETWEEN :PAGE_SIZE*(:PAGE_NUM-1)+1 AND :PAGE_SIZE*(:PAGE_NUM-1)+:PAGE_SIZE                              \n");
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3.PreparedStatement:"+pstmt);
			LOG.debug("3.0 SQL :\n:"+sb.toString());
			
			int i=0;
			//검색조건이 있는 경우
			if(null !=inVO && inVO.getSearchDiv()!="") {
				pstmt.setString(++i, inVO.getSearchWord());
				pstmt.setInt(++i, inVO.getPageSize());
				pstmt.setInt(++i, inVO.getPageNum());
				pstmt.setInt(++i, inVO.getPageSize());
				pstmt.setInt(++i, inVO.getPageNum());
				pstmt.setInt(++i, inVO.getPageSize());
			}else {
				pstmt.setInt(++i, inVO.getPageSize());
				pstmt.setInt(++i, inVO.getPageNum());
				pstmt.setInt(++i, inVO.getPageSize());
				pstmt.setInt(++i, inVO.getPageNum());
				pstmt.setInt(++i, inVO.getPageSize());
			}
			rs = pstmt.executeQuery();
			LOG.debug("3.1 ResultSet :"+rs);
			while(rs.next() == true) {
				MemberVO member=new MemberVO();
				member.setNum(rs.getInt("num"));
				member.setM_id(rs.getString("m_id"));
				member.setM_name(rs.getString("m_name"));
				member.setM_passwd(rs.getString("m_passwd"));
				member.setM_status(rs.getString("m_status"));
				member.setM_phone(rs.getString("m_phone"));
				member.setM_addr(rs.getString("m_addr"));
				member.setM_card(rs.getString("m_card"));
				member.setMod_id(rs.getString("mod_id"));
				member.setMod_dt(rs.getString("mod_dt"));
				
				list.add(member);
			}
			
			for(MemberVO vo :list) {
				LOG.debug(vo);
			}
			LOG.debug("조회 데이터 사이즈:"+list.size());
			
			
		}catch(SQLException e) {
			LOG.debug("SQLException:"+e.getMessage());
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
		}
		
		return list;
	}
	
	@Override
	public int doDelete(DTO param) {
		int flag = 0;
		MemberVO inVO=(MemberVO) param;
		LOG.debug("doDelete()");
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt = null;
		try {
			connection =ConnectionMaker.getConnection();
			StringBuffer sb = new StringBuffer(50);
			sb.append("DELETE FROM member 	\n");
			sb.append("WHERE m_id = ?	\n");
			pstmt = connection.prepareStatement(sb.toString());
			
			LOG.debug("2.1. 쿼리 실행PreparedStatement:\\n"+sb.toString());
			LOG.debug("3. 쿼리 실행PreparedStatement"+pstmt);
			//param set
			pstmt.setString(1, inVO.getM_id());
			//4. 쿼리실행:
			flag = pstmt.executeUpdate();
			LOG.debug("4. 쿼리실행flag:"+flag);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
		}
		
		return flag;
	}

}
