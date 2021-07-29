<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%
// 현재 파일명 : ExhibitionModiProc.jsp

String exidx = request.getParameter("exidx");
String extitle = request.getParameter("extitle");
String genre = request.getParameter("genre");
String author = request.getParameter("author");
String rating = request.getParameter("rating");
String texts = request.getParameter("texts");
String placename = request.getParameter("placename");
int exprice = Integer.parseInt(request.getParameter("exprice"));
String edate = request.getParameter("edate");
String sdate = request.getParameter("sdate");
String docent = request.getParameter("docent");

String sql = "update exhibition set";
sql+=" extitle =?, genre = ?, author = ?, rating = ?, texts = ?, placename = ?, exprice =?, edate=?,sdate=?,docent=?";
sql+=" where exidx = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, extitle);
pstmt.setString(2, genre);
pstmt.setString(3, author);
pstmt.setString(4, rating);
pstmt.setString(5, texts);
pstmt.setString(6, placename);
pstmt.setInt(7, exprice);
pstmt.setString(8, edate);
pstmt.setString(9, sdate);
pstmt.setString(10, docent);
pstmt.setString(11, exidx);

int rs1 = pstmt.executeUpdate();
if(rs1 > 0){
	out.println("<script>alert('수정 사항을 반영 하였습니다'); location.replace('Exhibition.jsp');</script>");
}


%>
