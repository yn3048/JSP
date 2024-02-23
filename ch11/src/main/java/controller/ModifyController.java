package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.MemberDTO;
import service.MemberService;

@WebServlet("/member/modify.do")
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private MemberService service = MemberService.getInstance();
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid = req.getParameter("uid");
		
		// 수정 사용자 조회
		MemberDTO member = service.selectMember(uid);
		
		// View에서 데이터 공유를 위해 request Scope에 데이터 설정
		req.setAttribute("member", member);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uid   = req.getParameter("uid");
		String name  = req.getParameter("name");
		String hp  	 = req.getParameter("hp");
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
		
		service.updateMembers(member);
		
		resp.sendRedirect("/ch11/member/list.do");
		
	}
	
	
	
}




















