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
import cmn.WorkStandard;
import vo.ProjectVO;
import vo.SearchVO;

public class ProjectDao implements WorkStandard {
	final Logger LOG = Logger.getLogger(ProjectDao.class);
	
	public ProjectDao() {
		
	}

	@Override
	// 프로젝트 등록
	// 프로젝트 등록 성공 : flag = 1, 실패 : flag = 0
	public int doInsert(DTO param) {
		// 1. JDBC 드라이버 로딩
		// 2. 데이터베이스 커넥션
		// 3. 쿼리 실행 : JAVA(StringBuffer)
		// 4. 쿼리 실행 : JAVA(PreparedStatement)
		// 5. 쿼리 실행 결과(DB) : flag(성공 = 1, 실패 = 0)
		// 6. PreparedStatement 자원 반납
		// 7. Connection 자원 반납
		int flag = 0;
		LOG.debug("0. param : " + param);
		
		ProjectVO inVO = (ProjectVO) param;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		
		try {
			// 1. JDBC 드라이버 로딩 : getnConnection()
			// 2. 데이터베이스 커넥션
			connection = ConnectionMaker.getConnection();
			LOG.debug("2. 데이터베이스 커넥션 : " + connection);
			
			// 3. 쿼리 실행 : JAVA(StringBuffer)
			StringBuffer sb = new StringBuffer(1000);
			
			sb.append("	INSERT INTO PROJECT		     \n");
			sb.append("		(                        \n");
			sb.append("			p_seq,               \n");
			sb.append("			p_m_id,              \n");
			sb.append("			p_title,             \n");
			sb.append("			p_thumb,             \n");
			sb.append("			p_name,              \n");
			sb.append("			p_contents,          \n");
			sb.append("			p_cate,              \n");
			sb.append("			p_tag,               \n");
			sb.append("			p_closedate,         \n");
			sb.append("			p_minprice,          \n");
			sb.append("			p_account,           \n");
			sb.append("			p_goalfund,          \n");
			sb.append("			mod_id               \n");
			sb.append("		)                        \n");
			sb.append("	VALUES                       \n");
			sb.append("		(                        \n");
			sb.append("			PROJECT_P_SEQ.NEXTVAL,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?,                   \n");
			sb.append("			?                    \n");
			sb.append("		)                        \n");
			LOG.debug("3. 쿼리 실행(JAVA) StringBuffer : \n" + sb.toString());
			
			// PreparedStatement : Binding SQL
			pstmt = connection.prepareStatement(sb.toString());
			// Parameter 셋팅
			//pstmt.setInt(1, inVO.getP_seq());
			pstmt.setString(1, inVO.getP_m_id());
			pstmt.setString(2, inVO.getP_title());
			pstmt.setString(3, inVO.getP_thumb());
			pstmt.setString(4, inVO.getP_name());
			pstmt.setString(5, inVO.getP_contents());
			pstmt.setString(6, inVO.getP_cate());
			pstmt.setString(7, inVO.getP_tag());
			pstmt.setString(8, inVO.getP_closedate());
			pstmt.setInt(9, inVO.getP_minprice());
			pstmt.setString(10, inVO.getP_account());
			pstmt.setInt(11, inVO.getP_goalfund());
			pstmt.setString(12, inVO.getMod_id());
			// 4. 쿼리 실행 : JAVA(PreparedStatement)
			LOG.debug("4. 쿼리 실행(JAVA) PreparedStatement : " + pstmt);
			
			// 5. 쿼리 실행 결과(DB) : flag
			flag = pstmt.executeUpdate();
			LOG.debug("5. 쿼리 실행 결과 flag(DB) : " + flag);
			
		} catch (SQLException e) {
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 6. PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			
			// 7. Connection 자원 반납
			JDBCUtil.close(connection);
		}
		
		return flag;
	} // --- doInsertProjectInfo
	
