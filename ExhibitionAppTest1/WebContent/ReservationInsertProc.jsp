<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<%
String custinfo = request.getParameter("custinfo");
String dates = request.getParameter("dates");
String tprice  = request.getParameter("tprice");
String tcnt  = request.getParameter("tcnt");
String payment = request.getParameter("payment");

String sql1 = "insert into tickets value(null,?,?,now(),?,?,?)";
pstmt = conn.prepareStatement(sql1);
pstmt.setString(1,custinfo);
pstmt.setString(2,dates);
pstmt.setString(3,tprice);
pstmt.setString(4,tcnt);
pstmt.setString(5,payment);


int rs1 = pstmt.executeUpdate();
if(rs1 >0 ){response.sendRedirect("Ticket.jsp");}
%>