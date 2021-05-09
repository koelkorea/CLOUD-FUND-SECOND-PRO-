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

import cmn.StringUtil;
import service.ProjectService;
import vo.MessageVO;
import vo.ProjectVO;
import vo.SearchVO;

/**
 * Servlet implementation class ProjectController
 */
@WebServlet(description = "프로젝트 컨트롤러", urlPatterns = { "/project/project.do" })
public class ProjectController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	final Logger LOG = Logger.getLogger(ProjectController.class);
	
	ProjectService projectService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectController() {
        super();
        projectService = new ProjectService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String workDiv = StringUtil.nvl(request.getParameter("work_div"),"doRetrieve");
		LOG.debug("------------------------");
		LOG.debug("- workDiv - " + workDiv);
		LOG.debug("------------------------");
		
		
		switch(workDiv) {

		// 프로젝트 목록 조회
		case "doRetrieve":
			doRetrieve(request,response);	
			break;
			
		// 프로젝트 등록
		case "doInsert":
			doInsert(request,response);	
			break;
			
		// 프로젝트 삭제
		case "doDelete":
			doDel(request,response);	
			break;		
			
		// 프로젝트 수정
		case "doUpdate":
			doUpdate(request,response);	
			break;
			
		// 프로젝트 단건 조회 : 프로젝트 클릭
		case "doSelectOne":
			doSelectOne(request,response);	
			break;
		
		// 프로젝트 목록 화면(메인 페이지)으로 이동
		case "moveToList": 
			moveToList(request, response);
			break;
			
		// 프로젝트 등록 화면으로 이동
		case "moveToReg":
			moveToReg(request, response);
			break;
			
		}
		
		
	}
	
	// 프로젝트 단건 조회 : 프로젝트 클릭
	private void doSelectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("------------------------");
		LOG.debug("-doSelectOne");
		LOG.debug("------------------------");
		
		String pSeq=StringUtil.nvl(request.getParameter("p_seq"),"-1");
		ProjectVO param =  new ProjectVO();
		param.setP_seq(Integer.parseInt(pSeq));
		
		LOG.debug("-seq:"+pSeq);
		LOG.debug("--param-"+param);		
		
		ProjectVO outVO = projectService.doSelectOne(param);
		LOG.debug("--outVO-"+outVO);
		
		//화면에 데이터 전달!
		request.setAttribute("vo", outVO);
				
		RequestDispatcher dispacher = request.getRequestDispatcher("/project/project_mng.jsp");
		dispacher.forward(request, response);
		
	}

	// 프로젝트 수정
	public void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	// 프로젝트 삭제
	public void doDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	// 프로젝트 등록
	public void doInsert(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, ServletException, IOException {
		LOG.debug("---------------------------------");
		LOG.debug("- doInsert -");
		LOG.debug("---------------------------------");
		
		String p_m_id = StringUtil.nvl(request.getParameter("p_m_id"), "");
		String p_title = StringUtil.nvl(request.getParameter("p_title"), "");
		String p_thumb = StringUtil.nvl(request.getParameter("p_thumb"), "");
		String p_name = StringUtil.nvl(request.getParameter("p_name"), "");
		String p_contents = StringUtil.nvl(request.getParameter("p_contents"), "");
		String p_cate = StringUtil.nvl(request.getParameter("p_cate"), "");
		String p_tag = StringUtil.nvl(request.getParameter("p_tag"), "");
		String p_closedate = StringUtil.nvl(request.getParameter("p_closedate"), "");
		String p_minprice = StringUtil.nvl(request.getParameter("p_minprice"), "");
		String p_account = StringUtil.nvl(request.getParameter("p_account"), "");
		String p_goalfund = StringUtil.nvl(request.getParameter("p_goalfund"), "");
		
		LOG.debug("---------------------------------");
		LOG.debug("p_m_id : " + p_m_id);
		LOG.debug("p_title : " + p_title);
		LOG.debug("p_thumb : " + p_thumb);
		LOG.debug("p_name : " + p_name);
		LOG.debug("p_contents : " + p_contents);
		LOG.debug("p_cate : " + p_cate);
		LOG.debug("p_tag : " + p_tag);
		LOG.debug("p_closedate : " + p_closedate);
		LOG.debug("p_minprice : " + p_minprice);
		LOG.debug("p_account : " + p_account);
		LOG.debug("p_goalfund : " + p_goalfund);
		LOG.debug("---------------------------------");
		
		// VO Set
		ProjectVO param = new ProjectVO();
		param.setP_m_id(p_m_id);
		param.setP_title(p_title);
		param.setP_title(p_title);
		param.setP_thumb(p_thumb);
		param.setP_name(p_name);
		param.setP_contents(p_contents);
		param.setP_cate(p_cate);
		param.setP_tag(p_tag);
		param.setP_closedate(p_closedate);
		param.setP_minprice(Integer.parseInt(p_minprice));
		param.setP_account(p_account);
		param.setP_goalfund(Integer.parseInt(p_goalfund));	
		LOG.debug("param : " + param);
		
		int flag = projectService.doInsert(param);
		LOG.debug("flag : " + flag);
		
		MessageVO msgVO = new MessageVO();
		msgVO.setMsgId(String.valueOf(flag));
		
		String msg = "";
		
		if (flag == 1) {
			msg = "프로젝트 등록에 성공하셨습니다";
		} else {
			msg = "프로젝트 등록에 실패하셨습니다";
		}
		LOG.debug("msg : " + msg);
		
		msgVO.setMsgContents(msg);
		
		// VO to JSON
		Gson gson = new Gson();
		String jsonString = gson.toJson(msgVO);
		LOG.debug("jsonString : " + jsonString);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		
	}

	// 프로젝트 목록 화면(메인 페이지)으로 이동
	public void moveToList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			LOG.debug("---------------------------------");
			LOG.debug("- moveToList -");
			LOG.debug("---------------------------------");
			
			String m_id = StringUtil.nvl(request.getParameter(""), "");
			LOG.debug("m_id : " + m_id);
			
			// 화면으로 데이터 전달
			request.setAttribute("", 0);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/project/project_list.jsp");
			dispatcher.forward(request, response);
		}

	// 프로젝트 목록 조회
	private void doRetrieve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   LOG.debug("-------------");
		   LOG.debug("- 프로젝트 내역 -");
		   LOG.debug("-------------");
		   
		   String searchDiv  = StringUtil.nvl(request.getParameter("search_div"), "40");
		   SearchVO param = new SearchVO();
		   
		   //searchWord = 제목 or 태그------------------------------------------
		   if(searchDiv.equals("10")) { 
			   String searchWord  = StringUtil.nvl(request.getParameter("search_word") , "");
			   String pageSize   = StringUtil.nvl(request.getParameter("page_size"), "4");
			   String pageNum    = StringUtil.nvl(request.getParameter("page_num"), "1");
			   
			   param.setSearchWord(searchWord);
			   param.setPageSize(Integer.parseInt(pageSize));
			   param.setPageNum(Integer.parseInt(pageNum));
			   param.setSearchDiv(searchDiv);
			   LOG.debug("- param - " + param);
			   
			   List<ProjectVO> list = projectService.doRetrieve(param);
			   LOG.debug("-list-"+list);
			   
			  //총 글 수
			   int totalCnt = 0;
			   if(null != list && list.size() > 0) {
				   ProjectVO totalVO = list.get(0);
			       totalCnt = totalVO.getTotalCnt();
			   }
			   
			   //화면으로 데이터 전달
			   request.setAttribute("list", list);
			   request.setAttribute("param", param);
			   request.setAttribute("total_cnt", totalCnt);
			   
				RequestDispatcher dispacher = request.getRequestDispatcher("/project/project_list.jsp");
				dispacher.forward(request, response);
		   
		   //pCate = 10(연극), 20(뮤지컬), 30(토크쇼), 40(음악 공연), 50(자기 PR)--------------
		   }else if(searchDiv.equals("20")) { 
			   String pCate  = StringUtil.nvl(request.getParameter("p_category") , "");
			   String pageSize   = StringUtil.nvl(request.getParameter("page_size"), "4");
			   String pageNum    = StringUtil.nvl(request.getParameter("page_num"), "1");
			   
			   param.setP_cate(pCate);
			   param.setPageSize(Integer.parseInt(pageSize));
			   param.setPageNum(Integer.parseInt(pageNum));
			   param.setSearchDiv(searchDiv);
			   LOG.debug("- param - " + param);
			   
			   List<ProjectVO> list = projectService.doRetrieve(param);
			   LOG.debug("-list-"+list);
			   
			 //총 글 수
			   int totalCnt = 0;
			   if(null != list && list.size() > 0) {
				   ProjectVO totalVO = list.get(0);
			       totalCnt = totalVO.getTotalCnt();
			   }
			   
			   //화면으로 데이터 전달
			   request.setAttribute("list", list);
			   request.setAttribute("param", param);
			   request.setAttribute("total_cnt", totalCnt);
			   
				RequestDispatcher dispacher = request.getRequestDispatcher("/project/project_list.jsp");
				dispacher.forward(request, response);
			
		   //id로 검색------------------------------------------
		   }else if(searchDiv.equals("30")) {
			   String pMId  = StringUtil.nvl(request.getParameter("p_m_id") , "++++");
			   String pageSize   = StringUtil.nvl(request.getParameter("page_size"), "10");
			   String pageNum    = StringUtil.nvl(request.getParameter("page_num"), "1");
			   LOG.debug("- pMId - " + pMId);
			   
			   param.setP_m_id(pMId);
			   param.setPageSize(Integer.parseInt(pageSize));
			   param.setPageNum(Integer.parseInt(pageNum));
			   param.setSearchDiv(searchDiv);
			   LOG.debug("- param - " + param);
			   
			   //list 생성
			   List<ProjectVO> list = projectService.doRetrieve(param);
			   LOG.debug("-list-"+list);
			   
			   //총 글 수
			   int totalCnt = 0;
			   if(null != list && list.size() > 0) {
				   ProjectVO totalVO = list.get(0);
			       totalCnt = totalVO.getTotalCnt();
			   }
			   
			   //화면으로 데이터 전달
			   request.setAttribute("list", list);
			   request.setAttribute("param", param);
			   request.setAttribute("total_cnt", totalCnt);
			   
			   RequestDispatcher dispacher = request.getRequestDispatcher("/project/project_mypage.jsp");
			   dispacher.forward(request, response);
			   
			//전체보기------------------------------------------
		   } else {
			   String pageSize   = StringUtil.nvl(request.getParameter("page_size"), "4");
			   String pageNum    = StringUtil.nvl(request.getParameter("page_num"), "1");

			   param.setPageSize(Integer.parseInt(pageSize));
			   param.setPageNum(Integer.parseInt(pageNum));
			   param.setSearchDiv(searchDiv);
			   LOG.debug("- param - " + param);
			   
			   List<ProjectVO> list = projectService.doRetrieve(param);
			   LOG.debug("-list-"+list);
			   
			 //총 글 수
			   int totalCnt = 0;
			   if(null != list && list.size() > 0) {
				   ProjectVO totalVO = list.get(0);
			       totalCnt = totalVO.getTotalCnt();
			   }
			   
			   //화면으로 데이터 전달
			   request.setAttribute("list", list);
			   request.setAttribute("param", param);
			   request.setAttribute("total_cnt", totalCnt);
			   
				RequestDispatcher dispacher = request.getRequestDispatcher("/project/project_list.jsp");
				dispacher.forward(request, response);
			   
			   
		   }
	}
	
	// 프로젝트 등록 화면으로 이동
	public void moveToReg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("---------------------------------");
		LOG.debug("- moveToReg -");
		LOG.debug("---------------------------------");
		
		String m_id = StringUtil.nvl(request.getParameter("m_id"), "");
		LOG.debug("m_id : " + m_id);
		
		// 화면으로 데이터 전달
		request.setAttribute("m_id", m_id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/project/project_reg.jsp");
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

}
