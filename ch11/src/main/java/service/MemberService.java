package service;

import java.util.List;

import DTO.MemberDTO;
import dao.MemberDAO;

public class MemberService {

	private static MemberService instance = new MemberService();
	public static MemberService getInstance() {
		return instance;
	}
	private MemberService() {}
	
	private MemberDAO dao = MemberDAO.getInstance();
	
	public void insertMember(MemberDTO member) {
		dao.insertMember(member);
	}
	
	public MemberDTO selectMember(String uid) {
		return dao.selectMember(uid);
	}
	
	public List<MemberDTO> selectMembers() {
		return dao.selectMembers();
	}
	
	public void updateMembers(MemberDTO member) {
		dao.updateMember(member);
	}
	
	public void deleteMember(String uid) {
		dao.deleteMember(uid);
	}
	
}











