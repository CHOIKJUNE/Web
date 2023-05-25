package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet {
	/*
	 * service()메서드에는 2개의 객체의 참조값이 매개변수에 전달된다.
	 * 
	 * HttpServletRequest객체 => 요청과 관련된 작업을 처리할 때 사용한다.
	 * HttpServletRespones객체 => 응답과 관련된 작업을 처리할 때 사용한다.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 해당 파라미터 명으로 전달되는 정보가 없으면 null리턴
		String msg = req.getParameter("msg");
		//콘솔창에 출력해보기
		System.out.println(msg);
		//응답 인코딩 설정
		req.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println(" <meta charset=\"UTF-8\">");
		pw.println("<title>메세지 전송 결과 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메세지 잘 받았습니다.</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

}
