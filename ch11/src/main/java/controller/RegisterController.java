package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import DTO.MemberDTO;
import service.MemberService;

@WebServlet("/member/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private MemberService service = MemberService.getInstance();
	
	// Logback 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uid 	 = req.getParameter("uid");
		String name  = req.getParameter("name");
		String hp 	 = req.getParameter("hp");
		String pos 	 = req.getParameter("pos");
		String dep 	 = req.getParameter("dep");
		String rdate = req.getParameter("rdate");
		
		MemberDTO member = new MemberDTO();
		member.setUid(uid);
		member.setName(name);
		member.setHp(hp);
		member.setPos(pos);
		member.setDep(dep);
		member.setRdate(rdate);
		logger.info("member : " + member);
		
		service.insertMember(member);
		
		// 리다이렉트
		resp.sendRedirect("/ch11/member/list.do");
	}
	


	
}







