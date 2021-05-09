package service;

import java.util.List;


import org.apache.log4j.Logger;

import cmn.DTO;
import dao.ProjectDao;
import dao.SupporterDao;
import vo.ProjectVO;

public class ProjectService {
	private final Logger LOG = Logger.getLogger(ProjectService.class);
	
	private ProjectDao dao;
	private SupporterDao supporterDao;
	
	public ProjectService() {
		dao = new ProjectDao();
		supporterDao=new SupporterDao();
	}
	
	// 프로젝트 등록 
	public int doInsert(DTO param) {
		return dao.doInsert(param);
	}
	
	// 프로젝트 수정
	public int doUpdate(DTO param) {
		return dao.doUpdate(param);
	}
	
	// 프로젝트 삭제
	public int doDelete(DTO param) {
		return dao.doDelete(param);
	}
	
	// 프로젝트 단건 조회 + 프로젝트 상태 수정+서포터 상태수정
	public ProjectVO doSelectOne(DTO param) {
		int flag = dao.doChangeStatus(param);
		LOG.debug("총 상태 수정 건수 flag : " + flag);
		
		int spflag = supporterDao.doChangeStatus();
		LOG.debug("서포터 상태 수정flag : " + spflag);
		
		return dao.doSelectOne(param);
	}
	
	
	// 프로젝트 목록 조회 + 프로젝트 상태 수정+서포터 상태 수정
	public List<ProjectVO> doRetrieve(DTO param) {
		return dao.doRetrieve(param);
	}
	
} // --- class
