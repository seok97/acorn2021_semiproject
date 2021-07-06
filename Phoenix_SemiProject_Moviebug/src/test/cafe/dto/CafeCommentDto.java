package test.cafe.dto;

public class CafeCommentDto {
	private int qna_comment_idx;
	private String qna_comment_writer;
	private String qna_comment_content;
	private String qna_comment_target_id;
	private int qna_comment_ref_group;
	private int qna_comment_group;
	private String qna_comment_deleted;
	private String qna_comment_regdate;
	private String profile;
	private int StartRowNum;
	private int EndRowNum;
	
	public CafeCommentDto() {}

	public CafeCommentDto(int qna_comment_idx, String qna_comment_writer, String qna_comment_content,
			String qna_comment_target_id, int qna_comment_ref_group, int qna_comment_group, String qna_comment_deleted,
			String qna_comment_regdate, String profile, int startRowNum, int endRowNum) {
		super();
		this.qna_comment_idx = qna_comment_idx;
		this.qna_comment_writer = qna_comment_writer;
		this.qna_comment_content = qna_comment_content;
		this.qna_comment_target_id = qna_comment_target_id;
		this.qna_comment_ref_group = qna_comment_ref_group;
		this.qna_comment_group = qna_comment_group;
		this.qna_comment_deleted = qna_comment_deleted;
		this.qna_comment_regdate = qna_comment_regdate;
		this.profile = profile;
		StartRowNum = startRowNum;
		EndRowNum = endRowNum;
	}

	public int getQna_comment_idx() {
		return qna_comment_idx;
	}

	public void setQna_comment_idx(int qna_comment_idx) {
		this.qna_comment_idx = qna_comment_idx;
	}

	public String getQna_comment_writer() {
		return qna_comment_writer;
	}

	public void setQna_comment_writer(String qna_comment_writer) {
		this.qna_comment_writer = qna_comment_writer;
	}

	public String getQna_comment_content() {
		return qna_comment_content;
	}

	public void setQna_comment_content(String qna_comment_content) {
		this.qna_comment_content = qna_comment_content;
	}

	public String getQna_comment_target_id() {
		return qna_comment_target_id;
	}

	public void setQna_comment_target_id(String qna_comment_target_id) {
		this.qna_comment_target_id = qna_comment_target_id;
	}

	public int getQna_comment_ref_group() {
		return qna_comment_ref_group;
	}

	public void setQna_comment_ref_group(int qna_comment_ref_group) {
		this.qna_comment_ref_group = qna_comment_ref_group;
	}

	public int getQna_comment_group() {
		return qna_comment_group;
	}

	public void setQna_comment_group(int qna_comment_group) {
		this.qna_comment_group = qna_comment_group;
	}

	public String getQna_comment_deleted() {
		return qna_comment_deleted;
	}

	public void setQna_comment_deleted(String qna_comment_deleted) {
		this.qna_comment_deleted = qna_comment_deleted;
	}

	public String getQna_comment_regdate() {
		return qna_comment_regdate;
	}

	public void setQna_comment_regdate(String qna_comment_regdate) {
		this.qna_comment_regdate = qna_comment_regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getStartRowNum() {
		return StartRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		StartRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return EndRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		EndRowNum = endRowNum;
	}

}
