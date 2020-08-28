package service;

import java.util.List;

import dto.Members;
import dto.Schedule;


public interface UserService {

	Members getUserOne(String common, String col);

	int userJoin(Members members);
	
	public List<Members> selectMember() throws Exception;
	
	public List<Schedule> selectSchedule() throws Exception;
	
	public List<Schedule> selectMySchedule(String id) throws Exception;

	int inputSchedule(Schedule schedule);
	
	int deleteSchedule(Schedule schedule);


}