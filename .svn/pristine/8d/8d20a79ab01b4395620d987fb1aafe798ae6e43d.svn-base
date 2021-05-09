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
import service.MemberService;
import vo.MemberVO;
import vo.MessageVO;
import vo.SearchVO;



/**
 * Servlet implementation class MemberController
 */
@WebServlet(
		description = "회원관리", 
		urlPatterns = { 
				"/member/member.do", 
		})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private MemberService memberService;
	final Logger LOG = Logger.getLogger(MemberController.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        memberService = new MemberService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String workDiv = StringUtil.nvl(request.getParameter("work_div"), "doRetrieve");
		
		LOG.debug("---------------------");
		LOG.debug("-workDiv-" + workDiv);
		LOG.debug("---------------------");
		
		switch(workDiv) {
			
		case "doInsert"://가입
			doInsert(request,response);	
			break;
		
		case "doUpdate"://수정
			doUpdate(request,response);	
			break;
			
		case "idCheck"://중복확인
			idCheck(request,response);	
			break;
		}
		
	}

	
	public void doInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//회원가입
		LOG.debug("---------------------------------");
		LOG.debug("- doInsert -");
		LOG.debug("---------------------------------");
		
		String m_id = StringUtil.nvl(request.getParameter("m_id"), "");
		String m_name = StringUtil.nvl(request.getParameter("m_name"), "");
		String m_passwd = StringUtil.nvl(request.getParameter("m_passwd"), "");
		String m_status = StringUtil.nvl(request.getParameter("m_status"), "");
		String m_phone = StringUtil.nvl(request.getParameter("m_phone"), "");
		String m_addr = StringUtil.nvl(request.getParameter("m_addr"), "");
		String m_card = StringUtil.nvl(request.getParameter("m_card"), "");
		String mod_id = StringUtil.nvl(request.getParameter("mod_id"), "");
		
		LOG.debug("---------------------------------");
		LOG.debug("m_id : " + m_id);
		LOG.debug("m_name : " + m_name);
		LOG.debug("m_passwd : " + m_passwd);
		LOG.debug("m_status : " + m_status);
		LOG.debug("m_phone : " + m_phone);
		LOG.debug("m_addr : " + m_addr);
		LOG.debug("m_card : " + m_card);
		LOG.debug("mod_id : " + mod_id);
		LOG.debug("---------------------------------");
		
		// VO Set
		MemberVO param = new MemberVO();
		param.setM_id(m_id);
		param.setM_name(m_name);
		param.setM_passwd(m_passwd);
		param.setM_status(m_status);
		param.setM_phone(m_phone);
		param.setM_addr(m_addr);
		param.setM_card(m_card);
		param.setMod_id(mod_id);
		LOG.debug("param : " + param);
		
		int flag = memberService.doInsert(param);
		LOG.debug("flag : " + flag);
		
		MessageVO msgVO = new MessageVO();
		msgVO.setMsgId(String.valueOf(flag));
		
		String msg = "";
		
		if (flag ==1) {
			msg = "회원가입에 성공하셨습니다";
		} else {
			msg = "회원가입에 실패하셨습니다";
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
	
	public void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//회원정보 수정
		LOG.debug("------------------------");
		LOG.debug("-doUpdate");
		LOG.debug("------------------------");
		
		//1.param read
		String Id  =StringUtil.nvl(request.getParameter("m_id"),"");
		String name  =StringUtil.nvl(request.getParameter("m_name"),"");
		String passwd  =StringUtil.nvl(request.getParameter("m_passwd"),"");
		String phone  =StringUtil.nvl(request.getParameter("m_phone"),"");
		String addr  =StringUtil.nvl(request.getParameter("m_addr"),"");
		String card  =StringUtil.nvl(request.getParameter("m_card"),"");
		
		MemberVO param= new MemberVO();
		param.setM_id(Id);
		param.setM_name(name);
		param.setM_passwd(passwd);
		param.setM_addr(addr);
		param.setM_phone(phone);
		param.setM_card(card);
		
		LOG.debug("-param-"+param);
		
		int flag=this.memberService.doUpdate(param);
		
		MessageVO messageVO = new MessageVO();
		String message = "수정 되었습니다";
		
		if(flag==1) {
			message = "수정 되었습니다";
		}else {
			message = "수정 실패";
		}
		messageVO.setMsg(message);
		messageVO.setMsgId(String.valueOf(flag));
		
		Gson gson = new Gson();
		
		String gsonString = gson.toJson(messageVO);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(gsonString);
	
		
	}
	
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//중복확인
		LOG.debug("------------------------");
		LOG.debug("-idCheck");
		LOG.debug("------------------------");
		
		String Id  =StringUtil.nvl(request.getParameter("m_id"),"");
		
		MemberVO param= new MemberVO();
		param.setM_id(Id);
		LOG.debug("-Id-"+Id);
		
		LOG.debug("-param-"+param);
		
		int flag=this.memberService.idCheck(param);
		LOG.debug("------------------------");
		LOG.debug("flag"+flag);
		LOG.debug("------------------------");
		MessageVO messageVO = new MessageVO();
		String message = "";
		
		if(flag==0) {
			message = "중복없음";
		}else{
			message = "아이디 중복";
		}
		
		messageVO.setMsg(message);
		messageVO.setMsgId(String.valueOf(flag));
		
		Gson gson = new Gson();
		
		String gsonString = gson.toJson(messageVO);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(gsonString);
		
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
