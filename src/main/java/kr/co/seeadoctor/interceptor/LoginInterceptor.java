package kr.co.seeadoctor.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터");
		if(request.getSession().getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/temp/loginForm.do");
			return false;
		}
		return true;
	}
	
	
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {
////		HttpSession session = request.getSession(false);
////		
////		if(session==null) {
////			response.sendRedirect(request.getContextPath() + "/temp/loginForm.do");
////			return false;
////		} else {
////			User user = (User) session.getAttribute("user");
////			if(user==null) {
////				response.sendRedirect(request.getContextPath() + "/temp/loginForm.do");
////				return false;
////			}
////		}
////		return true;
////	}
//		try {
//			System.out.println("인터셉터 작동중 ");
//			if(request.getSession().getAttribute("user")==null) {
//				System.out.println("세션 걸림");
//				response.sendRedirect(request.getContextPath() +"/temp/loginForm.do");
//				return false;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return true;
//		}
}