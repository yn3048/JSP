package kr.co.jboard2.dto;

public class FileDTO {

	private int fno;
	private int ano;
	private String oName;
	private String sName;
	private int download;
	private String rdate;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	
	public void setFno(String fno) {
		// 오버로드(매개변수로 구분)
		this.fno = Integer.parseInt(fno);
	}
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public void setAno(String ano) {
		// 오버로드(매개변수로 구분)
		this.fno = Integer.parseInt(ano);
	}
	
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "FileDTO [fno=" + fno + ", ano=" + ano + ", oName=" + oName + ", sName=" + sName + ", download="
				+ download + ", rdate=" + rdate + "]";
	}
	
	
	
}
