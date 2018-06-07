<%@page import="model.Classed"%>
<%@page import="dao.ClassedDAO"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.Subject"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Map<String, Subject> mapSubject = SubjectDAO.mapSubject;
%>
<%
	Map<String, Classed> mapClass = ClassedDAO.mapClassed;
%>

<form method="post" name="search" class="form-inline"
	action="search.jsp">
	<div class="search_content">
		<div class="search_input">
			<div class="row">
				<div class="form-group">
					<label for="sel1">Chọn lớp:</label> <select class="form-control"
						id="sel1" name="class">
						<option value="0" selected="selected">Tất cả</option>
						<%
							for (Classed c : mapClass.values()) {
						%>
						<option value="<%=c.getClassID()%>"><%=c.getClassName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="form-group">
					<label for="sel1">Chọn môn:</label> <select class="form-control"
						id="sel1" name="subject">
						<option value="0" selected="selected">Tất cả</option>
						<%
							for (Subject sb : mapSubject.values()) {
						%>
						<option value="<%=sb.getSubjectID()%>"><%=sb.getSubjectName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="div_search">
					<input type="submit" class="btn_search btn btn-primary"
						value="Tìm kiếm" />
				</div>
			</div>
		</div>

	</div>
</form>