	@Override
	// 프로젝트 삭제
	// 프로젝트 삭제 성공 : flag = 1, 실패 : flag = 0
	public int doDelete(DTO param) {
		// 1. JDBC 드라이버 로딩
		// 2. 데이터베이스 커넥션
		// 3. 쿼리 실행 : JAVA(StringBuffer)
		// 4. 쿼리 실행 : JAVA(PreparedStatement)
		// 5. 쿼리 실행 결과(DB) : flag(성공 = 1, 실패 = 0)
		// 6. PreparedStatement 자원 반납
		// 7. Connection 자원 반납
		int flag = 0;
		LOG.debug("0. param : " + param);
		ProjectVO inVO = (ProjectVO) param;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		
		try {
			// 1. JDBC 드라이버 로딩 : getConnection()
			// 2. 데이터베이스 커넥션
			connection = ConnectionMaker.getConnection();
			LOG.debug("2. 데이터베이스 커넥션 : " + connection);
			
			// 3. 쿼리 실행 : JAVA(StringBuffer)
			StringBuffer sb = new StringBuffer(50);
			sb.append("	DELETE FROM PROJECT		  \n");
			sb.append("	WHERE p_seq = ?           \n");
			LOG.debug("3. 쿼리 실행(JAVA) StringBuffer : " + sb.toString());
			
			// PreparedStatement : Binding SQL
			pstmt = connection.prepareStatement(sb.toString());
			
			// Parameter 셋팅
			pstmt.setInt(1,  inVO.getP_seq());
			// 4. 쿼리 실행 : JAVA(PreparedStatement)
			LOG.debug("4. 쿼리 실행(JAVA) PreparedStatement : " + pstmt);
			
			// 5. 쿼리 실행 결과(DB) : flag
			flag = pstmt.executeUpdate();
			LOG.debug("쿼리 실행 결과 flag(DB) : " + flag);
		} catch (SQLException e) {
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 6. PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			
			// 7. Connection 자원 반납
			JDBCUtil.close(connection);
		}
		
		return flag;
	} // --- doDeleteProjectInfo
	
	@Override
	// 프로젝트 수정
	// 성공 : flag = 1, 실패 : flag = 0
	public int doUpdate(DTO param) {
		// 1. JDBC 드라이버 로딩
		// 2. 데이터베이스 커넥션
		// 3. 쿼리 실행 : JAVA(StringBuffer)
		// 4. 쿼리 실행 : JAVA(PreparedStatement)
		// 5. 쿼리 실행 결과(DB) : flag(성공 = 1, 실패 = 0)
		// 6. PreparedStatement 자원 반납
		// 7. Connection 자원 반납
		int flag = 0;
		ProjectVO inVO = (ProjectVO) param;
		LOG.debug("0. param : " + param);
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1. JDBC 드라이버 로딩 : getConnection()
			// 2. 데이터베이스 커넥션
			connection = ConnectionMaker.getConnection();
			LOG.debug("2. 데이터베이스 커넥션 : " + connection);
			
			// 3. 쿼리 실행 : JAVA(StringBuffer)
			StringBuffer sb = new StringBuffer(1000);
			sb.append("	UPDATE PROJECT		          \n");
			sb.append("	SET p_title = ?,   		      \n");
			sb.append("	    p_thumb = ?,      		  \n");
			sb.append("		p_name = ?,        		  \n");
			sb.append("		p_contents = ?,			  \n");
			sb.append("		p_cate = ?,        		  \n");
			sb.append("		p_tag = ?,          	  \n");
			sb.append("		mod_id = ?,        		  \n");
			sb.append("		mod_dt = sysdate          \n");
			sb.append("	WHERE p_seq = ?               \n");
			LOG.debug("3. 쿼리 실행(JAVA) StringBuffer : " + sb.toString());
			
			// PreparedStatement : Binding SQL
			pstmt = connection.prepareStatement(sb.toString());			
			// Parameter 셋팅
			pstmt.setString(1, inVO.getP_title());
			pstmt.setString(2, inVO.getP_thumb());
			pstmt.setString(3, inVO.getP_name());
			pstmt.setString(4, inVO.getP_contents());
			pstmt.setString(5, inVO.getP_cate());
			pstmt.setString(6, inVO.getP_tag());
			pstmt.setString(7, inVO.getMod_id());
			pstmt.setInt(8, inVO.getP_seq());
			
			// 4. 쿼리 실행 : JAVA(PreparedStatement)
			LOG.debug("4. 쿼리 실행(JAVA) PreparedStatement : " + pstmt);
			
			// 5. 쿼리 실행 결과(DB)
			flag = pstmt.executeUpdate();
			LOG.debug("5. 쿼리 실행 결과 falg(DB) : " + flag);
		} catch (SQLException e) {
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 6. PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			
			// 7. Connection 자원 반납
			JDBCUtil.close(connection);
		}

