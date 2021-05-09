package service;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.DTO;
import dao.MemberDao;
import vo.MemberVO;
import vo.MessageVO;

public class MemberService {
	private final Logger LOG = Logger.getLogger(MemberService.class);
	private MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}
	/**
	 * 아이디 비번 확인
	 * @param dto
	 * @return
	 */
	public MessageVO doLoginCheck(DTO dto) {
		MessageVO message=new MessageVO();
		
		MemberVO param = (MemberVO) dto;
		LOG.debug("param:"+param);
		//id체크
		//비번체크
		
		int idCheckFlag = dao.idCheck(param);
		if(1 != idCheckFlag) {
			message.setMsgId("10");//ID없음!
			message.setMsgContents("아이디를 확인 하세요.");
			return message;
		}
		
		int passwordCheckFlag = dao.passwordCheck(param);
		if(1 != passwordCheckFlag) {
			message.setMsgId("20");//비번 없음!
			message.setMsgContents("비번 확인 하세요.");
			return message;
		}
		
		message.setMsgId("0");//로그인 성공!
		message.setMsgContents("아이디와 비번이 확인 되었습니다.");
		
		return message;
	}
	
	public List<?> doRetrieve(DTO param){
		return dao.doRetrieve(param);
	}
	
	
	public int doUpdate(DTO param){
		return dao.doUpdate(param);
	}
	
	public int idCheck(DTO param){
		return dao.idCheck(param);
	}
	
	/**
	 * 회원 단건 조회
	 * @param param
	 * @return
	 */
	public DTO doSelectOne(DTO param) {
		return dao.doSelectOne(param);
	}
	
	public int doInsert(DTO param) {
		return dao.doInsert(param);
	}
	
}
