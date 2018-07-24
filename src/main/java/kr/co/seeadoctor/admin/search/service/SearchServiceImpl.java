package kr.co.seeadoctor.admin.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.User;

@Service
public class SearchServiceImpl implements SearchService {

   @Autowired
   private UserMapper userMapper;
   @Autowired
   private ReservationMapper reserveMapper;
   
   
   @Override
   public List<User> retrieveCustomerByName(User user) {
      return userMapper.selectUserByName(user);
   }


   @Override
   public Map<String, Object> retriveReservationByUserSeq(int userSeq) {
      
      Map<String, Object> reserveHistory = new HashMap<String, Object>();
      
      List<Reservation> reserveList = reserveMapper.selectRervationByUserSeq(userSeq);
      User userInfo = userMapper.selectUserBySeq(userSeq);
      
      reserveHistory.put("reserveList", reserveList);
      reserveHistory.put("userInfo", userInfo);
      
      return reserveHistory;
   }
}
   
