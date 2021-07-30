<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>
<%@ include file="./include/incLogin.jsp"%>
<br/><br/>
<h3>전시관 정보 수정</h3>
<%
	String code = request.getParameter("CodeChk");
	String codes = "";
	String placename ="";
	String rlocation ="";
	String contactno ="";
	String times ="";
	String holiday ="";

	// 전역 변수: 설정해서 전시관 관련 정보 직어줄 변수 생성.
String sql = "select * from explace where codes = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, code);
rs = pstmt.executeQuery();

if(rs.next()){
	do{
		placename = rs.getString("placename");
		rlocation = rs.getString("location");
		contactno = rs.getString("contactno");
		times = rs.getString("times");
		holiday = rs.getString("holiday");
	%>
<section class="row">
<div class="col-md-12">
<form action="ExplaceModiProc.jsp" method="post">
	<table class="table table-striped table-condensed">
		<tr>
			<td>전시관 코드(수정불가)</td>
			<td>
			<p class="text-danger"><%=code %></p>
			<input type="hidden" class="form-control" value="<%=code %>" disabled/>
			</td>
		</tr>
		<tr>	
			<td>전시관이름</td>
			<td><input type="text" class="form-control" value="<%=placename %>" name="placename"/></td>
		</tr>
		<tr>
			<td>위치(수정불가)</td>
			<td>
			<input type="text" class="form-control" value="<%=rlocation%>" disabled />
			<input type="hidden" class="form-control" value="<%=rlocation%>"/>
			</td>
		</tr>		
		<tr>
			<td>연락처</td>
			<td><input type="text" class="form-control" value="<%=contactno %>" name="contactno"/></td>
		</tr>
		<tr>
			<td>개관시간</td>
			<td>
				<h4 class="text-primary">현재운영 시간 : <%out.println(times.substring(1,3) + " 시 ~" +  times.substring(4,6) + "까지");%></h4>
				<div class="form-group form-inline">
				OPEN : <input type="text" class="form-inline form-control" value="<%=times.substring(1, 3)%>" name="n1"/>
				&nbsp;&nbsp;&nbsp;
				CLOSE : <input type="text" class="form-inline form-control" value="<%=times.substring(4, 6)%>" name="n2"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>휴관일</td>
			<td>
			<input type="text" class="form-control" value="<%=holiday %>" name="holiday" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="submit" class="form-inline form-control btn btn-info" value="수정"/>
			</th>
		</tr>
	</table>
</form>
</div>
</section>	
	<%}while(rs.next());
}else{out.println("조회 실패");}

%>
<%@ include file="./include/Footer.jsp"%>