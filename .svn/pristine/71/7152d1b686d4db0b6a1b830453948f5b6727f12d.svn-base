package test;

import org.apache.log4j.Logger;

import dao.SupporterDao;
import vo.SupporterVO;

public class SupporterMainTest {
	
	final static Logger LOG= Logger.getLogger(SupporterMainTest.class);
	
	
	
	private SupporterVO supporter01;
	private SupporterVO supporter02;
	
	
	private SupporterDao supporterDao;
	
	
	public SupporterMainTest() {
		supporter01=new SupporterVO("1","down8325",23124125,"경기도 일산",3000000,"","","","");
		supporter02=new SupporterVO("s20210306140142acdcdfe0405849f89917b8c0dc5de869","down8325",2312412,"경기도 일산",3000000,"","","","");
		
		
		supporterDao = new SupporterDao();
	}
	
	public static void main(String[] args) {
		
		
		SupporterMainTest spMain = new SupporterMainTest();
		
		//spMain.doInsert();
		//spMain.doUpdate();
		spMain.doChangeStatus();
	}
	
	
	public void doInsert() {
		int flag=0;
		flag= supporterDao.doInsert(supporter01);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("후원 성공");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("후원 실패");
			LOG.debug("=================");
		
		}
		
	}
	
	public void doUpdate() {
		int flag=0;
		flag= supporterDao.doUpdate(supporter02);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("후원 취소 성공");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("후원 취소 실패");
			LOG.debug("=================");
		
		}
	}
	
	public void doChangeStatus() {
		int flag=0;
		flag= supporterDao.doChangeStatus();
		LOG.debug("flag"+flag);
		
	}
	
	
}
