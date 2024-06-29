package vo;

public class ChatContVO {
	private int no;
	private String chatNum;
	private String nickName;
	private String cont;
	private String chatTime;
	private String[] attachList;
	private String chatAttach;
	
	//getter
	public int getNo() {
		return no;
	}
	public String getChatNum() {
		return chatNum;
	}
	public String getNickName() {
		return nickName;
	}
	public String getCont() {
		return cont;
	}
	public String getChatTime() {
		return chatTime;
	}
	public String[] getAttachList() {
		return attachList;
	}
	public String getChatAttach() {
		return chatAttach;
	}
	
	//setter
	public void setNo(int no) {
		this.no = no;
	}
	public void setChatNum(String chatNum) {
		this.chatNum = chatNum;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public void setAttachList(String[] attachList) {
		this.attachList = attachList;
	}
	public void setChatAttach(String chatAttach) {
		this.chatAttach = chatAttach;
	}
}
