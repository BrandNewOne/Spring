package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Members;
import dto.Schedule;

@Repository
public class UserDAO {

	@Autowired
	public SqlSession sqlSession;

	public Members getUserOne(String common, String col) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (col.equals("id")) {
			map.put("id", common);
		}
		return sqlSession.selectOne("getUserOne", map);
	}

	public int userJoin(Members members) {
		return sqlSession.insert("userJoin", members);
	}
	
	public List<Members> selectMember() throws Exception {
		 
        return sqlSession.selectList("selectMember");
    }
	
	public List<Schedule> selectSchedule() throws Exception {
		 
        return sqlSession.selectList("selectSchedule");
    }
	
	public List<Schedule> selectMySchedule(String id) throws Exception {
		 
        return sqlSession.selectList("selectMySchedule");
    }
	
	public int inputSchedule(Schedule schedule) {
		return sqlSession.insert("inputSchedule", schedule);
	}
	
	public int deleteSchedule(Schedule schedule) {
		return sqlSession.delete("deleteSchedule", schedule);
	}

}