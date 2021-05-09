package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import cmn.StringUtil;
import service.MemberService;
import vo.MemberVO;
import dao.MemberDao;
import vo.MessageVO;
/**
 * Servlet implementation class LoginController
 */
@WebServlet("/logincontroller/logincontroller.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService;
	
	final Logger LOG = Logger.getLogger(MemberController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        memberService = new MemberService();
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
		request.setCharacterEncoding("UTF-8");
		String id = StringUtil.nvl(request.getParameter("id"), "");
		String passwd = StringUtil.nvl(request.getParameter("passwd"),"");
		MemberVO dto = new MemberVO();
		dto.setM_id(id);
		dto.setM_passwd(passwd);
		MessageVO msg = memberService.doLoginCheck(dto);
		int totalCnt = 0;
		
		if(msg.getMsgId().equals("0")) { //로그인 성공
			MemberVO loginMember = (MemberVO) memberService.doSelectOne(dto);
			HttpSession session =request.getSession();
			session.setAttribute("memberInfo", loginMember);
			
			request.setAttribute("message", msg);

			request.setAttribute("total_cnt", totalCnt);
			RequestDispatcher rd = request.getRequestDispatcher("/project/project_list.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("message", msg);

			request.setAttribute("total_cnt", totalCnt);
			RequestDispatcher rd = request.getRequestDispatcher("/member/member_login.jsp");
			rd.forward(request, response);
			
		}
		
		
		
	}

}
