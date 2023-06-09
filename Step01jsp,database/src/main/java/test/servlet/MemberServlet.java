package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import test.dto.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/list")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		
		List<Memberdto> list = new ArrayList<>();
		list.add(new Memberdto(1, "김구라", "노량진"));
		list.add(new Memberdto(2, "해골", "행신동"));
		list.add(new Memberdto(3, "원숭이", "상도동"));
		
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println(" <meta charset=\"UTF-8\">");
		pw.println("<title>회원 목록</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<table>");
		pw.println("<thead>");
		pw.println("<tr>");
		pw.println("<th>" + "번호" + "</th>");
		pw.println("<th>" + "이름" + "</th>");
		pw.println("<th>" + "주소" + "</th>");
		pw.println("</tr>");
		pw.println("<tbody>");
		
		Memberdto dto = new Memberdto();
		for(Memberdto tmp : list) {
			pw.println("<tr>");
			pw.println("<td>" + tmp.getNum() + "</td>" 
					  +"<td>" + tmp.getName() + "</td>" 
					  +"<td>" + tmp.getAddr() + "</td>");
			pw.println("</tr>");
		}
		pw.println("</tbody>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
