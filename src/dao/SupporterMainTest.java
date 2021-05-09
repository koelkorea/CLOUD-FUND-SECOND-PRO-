package dao;

import java.util.List;

import org.apache.log4j.Logger;

import vo.SearchVO;
import vo.SupporterVO;

public class SupporterMainTest {
	
	final static Logger LOG= Logger.getLogger(SupporterMainTest.class);
	
	
	
	private SupporterVO supporter01;
	private SupporterVO supporter02;
	private SupporterVO supporter03;
	
	private SearchVO search01;
	private SearchVO search02;
	
	private SupporterDao supporterDao;
	
	
	public SupporterMainTest() {
		supporter01=new SupporterVO("1","down8325",231241,"경기도 일산",3000000,"","","","");
		supporter02=new SupporterVO("s20210306140142acdcdfe0405849f89917b8c0dc5de869","down8325",312412,"경기도 일산",3000000,"","","","");
		
		
		//-----doRetrieve------------
		search01=new SearchVO("", "231241", 10, 1, "", "", "");
		//-----doRetrieveSp-------------------
		search02=new SearchVO("", "down8325", 10, 1, "", "", "");
		
		supporterDao = new SupporterDao();
	}
	
	public static void main(String[] args) {
		
		
		SupporterMainTest spMain = new SupporterMainTest();
		
		//spMain.doInsert();
		//spMain.doUpdate();
		spMain.doRetrieve();
		spMain.doRetrieveSp();
	}
	
	
	public void doInsert() {
		int flag=0;
		flag= supporterDao.doInsert(supporter01);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("후원하기");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("후원하기 실패");
			LOG.debug("=================");
		
		}
		
	}
	
	public void doUpdate() {
		int flag=0;
		flag= supporterDao.doUpdate(supporter02);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("펀딩  성공");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("펀딩 성공 실패");
			LOG.debug("=================");
		
		}
	}
	
	public void doDelete() {
		int flag=0;
		flag= supporterDao.doDelete(supporter02);
		LOG.debug("flag"+flag);
		if(flag==1) {
			LOG.debug("=================");
			LOG.debug("펀딩  실패");
			LOG.debug("=================");
			
		}else {
			LOG.debug("=================");
			LOG.debug("펀딩 실패 실패");
			LOG.debug("=================");
		
		}
	}
	
	
	public void doRetrieve() {
		List<SupporterVO> resultList=(List<SupporterVO>) supporterDao.doRetrieve(search01);
		LOG.debug("doRetrieve() 건수:"+resultList.size());
		
	}
	
	public void doRetrieveSp() {
		List<SupporterVO> resultList=(List<SupporterVO>) supporterDao.doRetrieveSp(search02);
		LOG.debug("doRetrieveSp() 건수:"+resultList.size());
		
	}
	
}
