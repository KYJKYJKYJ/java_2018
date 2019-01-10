package dto;

import java.util.Date;

public class ReviewBoardDTO {
	private int review_num, review_ref;
	private String review_title, review_upload, review_contents, user_id;
	private Date review_date;
	private int re_col;

	public int getRe_col() {
		return re_col;
	}

	public void setRe_col(int re_col) {
		this.re_col = re_col;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	private String re_content;

	public Date getReview_date() {
		return review_date;
	}

	public int getReview_ref() {
		return review_ref;
	}

	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public ReviewBoardDTO() {

	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_upload() {
		return review_upload;
	}

	public void setReview_upload(String review_upload) {
		this.review_upload = review_upload;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
