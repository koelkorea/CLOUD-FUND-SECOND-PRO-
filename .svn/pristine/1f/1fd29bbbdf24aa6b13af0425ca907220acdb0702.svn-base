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
import vo.ProjectVO;
import vo.SearchVO;
import vo.SupporterVO;

public class SupporterDao implements WorkStandard{

	final Logger LOG = Logger.getLogger(SupporterDao.class);
	
	final static String DB_URL="jdbc:oracle:thin:@211.238.142.124:1521:xe";	
	final static String USER_ID="HAO";
	final static String USER_PASS="hao2";

	
	public SupporterDao() {
		
		
	}
	
	/**
	 * 후원하기
	 * @param param
	 * @return 성공:1, 실패:0
	 */

	@Override
	public int doInsert(DTO param) {
		int flag=0;
		
		
		SupporterVO inVO = (SupporterVO) param;
		Connection connection=null;
		PreparedStatement pstmt = null;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb= new StringBuffer(1000);
			 sb.append("INSERT INTO supporter (\n ");
			 sb.append("s_seq,                 \n ");
			 sb.append("s_m_id,                \n ");
			 sb.append("s_p_seq,               \n ");
			 sb.append("s_addr,                \n ");
			 sb.append("s_fund,                \n ");
			 //sb.append("s_date,                \n ");
			// sb.append("s_status,              \n ");
			 sb.append("mod_id,                \n ");
			 sb.append("mod_dt                 \n ");
			 sb.append(")                      \n ");
			 sb.append("VALUES (               \n ");
			 //sb.append("?,                     \n ");
			 //sb.append("?,                     \n ");
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
				
			 
			 String sPK="s"+StringUtil.getPK("");
			 inVO.setS_seq(sPK);
			 
			 pstmt.setString(1, inVO.getS_seq());	
			 pstmt.setString(2, inVO.getS_m_id());
			 pstmt.setInt(3, inVO.getS_p_seq());
			 pstmt.setString(4, inVO.getS_addr());
			 pstmt.setInt(5, inVO.getS_fund());
			 //pstmt.setString(6, inVO.getS_date());
			 //pstmt.setString(7, inVO.getS_status());
			 pstmt.setString(6, inVO.getMod_id());
			 pstmt.setString(7, inVO.getMod_dt());
			 
			 flag = pstmt.executeUpdate();
			 LOG.debug("4.쿼리 실행 flag"+flag);
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			//6.PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			//7.Connection 반납
			JDBCUtil.close(connection);
		
		}
		
		
		return flag;
	}//doInsert
	
	
	
	
	/**
	 * 프로젝트 상태에 맞춰 같이 업데이트
	 * @param param
	 * @return 성공:1, 실패:0
	 */		
	@Override
	public int doUpdate(DTO param) {
		int flag=0;
		
		
		SupporterVO inVO = (SupporterVO) param;
		Connection connection=null;
		PreparedStatement pstmt = null;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb = new StringBuffer(50);
			
			sb.append("UPDATE supporter t1                     \n");
			sb.append("SET                                     \n");
			sb.append("s_status = ( SELECT t2.p_status         \n");
			sb.append("            FROM project t2             \n");
			sb.append("            WHERE t1.s_p_seq = t2.p_seq \n");
			sb.append(")                                       \n");


			 pstmt=connection.prepareStatement(sb.toString());
			
			 LOG.debug("sb.toString() \n"+sb.toString());
							 						 
			 flag = pstmt.executeUpdate();
			 LOG.debug("4.쿼리 실행 flag"+flag);
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			//6.PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			//7.Connection 반납
			JDBCUtil.close(connection);
		
		}
		
		
		return flag;
	}
	
	
	
	public int doChangeStatus() {
		int flag=0;
		
		
		
		Connection connection=null;
		PreparedStatement pstmt = null;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb = new StringBuffer(2000);
			
			sb.append("UPDATE supporter t1                     \n");
			sb.append("SET                                     \n");
			sb.append("s_status = ( SELECT t2.p_status         \n");
			sb.append("            FROM project t2             \n");
			sb.append("            WHERE t1.s_p_seq = t2.p_seq \n");
			sb.append(")                                       \n");
			sb.append("WHERE s_status='0'                      \n");


			 pstmt=connection.prepareStatement(sb.toString());
			
			 LOG.debug("sb.toString() \n"+sb.toString());
							 						 
			 flag = pstmt.executeUpdate();
			 LOG.debug("4.쿼리 실행 flag"+flag);
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			//6.PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			//7.Connection 반납
			JDBCUtil.close(connection);
		
		}
		
		
		return flag;
	}
	
	
	/**
	 * 후원 취소,펀딩 실패
	 * @param param
	 * @return 성공:1, 실패:0
	 */			
	@Override
	public int doDelete(DTO param) {
	int flag=0;
		
		
		SupporterVO inVO = (SupporterVO) param;
		Connection connection=null;
		PreparedStatement pstmt = null;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			StringBuffer sb = new StringBuffer(50);
			
			sb.append("UPDATE supporter \n");
			sb.append("SET s_status ='2' \n");
			sb.append("   ,mod_id =?   \n");	
			sb.append("   ,mod_dt =SYSDATE \n");
			sb.append("WHERE  s_seq =?    \n");

			 pstmt=connection.prepareStatement(sb.toString());
			
			 LOG.debug("sb.toString() \n"+sb.toString());
				
			 pstmt.setString(1, inVO.getMod_id());	
				
			 pstmt.setString(2, inVO.getS_seq());	
			 
			 flag = pstmt.executeUpdate();
			 LOG.debug("4.쿼리 실행 flag"+flag);
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			//6.PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			//7.Connection 반납
			JDBCUtil.close(connection);
		
		}
		
		
		return flag;
	}//사용 안함
	
	
	
	
	/**
	 * 후원자 리스트
	 * 내가 진행중인 프로젝트 클릭시
	 * 모든 후원자들 내역 출력
	 * @param param
	 * @return 성공:1, 실패:0
	 */			
	@Override
	public List<SupporterVO> doRetrieve(DTO param) {
		List<SupporterVO> list = new ArrayList<SupporterVO>();
		SearchVO inVO = (SearchVO) param;
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			
			StringBuffer sb = new StringBuffer(2000);
			
			sb.append("SELECT a.s_seq                               \n");
			sb.append("	  ,a.s_m_id                                 \n");
			sb.append("	  ,a.s_p_seq                                \n");
			sb.append("	  ,a.s_addr                                 \n");
			sb.append("	  ,a.s_fund                                 \n");
			sb.append("	  ,a.s_date                                 \n");
			sb.append("	  ,a.s_status                               \n");
			sb.append("	  ,b.cnt                                    \n");
			sb.append("FROM(                                        \n");
			sb.append("		SELECT TT1.*                            \n");
			sb.append("		FROM(                                   \n");
			sb.append("			SELECT rownum rnum,T1.*             \n");
			sb.append("			FROM(                               \n");
			sb.append("				SELECT *                        \n");
			sb.append("				FROM supporter                  \n");
			sb.append("				WHERE s_p_seq=?                 \n");
			sb.append("				ORDER BY s_date ASC             \n");
			sb.append("			) T1                                \n");
			sb.append("		) TT1                                   \n");
			sb.append("	WHERE rnum BETWEEN ?*(?-1)+1 AND ? * (?-1)+?\n");
			//------------------테스트 용-----------
			//sb.append("		WHERE rnum BETWEEN 1 AND 10           \n");
			//---------------------------------------
			sb.append(")A CROSS JOIN(                               \n");
			sb.append("SELECT COUNT(*) CNT                          \n");
			sb.append("FROM supporter                               \n");
			sb.append("WHERE s_p_seq=?                              \n");
			sb.append(")B                                           \n");

			LOG.debug("sb.toString() \n"+sb.toString());
			
			
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3. PreparedStatement:"+pstmt);
			
				
			pstmt.setInt(1, Integer.parseInt(inVO.getSearchWord()));
			pstmt.setInt(2, inVO.getPageSize());
			pstmt.setInt(3, inVO.getPageNum());
			pstmt.setInt(4, inVO.getPageSize());
			pstmt.setInt(5, inVO.getPageNum());
			pstmt.setInt(6, inVO.getPageSize());
			pstmt.setInt(7, Integer.parseInt(inVO.getSearchWord()));
			
			rs=pstmt.executeQuery();
			LOG.debug("3.1. ResultSet:"+rs);
			
			while(rs.next()==true) {
				SupporterVO spList= new SupporterVO();
				
				spList.setS_seq(rs.getString("s_seq"));
				spList.setS_m_id(rs.getString("s_m_id"));
				spList.setS_p_seq(rs.getInt("s_p_seq"));
				spList.setS_addr(rs.getString("s_addr"));
				spList.setS_fund(rs.getInt("s_fund"));
				spList.setS_date(rs.getString("s_date"));
				spList.setS_status(rs.getString("s_status"));
				spList.setTotalCnt(rs.getInt("cnt"));
					
				list.add(spList);
			}//while
			
			//조회 데이터 확인
			LOG.debug("========================");
			for(SupporterVO vo:list) {
				LOG.debug(vo);
			}
			LOG.debug("==================조회건수"+list.size());
			
			
			
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			//6.PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			//7.Connection 반납
			JDBCUtil.close(connection);
		
		}
		
		return list;
	}

	
	
	/**
	 * 후원자 상세내역
	 * 클릭시 후원판 프로젝트로 이동
	 * @param param
	 * @return 성공:1, 실패:0
	 */
	public List<SupporterVO> doRetrieveSp(DTO param) {
		List<SupporterVO> list = new ArrayList<SupporterVO>();
		SearchVO inVO = (SearchVO) param;
		LOG.debug("0.param:"+inVO);
		Connection connection = null;
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			
			StringBuffer sb = new StringBuffer(2000);
			
			sb.append(" SELECT a.s_seq                                                              \n");
			sb.append(" 	  ,a.s_m_id                                                             \n");
			sb.append(" 	  ,a.s_p_seq                                                            \n");
			sb.append(" 	  ,a.s_addr                                                             \n");
			sb.append(" 	  ,a.s_fund                                                             \n");
			sb.append(" 	  ,TO_CHAR(a.s_date, 'YYYY\"년\" MM\"월\" DD\"일\"') s_date              \n");                        
			sb.append(" 	  ,a.s_status                                                           \n");
			sb.append("       ,a.p_title                                                            \n");
			sb.append(" 	  ,a.p_status                                                           \n");
			sb.append(" 	  ,TO_CHAR(a.p_closedate, 'YYYY\"년\" MM\"월\" DD\"일\"') p_closedate    \n");
			sb.append("       ,b.cnt                                                                \n");
			sb.append(" FROM(                                                                       \n");
			sb.append(" 		SELECT TTT1.*                                                       \n");
			sb.append(" 		FROM(                                                               \n");
			sb.append(" 			SELECT  rownum rnum, TT1.*                                      \n");
			sb.append(" 			FROM(                                                           \n");
			sb.append(" 				SELECT T1.*                                                 \n");
			sb.append(" 				FROM (                                                      \n");
			sb.append("                      SELECT s1.S_SEQ S_SEQ,                                 \n");
			sb.append("                             s1.S_M_ID S_M_ID,                               \n");
			sb.append("                             s1.S_P_SEQ S_P_SEQ,                             \n");
			sb.append("                             s1.S_ADDR S_ADDR,                               \n");
			sb.append("                             s1.S_FUND S_FUND,                               \n");
			sb.append("                             s1.S_DATE S_DATE,                               \n");
			sb.append("                             s1.S_STATUS S_STATUS,                           \n");
			sb.append("                             s1.MOD_ID MOD_ID,                               \n");
			sb.append("                             s1.MOD_DT MOD_DT,                               \n");
			sb.append("                             p1.P_TITLE P_TITLE,                             \n");
			sb.append("                             p1.P_STATUS P_STATUS,                           \n");
			sb.append("                             p1.P_CLOSEDATE P_CLOSEDATE                      \n");
			sb.append("                     FROM supporter s1, project p1                           \n");
			sb.append("                     WHERE s1.s_p_seq = p1.p_seq                             \n");
			sb.append("                     AND s_m_id = ?                                          \n");
			sb.append("                     ORDER BY S_DATE DESC                                    \n");
			sb.append("                 )T1                                                         \n");
			sb.append(" 			) TT1                                                           \n");
			sb.append(" 		) TTT1                                                              \n");
			sb.append(" 	WHERE rnum BETWEEN ? * (? - 1) + 1 AND ? * (? - 1) + ?                  \n");
			sb.append(" )A CROSS JOIN(                                                              \n");
			sb.append("     SELECT COUNT(*) CNT                                                     \n");
			sb.append("     FROM supporter s2, project p2                                           \n");
			sb.append("     WHERE s2.s_p_seq = p2.p_seq                                             \n");
			sb.append("       AND s_m_id= ?                                                         \n");
			sb.append(" )B                                                                          \n");
			
			LOG.debug("sb.toString() \n"+sb.toString());
			
			
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3. PreparedStatement:"+pstmt);
			
			LOG.debug("inVO.getSearchWord"+inVO.getSearchWord());
			
			
			pstmt.setString(1, inVO.getSearchWord());
			pstmt.setInt(2, inVO.getPageSize());
			pstmt.setInt(3, inVO.getPageNum());
			pstmt.setInt(4, inVO.getPageSize());
			pstmt.setInt(5, inVO.getPageNum());
			pstmt.setInt(6, inVO.getPageSize());
			pstmt.setString(7, inVO.getSearchWord());
			
			rs=pstmt.executeQuery();
			LOG.debug("3.1. ResultSet:"+rs);
			
			while(rs.next()==true) {
				SupporterVO spList= new SupporterVO();
				
				spList.setS_seq(rs.getString("s_seq"));
				spList.setS_m_id(rs.getString("s_m_id"));
				spList.setS_p_seq(rs.getInt("s_p_seq"));
				spList.setS_addr(rs.getString("s_addr"));
				spList.setS_fund(rs.getInt("s_fund"));
				spList.setS_date(rs.getString("s_date"));
				spList.setS_status(rs.getString("s_status"));
				
				spList.setProjectName(rs.getString("p_title"));
				spList.setProjectStatus(rs.getString("p_status"));
				spList.setProjectClosedDate(rs.getString("p_closedate"));
				
				spList.setTotalCnt(rs.getInt("cnt")); 
				
				list.add(spList);
			}//while
			
			//조회 데이터 확인
			LOG.debug("========================");
			for(SupporterVO vo:list) {
				LOG.debug(vo);
			}
			LOG.debug("========================");
			LOG.debug("= 조회건수 =" + list.size());
			
			
			
		}catch(SQLException e) {
			LOG.debug("2.SQLException e :"+e.getMessage());
			
			e.printStackTrace();
	
		}finally {
			
			//6.PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			//7.Connection 반납
			JDBCUtil.close(connection);
		
		}
		
		return list;
	}
	
	/**
	 * 후원 상세 내역
	 */
	@Override
	public SupporterVO doSelectOne(DTO param) {
		SupporterVO outVO = null;
		
		SupporterVO inVO = (SupporterVO) param;
		LOG.info("===== doSelectOne() =====");
		LOG.debug("0. param = " + inVO);
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = ConnectionMaker.getConnection();
			LOG.debug("2.데이터베이스 커넥션 구함:"+connection);
			
			// 3. 쿼리 실행 PreparedStatement
			StringBuffer sb = new StringBuffer(2000);
			sb.append("SELECT t2.p_title,                                                         \n");
			sb.append("       t1.s_fund,                                                          \n");
			sb.append("       t1.s_addr,                                                          \n");
			sb.append("       TO_CHAR(t1.s_date, 'YYYY\"년\" MM\"월\" DD\"일\"') s_date,           \n");
			sb.append("       t1.s_status,                                                        \n");
			sb.append("       TO_CHAR(t2.p_closedate, 'YYYY\"년\" MM\"월\" DD\"일\"') p_closedate, \n");
			sb.append("       t2.p_status                                                         \n");
			sb.append("FROM supporter t1, project t2                                              \n");
			sb.append("WHERE t1.s_p_seq = t2.p_seq                                                \n");
			sb.append("  AND t1.s_seq = ?                                                         \n");
			LOG.debug("2.1. 쿼리 실행 PreparedStatement : " + sb.toString());

			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("3. 쿼리 실행 PreparedStatement : " + pstmt);

			pstmt.setString(1, inVO.getS_seq());
			
			rs = pstmt.executeQuery();
			LOG.debug("4. 쿼리 실행  ResultSet : " + rs);
			
			if (rs.next() == true) {
				outVO = new SupporterVO();
				
				outVO.setProjectName(rs.getString("p_title"));
				outVO.setS_fund(rs.getInt("s_fund"));
				outVO.setS_addr(rs.getString("s_addr"));
				outVO.setS_date(rs.getString("s_date"));
				outVO.setS_status(rs.getString("s_status"));
				outVO.setProjectClosedDate(rs.getString("p_closedate"));
				outVO.setProjectStatus(rs.getString("p_status"));
			}
			LOG.info("3.2. outVO = " + outVO);
			
			
		} catch (SQLException e) {
			LOG.debug("= SQLException = " + e.getMessage());
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(connection);
		}	
		
		return outVO;
	}
	
	
	
	
	
}//class
