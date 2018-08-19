package post;

public class Posts {
	private int id;
	private String area;
	private String title;
	private String nickname;
	private String timestamp;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTime() {
		String text = "";
		text += timestamp.substring(2, 4);
		text += ".";
		text += timestamp.substring(5, 7);
		text += ".";
		text += timestamp.substring(8, 10);
		text += " ";
		text += timestamp.substring(11, 13);
		text += ":";
		text += timestamp.substring(14, 16);
		
		return text;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
