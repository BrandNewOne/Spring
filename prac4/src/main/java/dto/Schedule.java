package dto;

public class Schedule {
	
	private String id;
	private String title;
	private String start;
	private String end;
	private String color;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	@Override
	public String toString() {
		return "{\"title\" : " +"\""+ title +"\""+ ", \"start\" : " +"\""+ start +"\""+ ", \"end\" : " +"\""+ end +"\""+ "}";
	}
	
	

}
