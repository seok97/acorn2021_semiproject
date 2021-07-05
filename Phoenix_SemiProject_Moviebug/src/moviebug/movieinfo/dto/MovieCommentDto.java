package moviebug.movieinfo.dto;

public class MovieCommentDto {
	private int comment_idx;
	private String comment_writer;
	private String comment_content;
	private String comment_target_id;
	private int comment_ref_group;
	private int comment_group;
	private String comment_deleted;
	private String comment_regdate;
	private String profile;
	private int startRowNum;
	private int endRowNum;
	
	public MovieCommentDto() {}

	public MovieCommentDto(int comment_idx, String comment_writer, String comment_content, String comment_target_id,
			int comment_ref_group, int comment_group, String comment_deleted, String comment_regdate, String profile,
			int startRowNum, int endRowNum) {
		super();
		this.comment_idx = comment_idx;
		this.comment_writer = comment_writer;
		this.comment_content = comment_content;
		this.comment_target_id = comment_target_id;
		this.comment_ref_group = comment_ref_group;
		this.comment_group = comment_group;
		this.comment_deleted = comment_deleted;
		this.comment_regdate = comment_regdate;
		this.profile = profile;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_target_id() {
		return comment_target_id;
	}

	public void setComment_target_id(String comment_target_id) {
		this.comment_target_id = comment_target_id;
	}

	public int getComment_ref_group() {
		return comment_ref_group;
	}

	public void setComment_ref_group(int comment_ref_group) {
		this.comment_ref_group = comment_ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getComment_deleted() {
		return comment_deleted;
	}

	public void setComment_deleted(String comment_deleted) {
		this.comment_deleted = comment_deleted;
	}

	public String getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	
}
