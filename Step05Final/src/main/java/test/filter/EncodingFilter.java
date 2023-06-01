package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
 *  요청을 중간에 가로채서 encoding설정을 해주는 Filter만들기
 */
@WebFilter(urlPatterns = {"/private/*", "/file/private/*"}) // "/*"는 이 프로젝트에 오는 모든 요청에 대해 필터링을 하겠다는 의미
public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	//필터가 동작할 때 호출되는 메서드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 만일 인코딩 설정이 되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//POST방식 전송했을 때 한글 깨짐 방지
			request.setCharacterEncoding("utf-8");
		}
		//2. 요청의 흐름 이어가기
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