		return flag;
	} // --- doUpdate
	
	// 프로젝트 상태 수정
	public int doChangeStatus(DTO param) {
		// 1. JDBC 드라이버 로딩
		// 2. 데이터베이스 커넥션
		// 3. 쿼리 실행 : JAVA(StringBuffer)
		// 4. 쿼리 실행 : JAVA(PreparedStatement)
		// 5. 쿼리 실행(DB) : flag
		// 6. PreparedStatement 자원 반납
		// 7. Connection 자원 반납
		int flag = 0;
		ProjectVO inVO = (ProjectVO) param;
		LOG.debug("0. param : " + param);
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1. JDBC 드라이버 로딩 : getConnection()
			// 2. 데이터베이스 커넥션
			connection = ConnectionMaker.getConnection();
			LOG.debug("2. 데이터베이스 커넥션 : " + connection);
			
			// 3. 쿼리 실행 : JAVA(StringBuffer)
			StringBuffer sb = new StringBuffer(1000);
			sb.append("	UPDATE project t1                                                                                                           \n");
			sb.append("	SET t1.p_status = CASE WHEN (TRUNC(t1.p_closedate) - TRUNC(SYSDATE)) <= 0	AND t1.p_goalfund <= 	NVL((                   \n");
			sb.append("																								SELECT SUM(t2.s_fund)           \n");
			sb.append("																								FROM supporter t2      			\n");
			sb.append("																								WHERE t2.s_p_seq = ?     		\n");
			sb.append("		                                                                                        AND  t2.s_status IN ('0','1')   \n");
			sb.append("																							), 0) THEN 1                        \n");
			sb.append("						WHEN (TRUNC(t1.p_closedate) - TRUNC(SYSDATE)) <= 0 AND t1.p_goalfund > NVL((                            \n");
			sb.append("																					SELECT SUM(t2.s_fund)                       \n");
			sb.append("																					FROM supporter t2                           \n");
			sb.append("																					WHERE t2.s_p_seq =?                			\n");
			sb.append("		                                                                            AND t2.s_status IN ('0','1')                \n");
			sb.append("																				  ), 0) THEN 2                                  \n");
			sb.append("	                    ELSE 0                                                                                                  \n");
			sb.append("					END                                                                                                         \n");
			sb.append("	WHERE t1.p_seq = ?                                                                                                          \n");
			LOG.debug("3. 쿼리 실행(JAVA) StringBuffer : " + sb.toString());
			
			// PreparedStatement : Binding SQL
			pstmt = connection.prepareStatement(sb.toString());			
			
			// Parameter 셋팅
			pstmt.setInt(1, inVO.getP_seq());
			pstmt.setInt(2, inVO.getP_seq());
			pstmt.setInt(3, inVO.getP_seq());
			
			// 4. 쿼리 실행 : JAVA(PreparedStatement)
			LOG.debug("4. 쿼리 실행(JAVA) PreparedStatement : " + pstmt);
			
			// 5. 쿼리 실행(DB) : flag
			flag = pstmt.executeUpdate();
			LOG.debug("5. 쿼리 실행 flag(DB) 총 수정 건수 : " + flag);
		} catch (SQLException e) {
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 6. PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);
			
			// 7. Connection 자원 반납
			JDBCUtil.close(connection);
		}

		return flag;
	} // --- doChangeStatus

	@Override
	// 프로젝트 단건 조회
	public ProjectVO doSelectOne(DTO param) {
		// 1. JDBC 드라이버 로딩
		// 2. 데이터베이스 커넥션
		// 3. 쿼리 실행 : JAVA(StringBuffer)
		// 4. 쿼리 실행 : DB(ResultSet)
		// 5. 쿼리 실행 결과(DB)
		// 6. ResultSet 자원 반납
		// 7. PreparedStatement 자원 반납
		// 8. Connection 자원 반납
		ProjectVO project = null;
		ProjectVO inVO = (ProjectVO) param;
		
		LOG.debug("0. param : " + param);
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		// Reutrun Value 처리
		ResultSet rs = null;
		
		try {
			// 1. JDBC 드라이버 로딩 : getConnection()
			// 2. 데이터베이스 커넥션
			connection = ConnectionMaker.getConnection();
			LOG.debug("2. 데이터베이스 커넥션 : " + connection);
			
			// 3. 쿼리 실행 : JAVA(StringBuffer)
			StringBuffer sb = new StringBuffer(500);
			sb.append("	SELECT t1.p_seq,                                                    				\n");
			sb.append("		   t1.p_cate,                                                   				\n");
			sb.append("		   t1.p_title,                                                  				\n");
			sb.append("		   t1.p_m_id,                                              	    				\n");
			sb.append("		   t1.p_thumb,                                                  				\n");
			sb.append("		   t1.p_tag,                                                  				\n");
			sb.append("		   -- 총 후원금                                                    \n");
			sb.append("		   NVL((                                                       					\n");
			sb.append("	        SELECT SUM(t2.s_fund)                                       				\n");
			sb.append("	        FROM supporter t2                                           				\n");
			sb.append("	        WHERE t1.p_seq = t2.s_p_seq                                 				\n");
			sb.append("	        AND t1.p_seq = ?                                        				    \n");
			sb.append("		    AND t2.s_status IN ('0','1')                                                \n");
			sb.append("	       ), 0) sum_fund,                          				                    \n");
			sb.append("		   -- 달성률                                                      \n");
			sb.append("		   NVL((                                                        				\n");
			sb.append("	        SELECT TRUNC((SUM(t2.s_fund) / t1.p_goalfund) * 100)        				\n");
			sb.append("	        FROM supporter t2                                           				\n");
			sb.append("	        WHERE t1.p_seq = t2.s_p_seq                                 				\n");
			sb.append("	        AND t1.p_seq = ?                                            				\n");
			sb.append("		    AND t2.s_status IN ('0','1')                                                \n");
			sb.append("	       ), 0) percent,                                               				\n");
			sb.append("		   -- 남은 시간                                                    \n");
			sb.append("		   NVL((                                                        				\n");
			sb.append("	        SELECT (TRUNC(p_closedate) - TRUNC(SYSDATE))                				\n");
			sb.append("	        FROM project                                                				\n");
			sb.append("	        WHERE p_seq = ?                                             				\n");
			sb.append("	       ), 0) remain_date,                                           				\n");
			sb.append("		   -- 후원자 수                                                    \n");
			sb.append("		   NVL((                                                      					\n");
			sb.append("	        SELECT count(DISTINCT t2.s_m_id)                            				\n");
			sb.append("	        FROM supporter t2                                           				\n");
			sb.append("	        WHERE t1.p_seq = t2.s_p_seq                                 				\n");
			sb.append("	        AND t1.p_seq = ?                                            				\n");
			sb.append("		    AND t2.s_status IN ('0','1')                                                \n");
			sb.append("	       ), 0) supporter_num,                                         				\n");
			sb.append("		   t1.p_status,                                                 				\n");
			sb.append("		   t1.p_goalfund,                                                 				\n");
			sb.append("		   TO_CHAR(t1.p_closedate, 'YYYY\"년\" MM\"월\" DD\"일\"') p_closedate,           \n");
			sb.append("		   t1.p_contents,                                              					\n");
			sb.append("		   t1.p_minprice                                                				\n");
			sb.append("	FROM PROJECT t1                                                     				\n");
			sb.append("	WHERE t1.p_seq = ?                                                  				\n");
			
			LOG.debug("3. 쿼리 실행(JAVA) StringBuffer : " + sb.toString());
			
			// PreparedStatement : Binding SQL
			pstmt = connection.prepareStatement(sb.toString());
			
			// Parameter 셋팅
			pstmt.setInt(1, inVO.getP_seq());
			pstmt.setInt(2, inVO.getP_seq());
			pstmt.setInt(3, inVO.getP_seq());
			pstmt.setInt(4, inVO.getP_seq());
			pstmt.setInt(5, inVO.getP_seq());
			
			// 4. 쿼리 실행 : DB(ResultSet)
			rs = pstmt.executeQuery();
			LOG.debug("4. 쿼리 실행(DB) ResultSet : " + rs);
			
			if (rs.next() == true) {
				project = new ProjectVO();
				
				project.setP_seq(rs.getInt("p_seq"));
				project.setP_cate(rs.getString("p_cate"));
				project.setP_title(rs.getString("p_title"));
				project.setP_m_id(rs.getString("p_m_id"));
				project.setP_thumb(rs.getString("p_thumb"));
				project.setSumFund(rs.getInt("sum_fund"));
				project.setPercent(rs.getInt("percent"));
				project.setRemainDate(rs.getInt("remain_date"));
				project.setSupporterNum(rs.getInt("supporter_num"));
				project.setP_status(rs.getString("p_status"));
				project.setP_goalfund(rs.getInt("p_goalfund"));
				project.setP_closedate(rs.getString("p_closedate"));
				project.setP_contents(rs.getString("p_contents"));
				project.setP_minprice(rs.getInt("p_minprice"));
				project.setP_tag(rs.getString("p_tag"));
			}
			
			// 5. 쿼리 실행 결과(DB)
			LOG.debug("project : " + project);
			
		} catch (SQLException e) {
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 6. ResultSet 자원 반납
			JDBCUtil.close(rs);

			// 7. PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);

			// 8. 커넥션 자원 반납
			JDBCUtil.close(connection);
		}
		
		
		return project;
	} // --- doSelectOne

	@Override
	// 프로젝트 목록 조회
	public List<ProjectVO> doRetrieve(DTO param) {
		// 1. JDBC 드라이버 로딩
		// 2. 데이터베이스 커넥션
		// 3. 쿼리 실행 : JAVA(StringBuffer)
		// 4. 쿼리 실행 : JAVA(PreparedStatement)
		// 5. 쿼리 실행 : DB(ResultSet)
		// 6. ResultSet 자원 반납
		// 7. PreparedStatement 자원 반납
		// 8. Connection 자원 반납
		List<ProjectVO> list = new ArrayList<ProjectVO>();
		SearchVO inVO = (SearchVO) param;
		LOG.debug("0. param : " + param);
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1. JDBC 드라이버 로딩 : getConnection()
			// 2. 데이터베이스 커넥션
			connection = ConnectionMaker.getConnection();
			LOG.debug("2. 데이터베이스 커넥션 : " + connection);
			
			// 동적 검색 조건 처리
			StringBuffer sbWhere = new StringBuffer(500);
			
			// 검색 조건이 있으면
			if (inVO != null && inVO.getSearchDiv() != "") {
				// 제목 + 태그 검색(searchDiv = 10)
				if (inVO.getSearchDiv().equals("10")) {
					sbWhere.append("		WHERE p_title Like '%' || ? || '%'                        	          \n");
					sbWhere.append("		OR p_tag Like '%' || ? || '%'                                       \n");
				
				// 카테고리 검색(searchDiv = 20) : p_cate -> 10(연극), 20(뮤지컬), 30(토크쇼), 40(음악 공연), 50(자기 PR)
				} else if (inVO.getSearchDiv().equals("20")) {
					sbWhere.append("		WHERE p_cate = ?                                                        \n");
				
				// ID 검색(searchDiv = 30) : 내가 등록한 프로젝트 검색 
				} else if (inVO.getSearchDiv().equals("30")) {
					sbWhere.append("		WHERE p_m_id = ?                                                        \n");
				}
			}
			LOG.debug("sbWhere : " + sbWhere); 
			
			// 3. 쿼리 실행 : JAVA(StringBuffer)
			StringBuffer sb = new StringBuffer(2000);
			sb.append("	SELECT a.p_seq,                                                           \n");
			sb.append("	       a.p_thumb,                                                         \n");
			sb.append("	       a.p_cate,                                                          \n");
			sb.append("	       a.p_m_id,                                                          \n");
			sb.append("	       a.p_title,                                                         \n");
			sb.append("	       a.percent,                                                         \n");
			sb.append("	       a.p_goalfund,                                                      \n");
			sb.append("	       TO_CHAR(a.p_opendate, 'YYYY\"년\" MM\"월\" DD\"일\"') p_opendate,   \n");
			sb.append("	       TO_CHAR(a.p_closedate, 'YYYY\"년\" MM\"월\" DD\"일\"') p_closedate, \n");
			sb.append("	       a.p_status,                                                        \n");
			sb.append("	       a.rnum,                                                            \n");
			sb.append("	       b.cnt                                                              \n");
			sb.append("	FROM                                                                      \n");
			sb.append("	(                                                                         \n");
			sb.append("	    SELECT TTT1.*                                                         \n");
			sb.append("	    FROM                                                                  \n");
			sb.append("	        (                                                                 \n");
			sb.append("	        SELECT rownum rnum, TT1.*                                         \n");
			sb.append("	        FROM                                                              \n");
			sb.append("	        (                                                                 \n");
			sb.append("	            SELECT t1.p_seq,                                              \n");
			sb.append("	                   t1.p_m_id,                                             \n");
			sb.append("	                   t1.p_title,                                            \n");
			sb.append("	                   t1.p_thumb,                                            \n");
			sb.append("	                   t1.p_name,                                             \n");
			sb.append("	                   t1.p_contents,                                         \n");
			sb.append("	                   t1.p_cate,                                             \n");
			sb.append("	                   t1.p_tag,                                              \n");
			sb.append("	                   t1.p_status,                                           \n");
			sb.append("	                   t1.p_opendate,                                         \n");
			sb.append("	                   t1.p_closedate,                                        \n");
			sb.append("	                   t1.p_minprice,                                         \n");
			sb.append("	                   t1.p_account,                                          \n");
			sb.append("	                   t1.p_goalfund,                                         \n");
			sb.append("	                   t1.mod_id,                                             \n");
			sb.append("	                   t1.mod_dt,                                             \n");
			sb.append("	                   NVL((                                                  \n");
			sb.append("	                    SELECT SUM(t2.s_fund)                                 \n");
			sb.append("	                    FROM supporter t2                                     \n");
			sb.append("	                    WHERE t1.p_seq = t2.s_p_seq                           \n");
			sb.append("		                AND t2.s_status IN ('0','1')                          \n");
			sb.append("	                   ), 0) sum_fund,                                        \n");
			sb.append("	                   NVL((                                                  \n");
			sb.append("	                    SELECT TRUNC((SUM(t2.s_fund) / t1.p_goalfund) * 100)  \n");
			sb.append("	                    FROM supporter t2                                     \n");
			sb.append("	                    WHERE t1.p_seq = t2.s_p_seq                           \n");
			sb.append("		                AND t2.s_status IN ('0','1')                          \n");
			sb.append("	                   ), 0) percent,                                         \n");
			sb.append("	                   NVL((                                                  \n");
			sb.append("	                    SELECT (TRUNC(p_closedate) - TRUNC(SYSDATE))          \n");
			sb.append("	                    FROM project                                          \n");
			sb.append("	                    WHERE (TRUNC(p_closedate) - TRUNC(SYSDATE)) > 0       \n");
			sb.append("	                   ), 0) remain_date,                                     \n");
			sb.append("	                   NVL((                                                  \n");
			sb.append("	                    SELECT count(DISTINCT t2.s_m_id)                      \n");
			sb.append("	                    FROM supporter t2                                     \n");
			sb.append("	                    WHERE t1.p_seq = t2.s_p_seq                           \n");
			sb.append("		                AND t2.s_status IN ('0','1')                          \n");
			sb.append("	                   ), 0) supporter_num                                    \n");
			sb.append("	            FROM project t1                                               \n");
			// --------------------------------------- WHERE 조건 ---------------------------------------
			sb.append(sbWhere.toString());
			// --------------------------------------- WHERE 조건 ---------------------------------------
			sb.append("	            ORDER BY percent  DESC                                        \n");
			sb.append("	        ) TT1                                                             \n");
			sb.append("	    ) TTT1                                                                \n");
			sb.append("		WHERE rnum BETWEEN ? * (? - 1) + 1 AND ? * (? - 1) + ?                \n");
			sb.append("	) A                                                                       \n");
			sb.append("	CROSS JOIN                                                                \n");
			sb.append("	(                                                                         \n");
			sb.append("	    SELECT COUNT(*) cnt                                                   \n");
			sb.append("	    FROM project                                                          \n");
			// --------------------------------------- WHERE 조건 ---------------------------------------
			sb.append(sbWhere.toString());
			// --------------------------------------- WHERE 조건 ---------------------------------------
			sb.append("	) B                                                                       \n");
			LOG.debug("3. 쿼리 실행(JAVA) StringBuffer : " + sb.toString());
			
			// 4. 쿼리 실행 : JAVA(PreparedStatement)
			pstmt = connection.prepareStatement(sb.toString());
			LOG.debug("4. 쿼리 실행(JAVA) PreparedStatement : " + pstmt);
						
			// Parameter 셋팅
			// 검색 조건이 있는 경우
			if (inVO != null && inVO.getSearchDiv() !="") {
				// 제목 + 태그 검색(searchDiv = 10)
				if (inVO.getSearchDiv().equals("10")) {
					pstmt.setString(1, inVO.getSearchWord());
					pstmt.setString(2, inVO.getSearchWord());
					
					pstmt.setInt(3,  inVO.getPageSize());
					pstmt.setInt(4,  inVO.getPageNum());
					pstmt.setInt(5,  inVO.getPageSize());
					pstmt.setInt(6,  inVO.getPageNum());
					pstmt.setInt(7,  inVO.getPageSize());
					
					pstmt.setString(8, inVO.getSearchWord());
					pstmt.setString(9, inVO.getSearchWord());
					
				// 카테고리 검색(searchDiv = 20) : p_cate -> 10(연극), 20(뮤지컬), 30(토크쇼), 40(음악 공연), 50(자기 PR)
				} else if (inVO.getSearchDiv().equals("20")) {
					pstmt.setString(1, inVO.getP_cate());
					pstmt.setInt(2,  inVO.getPageSize());
					pstmt.setInt(3,  inVO.getPageNum());
					pstmt.setInt(4,  inVO.getPageSize());
					pstmt.setInt(5,  inVO.getPageNum());
					pstmt.setInt(6,  inVO.getPageSize());
					pstmt.setString(7, inVO.getP_cate());
				// ID 검색(searchDiv = 30) : 내가 등록한 프로젝트 검색
				} else if (inVO.getSearchDiv().equals("30")) {
					pstmt.setString(1, inVO.getP_m_id());
					pstmt.setInt(2,  inVO.getPageSize());
					pstmt.setInt(3,  inVO.getPageNum());
					pstmt.setInt(4,  inVO.getPageSize());
					pstmt.setInt(5,  inVO.getPageNum());
					pstmt.setInt(6,  inVO.getPageSize());
					pstmt.setString(7, inVO.getP_m_id());
				
				// 전체 검색 : div = 40 (jsp 에서 ""값 보낼 시 오류)
				} else if (inVO.getSearchDiv().equals("40")) {
					pstmt.setInt(1,  inVO.getPageSize());
					pstmt.setInt(2,  inVO.getPageNum());
					pstmt.setInt(3,  inVO.getPageSize());
					pstmt.setInt(4,  inVO.getPageNum());
					pstmt.setInt(5,  inVO.getPageSize());
				} else {
					// 검색 조건이 없는 경우
					pstmt.setInt(1,  inVO.getPageSize());
					pstmt.setInt(2,  inVO.getPageNum());
					pstmt.setInt(3,  inVO.getPageSize());
					pstmt.setInt(4,  inVO.getPageNum());
					pstmt.setInt(5,  inVO.getPageSize());
				}
			}
			
			// 5. 쿼리 실행 : DB(ResultSet)
			rs = pstmt.executeQuery();
			LOG.debug("5. 쿼리 실행(DB) ResultSet : " + rs);
			
			while (rs.next() == true) {
				ProjectVO project = new ProjectVO();
				
				project.setP_seq(rs.getInt("p_seq"));
				project.setP_thumb(rs.getString("p_thumb"));
				project.setP_cate(rs.getString("p_cate"));
				project.setP_m_id(rs.getString("p_m_id"));
				project.setP_title(rs.getString("p_title"));
				project.setPercent(rs.getInt("percent"));
				project.setP_goalfund(rs.getInt("p_goalfund"));
				project.setP_opendate(rs.getString("p_opendate"));
				project.setP_closedate(rs.getString("p_closedate"));
				project.setP_status(rs.getString("p_status"));
				project.setNum(rs.getInt("rnum"));
				project.setTotalCnt(rs.getInt("cnt"));
				
				// List에 추가
				list.add(project);
			} // --- while
			
			// 조회된 데이터 확인
			for (ProjectVO vo : list) {
				LOG.debug("조회 데이터 vo : " + vo);
			}
			
			LOG.debug("조회 건수 : " + list.size());
			
		} catch (SQLException e) {
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 6. ResultSet 자원 반납
			JDBCUtil.close(rs);

			// 7. PreparedStatement 자원 반납
			JDBCUtil.close(pstmt);

			// 8. 커넥션 자원 반납
			JDBCUtil.close(connection);
		}
		
		return list;
	} // --- doRetrieve

} // --- class
