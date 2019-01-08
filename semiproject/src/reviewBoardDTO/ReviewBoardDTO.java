package reviewBoardDTO;

import java.util.Date;

public class ReviewBoardDTO {
	private int review_num;
	private String review_title, review_upload, review_contents, userid;
	private Date review_date;
	
	public Date getReview_date() {
		return review_date;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
		
}
