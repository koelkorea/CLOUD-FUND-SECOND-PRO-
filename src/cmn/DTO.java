package cmn;

public class DTO {
	// 글 번호
	private int num;
	
	// 총 글수
	private int totalCnt;
	
	// 메시지 전달
	private int mfgFlag;
	private String msg;
	
	// 프로젝트 클릭 : 프로젝트 상세
	private int sumFund;			// 총 후원금
	private int percent;			// 달성률
	private int remainDate;			// 남은 시간
	private int supporterNum;		// 후원자 수
	
	// 후원 내역 리스트 
	private String projectName; 	  //프로젝트 이름
	private String projectClosedDate; //프로젝트 마감일
	private String projectStatus;     //프로젝트 진행상태 
	
	public DTO() {
		
	}

	//Getter & Setter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getMfgFlag() {
		return mfgFlag;
	}

	public void setMfgFlag(int mfgFlag) {
		this.mfgFlag = mfgFlag;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getSumFund() {
		return sumFund;
	}

	public void setSumFund(int sumFund) {
		this.sumFund = sumFund;
	}

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public int getRemainDate() {
		return remainDate;
	}

	public void setRemainDate(int remainDate) {
		this.remainDate = remainDate;
	}

	public int getSupporterNum() {
		return supporterNum;
	}

	public void setSupporterNum(int supporterNum) {
		this.supporterNum = supporterNum;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectClosedDate() {
		return projectClosedDate;
	}

	public void setProjectClosedDate(String projectClosedDate) {
		this.projectClosedDate = projectClosedDate;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	
	//toString
	@Override
	public String toString() {
		return "DTO [num=" + num + ", totalCnt=" + totalCnt + ", mfgFlag=" + mfgFlag + ", msg=" + msg + ", sumFund="
				+ sumFund + ", percent=" + percent + ", remainDate=" + remainDate + ", supporterNum=" + supporterNum
				+ ", projectName=" + projectName + ", projectClosedDate=" + projectClosedDate + ", projectStatus="
				+ projectStatus + "]";
	}
	
} // --- class
