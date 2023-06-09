import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행(DB에서 읽어왔다고 가정)
		String fortune = "동쪽으로 가면 귀인을 만나요.";
		
		//응답을 여기서 하지 않고 jsp페이지로 응답
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		/*
		 *  webapp/test/fortune.jsp페이지에게 응답을 대신하도록 하고
		 *  응답에 필요한 HttpServletRequest, HttpServletResponse객체를 전달해준다.
		 */
		rd.forward(req, resp);
	}

	
}
