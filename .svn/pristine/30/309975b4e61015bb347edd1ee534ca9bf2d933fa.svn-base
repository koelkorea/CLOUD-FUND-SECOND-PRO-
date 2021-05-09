package vo;

import cmn.DTO;

public class SearchVO extends DTO {
	
	private String searchDiv;		// 검색 구분
	private String searchWord;		// 검색어
	
	private int pageSize;			// 10, 20, 30, 50, 100 
	private int pageNum;			// 1, 2, 3, ...
	
	private String p_cate;			// 카테고리 검색 : p_cate = 10(연극), 20(뮤지컬), 30(토크쇼), 40(음악 공연), 50(자기 PR) 
	private String p_m_id;			// 내가 등록한 프로젝트 검색
	
	public SearchVO() {
		
	}

	public SearchVO(String searchDiv, String searchWord, int pageSize, int pageNum, String div, String p_cate,
			String p_m_id) {
		super();
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.p_cate = p_cate;
		this.p_m_id = p_m_id;
	}

	// Getters and Setters
	public String getSearchDiv() {
		return searchDiv;
	}

	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}


	public String getP_cate() {
		return p_cate;
	}

	public void setP_cate(String p_cate) {
		this.p_cate = p_cate;
	}

	public String getP_m_id() {
		return p_m_id;
	}

	public void setP_m_id(String p_m_id) {
		this.p_m_id = p_m_id;
	}

	// toString
	@Override
	public String toString() {
		return "SearchVO [searchDiv=" + searchDiv + ", searchWord=" + searchWord + ", pageSize=" + pageSize
				+ ", pageNum=" + pageNum + ", p_cate=" + p_cate + ", p_m_id=" + p_m_id
				+ ", toString()=" + super.toString() + "]";
	}

} // --- class