<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<script>
</script>
<br/><br/>
<h3 class="text-center">관람권 예약</h3>
<section class="row">
<%
String sql = "select * from exhibition,tickets";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	do{
		String exidx = rs.getString("exidx");
		String extitle = rs.getString("extitle");
		String genre = rs.getString("genre");
		String author = rs.getString("author"); 
		String rating = rs.getString("rating");
		String texts = rs.getString("texts"); 
		String placename = rs.getString("placename");
		int exprice = rs.getInt("exprice");
		String sdate = rs.getString("sdate");
		String edate = rs.getString("edate");
		String docent = rs.getString("docent");
		
		int tkcode = rs.getInt("tkcode");
		String custinfo = rs.getString("custinfo");
		String dates = rs.getString("dates");
		int tprice = rs.getInt("tprice");
		int tcnt = rs.getInt("tcnt");
		String payment = rs.getString("payment");
		
%>
<div class="col-md-12">
<form action="ReservationInsertProc.jsp" method="post">
<table class="table">
<tr class="active">	
	<th colspan="2">전시회명</th>
	<th>장르</th>
	<th>작가</th>
	<th>관람등급</th>
	<th>도슨트</th>
</tr>
<tr>
	<td colspan="2"><p><%=extitle %></p></td>
	<td><p><%=genre %></p></td>
	<td><p><%=author %></p></td>
	<td><p><%=rating %></p></td>
	<td><input type="text" name="docent" value="<%=docent %>" class="inputStyle"/></td>
</tr>
<tr class="active">
	<th colspan="2">전시장소 정보</th>
	<th>관람료</th>
	<th>전시시작일자</th>
	<th>관람일자</th>
	<th>결제수단</th>
</tr>
<tr>
	<td colspan="2"><p><%=placename %></p></td>
	<td><%=exprice %></td>
	<td><input type="date" name="sdate" value="<%=sdate %>" class="inputStyle" disabled/></td>
	<td><input type="date" name="edate" value="<%=edate %>" class="inputStyle" id="chkDate" /></td>
	<td>
		<select name="payment" class="form-control">
		<option value="무통장 입금">무통장 입금</option>
		<option value="신용카드">신용카드</option>
		<option value="계좌이체">계좌이체</option>
		</select>
	</td>
</tr>
<tr>
	<th colspan="1"  class="active">전시회 설명</th>
	<td colspan="3">
		<p><%=texts %></p>
	</td>
	<td colspan="2">
		<input type="submit" value="예약" class="btn btn-block btn-success"/>
	</td>
</tr>
</table>
</form>
</div>
<p class="line">&nbsp;</p>
<%
		} while(rs.next());
	}else{
		out.println("조회실패");}
%>
</section>
<%@ include file="./include/Footer.jsp" %>