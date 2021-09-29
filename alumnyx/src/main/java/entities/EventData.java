package entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EventData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String event_title;
	private String event_details;
	private LocalDate event_date;

	public EventData() {
		super();
	}

	public EventData(int id) {
		super();
		this.id = id;
	}

	public EventData(String event_title, String event_details, LocalDate event_date) {
		super();
		this.event_title = event_title;
		this.event_details = event_details;
		this.event_date = event_date;
	}

	public EventData(int id, String event_title, String event_details, LocalDate date) {
		super();
		this.id = id;
		this.event_title = event_title;
		this.event_details = event_details;
		this.event_date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_details() {
		return event_details;
	}

	public void setEvent_details(String event_details) {
		this.event_details = event_details;
	}

	public LocalDate getEvent_date() {
		return event_date;
	}

	public void setEvent_date(LocalDate event_date) {
		this.event_date = event_date;
	}

//	@Override
//	public String toString() {
//		return "EventData [id=" + id + ", event_title=" + event_title + ", event_details=" + event_details
//				+ ", event_date=" + event_date + "]";
//	}

}
