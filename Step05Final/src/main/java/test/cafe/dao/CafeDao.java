package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.file.dto.FileDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	
	public static CafeDao getInstance() {
		if(dao==null) {
			return new CafeDao();
		}
		return dao;
	}
	
	   //전체 글의 개수를 리턴해주는 메서드
	   public int getCount() {
		//글의 개수를 담을 지역변수
		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection객체를 얻어온다(Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			String sql = "SELECT MAX(ROWNUM)AS num FROM board_cafe";
			ps = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			//select문 수행하고 결과값 받아오기
			rs = ps.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				count = rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return count;
		}
	   
	 //페이지에 해당하는 목록만 리턴하는 메서드
	   public List<CafeDto> getList(CafeDto dto) {
		   //파일 목록을 담을 ArrayList 객체 생성 
		      List<CafeDto> list=new ArrayList<CafeDto>();
		      
		      //필요한 객체의 참조값을 담을 지역변수 미리 만들기
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         //DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
		         conn = new DbcpBean().getConn();
		         //실행할 sql 문 
		         String sql = "SELECT *"
		         		+ " FROM (SELECT num, writer, title, viewCount, regdate, ROWNUM AS rnum"
		         		+ " FROM board_cafe"
		         		+ " ORDER BY num DESC)"
		         		+ " WHERE rnum BETWEEN ? AND ?";
		         pstmt = conn.prepareStatement(sql);
		         //sql 문이 미완성이라면 여기서 완성
		         pstmt.setInt(1, dto.getStartRowNum());
		         pstmt.setInt(2, dto.getEndRowNum());
		         //select 문 수행하고 결과값 받아오기
		         rs = pstmt.executeQuery();
		         //반복문 돌면서 ResultSet 에 담긴 내용 추출
		         while (rs.next()) {
		            //FileDto 객체에 select 된 row 하나의 정보를 담고
		            CafeDto tmp=new CafeDto();
		            tmp.setNum(rs.getInt("num"));
		            tmp.setWriter(rs.getString("writer"));
		            tmp.setTitle(rs.getString("title"));
		            tmp.setViewCount(rs.getInt("viewCount"));
		            tmp.setRegdate(rs.getString("regdate"));
		            //ArrayList 객체에 누적 시킨다.
		            list.add(tmp);
		         }
		      } catch (SQLException se) {
		         se.printStackTrace();
		      } finally {
		         try {
		            if (rs != null)
		               rs.close();
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close(); //Connection 이 Connection Pool 에 반납된다.
		         } catch (Exception e) {
		         }
		      }
		      return list;
	   }
	
	//카페 회원 한명의 정보를 저장하는 메서드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_cafe"
					  + " (num, writer, title, content, viewCount, regdate)"
					  + " VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getViewCount());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//카페 회원 한명의 글을 수정하는 메서드
	public boolean upDate(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					  + " SET title = ?, content = ?"
					  + " WHERE num = ? AND writer = ?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getWriter());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//카페 회원 한명의 글을 삭제하는 메서드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_cafe"
					  + " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//조회수를 출력하는 메서드
	public boolean addViewCount(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				String sql = "UPDATE board_cafe"
						  + " SET viewCount = viewCount + 1"
						  + " WHERE num = ?";
				conn = new DbcpBean().getConn();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rowCount = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null)
						conn.close();
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (rowCount > 0) {
				return true;
			} else {
				return false;
			}
		}
	
	//카페 회원 한명의 정보를 리턴하는 메서드
	public CafeDto getData(int num) {
		CafeDto dto = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection객체를 얻어온다(Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, writer, title, content, viewCount, regdate"
					  + " FROM board_cafe"
					  + " WHERE num = ?";
			ps = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			ps.setInt(1, num);
			//select문 수행하고 결과값 받아오기
			rs = ps.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return dto;
	}
	
	//카페 회원의 정보를 출력하는 메서드
	public List<CafeDto> getList() {
		List<CafeDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CafeDto dto = null;
		try {
			//DbcpBean 객체를 이용해서 Connection객체를 얻어온다(Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, writer, title, content, viewCount, regdate"
					  + " FROM board_cafe";
			ps = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			//select문 수행하고 결과값 받아오기
			rs = ps.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				dto = new CafeDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return list;
	}
	}
