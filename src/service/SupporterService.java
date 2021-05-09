package service;

import java.util.List;

import org.apache.log4j.Logger;


import cmn.DTO;

import dao.SupporterDao;
import vo.SupporterVO;

public class SupporterService {
	private final Logger LOG = Logger.getLogger(SupporterService.class);
	private SupporterDao dao;
	
	public SupporterService() {
		dao = new SupporterDao();
		
	}
	
	/**
	 * 진행 중인 프로젝트 클릭시
	 * 후원자들 리스트 출력
	 * @param param
	 * @return List<BoardVO>
	 */
	
	public List<SupporterVO> doRetrieve(DTO param){
		return dao.doRetrieve(param);
	}
	
	/**
	 * 내가 후원한 내역 출력
	 * @param param
	 * @return List<BoardVO>
	 */
	
	public List<SupporterVO> doRetrieveSp(DTO param){
		return dao.doRetrieveSp(param);
	}
	
	
	/**
	 * 수정
	 * @param param
	 * @return 성공:1 실패:0
	 */
	public int doUpdate(DTO param) {
		return dao.doUpdate(param);

	}
	
	/**
	 * 게시글 삭제
	 * @param param
	 * @return 성공:1,실패:0
	 */
	public int doDelete(DTO param) {
		return dao.doDelete(param);

	}
	
	/**
	 * 게시글 등록
	 * @param param
	 * @return 성공:1,실패:0
	 */
	
	public int doInsert(DTO param) {
		return dao.doInsert(param);

	}
	
	/**
	 * 상세 내역 
	 * @param param
	 * @return
	 */
	public SupporterVO doSelectOne(DTO param) {
		return dao.doSelectOne(param);
	}
	
	
	
}
