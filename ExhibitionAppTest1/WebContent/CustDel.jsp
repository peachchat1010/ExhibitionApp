<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include/Header.jsp" %>
<%
String mocustid = request.getParameter("UIDchk");
String sql = "delete from customers where custid = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, mocustid);

int rs2 = pstmt.executeUpdate();

if(rs2 > 0){
	out.println("<script>alert('"+ mocustid +" 님을 탈퇴 처리 하였습니다.'); location.replace('Exhibition.jsp');</script>");
}
%>