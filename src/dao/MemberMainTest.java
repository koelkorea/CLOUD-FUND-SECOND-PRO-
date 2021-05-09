package dao;

import java.util.List;

import org.apache.log4j.Logger;



import vo.MemberVO;
import vo.SearchVO;

public class MemberMainTest {
	
	final static Logger LOG= Logger.getLogger(SupporterMainTest.class);
	
	
	
	private MemberVO member01;
	private MemberVO member02;
	
	private SearchVO searchVO;
	private MemberDao memberDao;
	
	public MemberMainTest() {
		member01=new MemberVO("jong960307@naver.com","가나다","85208520","0","","","","","","");
		member02=new MemberVO("aaaaa@naver.com","가가가","12341234","0","","","","","","");
		
		searchVO= new SearchVO();
		memberDao = new MemberDao();
	}
	
	public static void main(String[] args) {
		
		
		MemberMainTest mbMain = new MemberMainTest();
		
		mbMain.idCheck();
		//mbMain.passwordCheck();
		//mbMain.doInsert();
		//mbMain.doUpdate();
		//mbMain.doDelete();
		//mbMain.doSelectOne();
		//mbMain.doRetrieve();
		
	}
	
	public void idCheck() {
		LOG.debug("=================");
		LOG.debug("==idCheck()=");
		LOG.debug("=================");
		
		int flag = memberDao.idCheck(member01);
		if(1==flag) {
			LOG.debug("=사용자 ID가 있습니다.");
		}else {
			LOG.debug("=사용자 ID가 없습니다.");
		}
	}
	
	public void passwordCheck() {
		LOG.debug("=================");
		LOG.debug("==passwordCheck()=");
		LOG.debug("=================");
		
		int flag = memberDao.passwordCheck(member02);
		if(1==flag) {
			LOG.debug("=사용자 ID PASSWORD가 있습니다.");
		}else {
			LOG.debug("=사용자 ID PASSWORD가 없습니다.");
		}
	}
	
	
	public void doInsert() {
		int flag=0;
		flag= memberDao.doInsert(member01);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("회원가입 성공");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("회원가입 실패");
			LOG.debug("=================");
		
		}
		
	}
	
	public void doUpdate() {
		int flag=0;
		flag= memberDao.doUpdate(member02);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("수정 성공");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("수정 실패");
			LOG.debug("=================");
		
		}
	}
	
	public void doDelete() {
		LOG.debug("=================");
		LOG.debug("==doDelete()=");
		LOG.debug("=================");
		int flag = memberDao.doDelete(member02);
		if(1==flag) {
			LOG.debug("==삭제성공=");
		}
	}
	
	public void doSelectOne() {
		LOG.debug("=================");
		LOG.debug("==doSelectOne()=");
		LOG.debug("=================");
		
		MemberVO outVO = (MemberVO) memberDao.doSelectOne(member01);
		LOG.debug("==outVO="+outVO);
	}
	
	public void doRetrieve() {
		LOG.debug("=================");
		LOG.debug("==doRetrieve()=");
		LOG.debug("=================");
		searchVO.setSearchDiv("");
		searchVO.setSearchWord("");
		//memberDao.doRetrieve(searchVO);
		
		searchVO.setPageSize(10);
		searchVO.setPageNum(1);
		
		List<MemberVO> list = (List<MemberVO>)memberDao.doRetrieve(searchVO);
		
		LOG.debug("==list="+list);
	}
	
	
}