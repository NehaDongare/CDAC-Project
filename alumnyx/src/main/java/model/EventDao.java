package model;

import java.util.List;

import entities.EventData;

public interface EventDao {

	public EventData insertData(EventData record);
	public EventData updateData(EventData a);
	public EventData deleteData(EventData a);
	public EventData getEventbyId(EventData a);
	public List<EventData> getAllData();
}
