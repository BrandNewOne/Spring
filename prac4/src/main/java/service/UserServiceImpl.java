package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import dto.Members;
import dto.Schedule;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
 
	@Override
	public Members getUserOne(String common,String col) {
		return userDAO.getUserOne(common,col);
	}

	@Override
	public int userJoin(Members members) {
		return userDAO.userJoin(members);
	}

	@Override
	public List<Members> selectMember() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.selectMember();
	}

	@Override
	public List<Schedule> selectSchedule() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.selectSchedule();
	}
	
	@Override
	public List<Schedule> selectMySchedule(String id) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.selectMySchedule(id);
	}
	
	@Override
	public int inputSchedule(Schedule schedule) {
		return userDAO.inputSchedule(schedule);
	}
	

	@Override
	public int deleteSchedule(Schedule schedule) {
		return userDAO.deleteSchedule(schedule);
	}

	
}