package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

import vo.MessageVO;
import vo.ProjectVO;
import vo.SearchVO;
import vo.SupporterVO;
import cmn.StringUtil;
import service.ProjectService;
import service.SupporterService;

/**
 * Servlet implementation class SupporterController
 */
@WebServlet("/supporter/supporter.do")
public class SupporterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final Logger LOG = Logger.getLogger(SupporterController.class);
	
	private SupporterService spService;
	private ProjectService pjService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupporterController() {
        super();
        spService= new SupporterService();
    }
    
   
    /**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request에 들어오는 encoding 일괄로 UTF-8
		request.setCharacterEncoding("UTF-8");
		String workDiv = StringUtil.nvl(request.getParameter("work_div"),"doRetrieve");
		LOG.debug("------------------------");
		LOG.debug("-workDiv-"+workDiv);
		LOG.debug("------------------------");
		
		switch(workDiv) {
			case "doRetrieve"://진행중인 프로젝트 클릭시 후원자들 리스트 출력
				doRetrieve(request,response);	
				break;
			
			case "doRetrieveSp"://내가 후원한 내역 출력
				doRetrieveSp(request,response);
				break;
				
			case "doInsert"://등록
				doInsert(request,response);	
				break;
				
			case "doDelete"://결제 취소
				doDel(request,response);	
				break;		
				
			case "doUpdate"://결제 정보 업데이트
				doUpdate(request,response);	
				break;	
				
			case "doSelectOne"://내가 후원한 내역 출력 상세보기
				doSelectOne(request,response);	
				break;	
		}
		  
		
	}
	private void doRetrieveSp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   LOG.debug("----------");
		   LOG.debug("- 후원 내역 -");
		   LOG.debug("----------");
		   
		   //파라미터 : 세션에 기입된 로그인 id값 줌
		   String mId  = StringUtil.nvl(request.getParameter("m_id") , "");
		   //파라미터 : paging
		   String pageSize   = StringUtil.nvl(request.getParameter("page_size"), "10");
		   String pageNum    = StringUtil.nvl(request.getParameter("page_num"), "1");

		   //값 확인
		   LOG.debug("-----------------------------");
		   LOG.debug("- mId - " + mId);
		   LOG.debug("- pageSize - " + pageSize);
		   LOG.debug("- pageNum - " + pageNum);
		   LOG.debug("-----------------------------");
		   
		   // 파라미터를 SearchVO에 기입
		   SearchVO param = new SearchVO();
		   param.setSearchWord(mId);
		   param.setPageSize(Integer.parseInt(pageSize));
		   param.setPageNum(Integer.parseInt(pageNum));
  
		   //list 생성
		   List<SupporterVO> list = spService.doRetrieveSp(param);

		   //총 글 수
		   int totalCnt = 0;
		   if(null != list && list.size() > 0) {
			   SupporterVO totalVO = list.get(0);
		       totalCnt = totalVO.getTotalCnt();
		   }
		   
		   // 해당 화면에 Data 전달
		   request.setAttribute("param", param);
		   request.setAttribute("list", list);
		   request.setAttribute("total_cnt", totalCnt);
		   
		   RequestDispatcher dispatcher = request.getRequestDispatcher("/supporter/supporter_list.jsp");
		   dispatcher.forward(request, response);

		}


	private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LOG.debug("------------------------");
		LOG.debug("-doUpdate");
		LOG.debug("------------------------");
		
		//1.param read
		String sPseq = StringUtil.nvl(request.getParameter("s_p_seq"), "-1");
		LOG.debug("sPseq:"+sPseq);
		
		SupporterVO param = new SupporterVO();
		param.setS_p_seq(Integer.parseInt(sPseq));
		
		LOG.debug("-param:"+param);
		LOG.debug("------------------------");
		
		int flag = this.spService.doUpdate(param);
		LOG.debug("-flag:"+flag);
		
		MessageVO msgVO=new MessageVO();
		msgVO.setMsgId(String.valueOf(flag));
		
		String msg = "";
		if(1==flag) {
			msg = "펀딩 성공";
		}else {
			msg = "펀딩 실패";
		}
		msgVO.setMsgContents(msg);
		
		Gson gson=new Gson();
		String jsonString = gson.toJson(msgVO);
		LOG.debug("-jsonString-"+jsonString);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.print(jsonString);
		
		
	}


	private void doDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LOG.debug("-------");
		LOG.debug("-doDel-");
		LOG.debug("-------");
		
		//1.param read
		String sSeq = StringUtil.nvl(request.getParameter("s_seq"), "-1");
		String mId = StringUtil.nvl(request.getParameter("m_id"), "1");
		
		LOG.debug("sSeq:"+sSeq);
		LOG.debug("mId:"+mId);

		SupporterVO param = new SupporterVO();
		param.setS_seq(sSeq);
		param.setMod_id(mId);
		
		LOG.debug("-param:"+param);
		LOG.debug("------------------------");
		
		int flag = this.spService.doDelete(param);
		LOG.debug("-flag:"+flag);
		
		MessageVO msgVO=new MessageVO();
		msgVO.setMsgId(String.valueOf(flag));
		
		String msg = "";
		if(1==flag) {
			msg = "후원 취소 성공";
		}else {
			msg = "후원 취소 실패";
		}
		msgVO.setMsgContents(msg);
		
		Gson gson=new Gson();
		String jsonString = gson.toJson(msgVO);
		LOG.debug("-jsonString-"+jsonString);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.print(jsonString);
		
	}


	private void doInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		LOG.debug("------------------------");
		LOG.debug("-workDiv-doInsert");
		LOG.debug("------------------------");
		
		
		
		//1.param read
		String sMid =StringUtil.nvl(request.getParameter("s_m_id"), "");
		String sPseq =StringUtil.nvl(request.getParameter("s_p_seq"), "");
		String sAddr =StringUtil.nvl(request.getParameter("s_addr"), "");
		String sFund =StringUtil.nvl(request.getParameter("s_fund"), "");
		//String sStatus =StringUtil.nvl(request.getParameter("s_status"), "0"); 넣을 필요 없어 뺏는데 필요하면 쓰면 됩니다
		
		LOG.debug("------------------------");
		LOG.debug("-sMid-"+sMid);
		LOG.debug("-sPseq-"+sPseq);
		LOG.debug("-sAddr-"+sAddr);
		LOG.debug("-sFund-"+sFund);
		LOG.debug("------------------------");		
		
		
		SupporterVO param = new SupporterVO();
		param.setS_m_id(sMid);
		param.setS_p_seq(Integer.parseInt(sPseq));
		param.setS_addr(sAddr);
		param.setS_fund(Integer.parseInt(sFund));
		LOG.debug("-param-"+param);
		LOG.debug("------------------------");
		
		int flag= spService.doInsert(param);
		LOG.debug("-flag-"+flag);
		
		MessageVO  msgVO=new MessageVO();
		msgVO.setMsgId(String.valueOf(flag));
		
		
		String msg = "";
		if(1==flag) {
			msg ="후원 성공";
		}else {
			msg ="후원 실패";
		}
		
		msgVO.setMsgContents(msg);
		//VO to JSON
		Gson gson=new Gson();
		String jsonString = gson.toJson(msgVO);
		LOG.debug("-jsonString-"+jsonString);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.print(jsonString);
		
				
	}


	private void doRetrieve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("------------");
		LOG.debug("-doRetrieve-");
		LOG.debug("------------");	
		
		String searchWord = StringUtil.nvl(request.getParameter("p_seq"), "");
		String pageSize = StringUtil.nvl(request.getParameter("page_size"), "10");
		String pageNum = StringUtil.nvl(request.getParameter("page_num"), "1");
		
		LOG.debug("------------------------");
		LOG.debug("-searchWord-"+searchWord);
		LOG.debug("-pageSize-"+pageSize);
		LOG.debug("-pageSize-"+pageNum);
		LOG.debug("------------------------");	
		
		//service에 DTO전달
		SearchVO   param=new SearchVO();
				
		param.setSearchWord(searchWord);
		
		int pageSizeNum = Integer.parseInt(pageSize);
		param.setPageSize(pageSizeNum);
		param.setPageNum(Integer.parseInt(pageNum));
		
		LOG.debug("-param-"+param);
		//List<DTO> return
		List<SupporterVO> list = spService.doRetrieve(param);
		LOG.debug("-list.size-"+list.size());
		//해당화면에 DATA 전달!
		
		LOG.debug("-list-"+list);
		
		//화면으로 데이터 전달
		request.setAttribute("list", list);
		
		//화면으로 param 전달
		request.setAttribute("param", param);
		
		//총글수
		int totalCnt=0;
		if(null !=list && list.size()>0) {
			SupporterVO totalVO =list.get(0);
			totalCnt = totalVO.getTotalCnt();
		}
		
		//화면으로 총 글수 전달
		request.setAttribute("total_cnt", totalCnt);
		
		
		RequestDispatcher  dispatcher= request.getRequestDispatcher("/supporter/supporter_supportList.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

	private void doSelectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   LOG.debug("-------------------");
		   LOG.debug("- 후원 내역 상세 페이지 -");
		   LOG.debug("-------------------");
		   
		   String s_seq = StringUtil.nvl(request.getParameter("s_seq"), "");
		   String m_id = StringUtil.nvl(request.getParameter("m_id"), "");
		   LOG.debug("--------------");
		   LOG.debug("s_seq : "+s_seq);
		   LOG.debug("m_id : " +m_id);
		   LOG.debug("--------------");
		   
		   SupporterVO param = new SupporterVO();
		   param.setS_seq(s_seq);
		   param.setS_m_id(m_id);
		   LOG.debug("param : "+param);
		   
		   SupporterVO outVO = spService.doSelectOne(param);
		   outVO.setS_seq(s_seq);
		   outVO.setS_m_id(m_id);
		   LOG.debug("outVO : "+outVO);
		   
		   request.setAttribute("outVO", outVO);
		   
		   RequestDispatcher  dispatcher= request.getRequestDispatcher("/supporter/supporter_list_detail.jsp");
		   dispatcher.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}//class
