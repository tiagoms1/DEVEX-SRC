package obi1.fi.web.interceptor;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public final class GenericHandlerInterceptorAdapter extends HandlerInterceptorAdapter {

	private String strMsgError = "msgError";
	private String strBuildNumber = "buildNumber";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		if (request.getSession().getAttribute(strMsgError) != null) {
			request.setAttribute(strMsgError, request.getSession().getAttribute(strMsgError));
			request.getSession().setAttribute(strMsgError, null);
		}

    	try {
	    	Properties props = new Properties();
	    	InputStream in = getClass().getClassLoader().getResourceAsStream("serviceProperties.properties");
	    	props.load(in);
	    	in.close();
	    	
			request.setAttribute(strBuildNumber, props.getProperty("tickets.buildnumber"));
			request.getSession().setAttribute(strBuildNumber, props.getProperty("tickets.buildnumber"));
    	}
    	catch (Exception x) {
    		x.printStackTrace();
    	}

		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
	//	request.getSession().setAttribute("isErrorRedirect", false);
	}

}
