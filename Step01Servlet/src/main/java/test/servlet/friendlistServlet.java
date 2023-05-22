package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class friendlistServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println(" <meta charset=\"UTF-8\">");
		pw.println("<title>친구 목록</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<ul>");
		
		Iterator<String> it = names.iterator();
		while(it.hasNext()) {
			pw.println("<li>" + it.next() + "</li>");
		}
//		for(int i=0; i<names.size(); i++) {
//			pw.println("<li>" + names.get(i) + "</li>");
//		}
		pw.println("</ul>");
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
		
		
	}
	
	
	
}
