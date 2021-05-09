package vo;

import cmn.DTO;

public class FileVO extends DTO {
	private String orgFileName;		// 원본 파일명
	private String saveFileName;	// 저장 파일명
	private String filePath;		// 저장 경로
	private long fileSize;			// 파일 크기
	private String fileExt;			// 파일 확장자
	private String p_thumb;			// 프로젝트 카테고리
	
	public FileVO() {
		
	}

	public FileVO(String orgFileName, String saveFileName, String filePath, long fileSize, String fileExt,
			String p_thumb) {
		super();
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileExt = fileExt;
		this.p_thumb = p_thumb;
	}

	// Getters and Setters
	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public String getP_thumb() {
		return p_thumb;
	}

	public void setP_thumb(String p_thumb) {
		this.p_thumb = p_thumb;
	}

	// toString
	@Override
	public String toString() {
		return "FileVO [orgFileName=" + orgFileName + ", saveFileName=" + saveFileName + ", filePath=" + filePath
				+ ", fileSize=" + fileSize + ", fileExt=" + fileExt + ", p_thumb=" + p_thumb + ", toString()="
				+ super.toString() + "]";
	}
	
} // --- class
