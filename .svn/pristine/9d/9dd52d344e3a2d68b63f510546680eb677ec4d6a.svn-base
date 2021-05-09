package test;

import java.util.List;

import org.apache.log4j.Logger;

import dao.ProjectDao;
import vo.ProjectVO;
import vo.SearchVO;

public class ProjectJdbcTestMain {
	final static Logger LOG = Logger.getLogger(ProjectJdbcTestMain.class);
	
	private ProjectVO project01;
	
	// 검색
	private SearchVO searchVO;
	
	private ProjectDao projectDao;
	
	public ProjectJdbcTestMain() {
		project01 = new ProjectVO(0, "id_15", "title_15", "thumb_15", "name_15", "contents_15", "cate_15", "tag_15", "", "", "21/03/16", 100000, "account_15", 10000000, "", "");
		//project02 = new ProjectVO(115, "id_115", "title_115", "thumb_115", "name_115", "contents_115", "cate_115", "tag_115", "", "", "21/03/16", 100000, "account_15", 10000000, "", "");
		//project03 = new ProjectVO(215, "id_215", "title_215", "thumb_215", "name_215", "contents_215", "cate_215", "tag_215", "", "", "21/03/16", 100000, "account_15", 10000000, "", "");
		
		searchVO = new SearchVO();
		
		projectDao = new ProjectDao();
	}
	
	public static void main(String[] args) {
		ProjectJdbcTestMain jtMain = new ProjectJdbcTestMain();
		
		//jtMain.doDelete();
		//jtMain.doInsert();
		
		//jtMain.doUpdate();
		//jtMain.doUpdateStatus();
		
		//jtMain.doSelectOne();
		//jtMain.doRetrieve();
		jtMain.doChangeStatus();

	} // --- main
	
	public void doInsert() {
		int flag = 0;
		flag = projectDao.doInsert(project01);
		
		if (flag == 1) {
			LOG.debug("등록 성공");
		} else {
			LOG.debug("등록 실패");
		}
	} // --- doInsertProjectInfo
	
	
	public void doDelete() {
		int flag = 0;
		flag = projectDao.doDelete(project01);
		
		if (flag == 1) {
			LOG.debug("삭제 성공");
		} else {
			LOG.debug("삭제 실패");
		}
	} // --- doDeleteProjectInfo
	
	public void doUpdate() {
		int flag = 0;
		ProjectVO upDate = new ProjectVO();
		
		upDate.setP_seq(project01.getP_seq());
		upDate.setP_title(project01.getP_title() + "_U");
		upDate.setP_thumb(project01.getP_thumb() + "_U");
		upDate.setP_name(project01.getP_name() + "_U");
		upDate.setP_contents(project01.getP_contents() + "_U");
		upDate.setP_cate(project01.getP_cate() + "_U");
		upDate.setP_tag(project01.getP_tag() + "_U");
		upDate.setMod_id(project01.getMod_id() + "_U");
		
		flag = projectDao.doUpdate(upDate);
		
		if (flag == 1) {
			LOG.debug("수정 성공");
		} else {
			LOG.debug("수정 실패");
		}
	} // --- doUpdate
	
	public void doChangeStatus() {
		int flag = 0;
		ProjectVO upDate = new ProjectVO();
		
		upDate.setP_seq(project01.getP_seq());
		
		flag = projectDao.doChangeStatus(upDate);	
		
		if (flag == 1) {
			LOG.debug("수정 성공");
		} else {
			LOG.debug("수정 실패");
		}
		LOG.debug("총 수정 건수 doChangeStatus() flag : " + flag);
	} // --- doChangeStatus
	
	public void doSelectOne() {
		ProjectVO project = null;
		project = projectDao.doSelectOne(project01);
		
		if (project.getP_seq() != project01.getP_seq() || !project.getP_title().equals(project01.getP_title()) || !project.getP_contents().equals(project01.getP_contents())) {
			LOG.debug("조회 실패");
		} else {
			LOG.debug("조회 성공");
		}
	} // --- doSelectOne
	
	public void doRetrieve() {
		searchVO.setSearchDiv("");
		searchVO.setSearchWord("");
		
		searchVO.setPageSize(10);
		searchVO.setPageNum(1);
		
		searchVO.setP_cate("");
		searchVO.setP_m_id("");
		
		List<ProjectVO> list = projectDao.doRetrieve(searchVO);
		
		LOG.debug("list : " + list);
		
	} // --- doRetrieve

} // --- class
