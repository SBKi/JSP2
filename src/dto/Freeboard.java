package dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Freeboard {
	private int dix;
	private String name;
	private String password;
	private String subjec;
	private String content;
	private int readCount;
	private Date wdate;
	private String ip;
	private short commentCount;
}
