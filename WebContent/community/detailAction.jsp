<%@page import="dto.Comment"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommentDao"%>
<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
int pageNo = Integer.parseInt(request.getParameter("page"));
FreeboardDao dao = FreeboardDao.getInstance();
Freeboard bean = dao.getOne(idx);
dao.readCount(idx);
//bean 객체로 참조하고 있는값은 detailView.jsp 에게 전달하고 브라우저에 출력하도록 합니다.

CommentDao cdao = CommentDao.getInstance();
List<Comment> cmts = cdao.getComments(idx);

request.setAttribute("bean", bean);
request.setAttribute("comments", cmts);
pageContext.forward("detailView.jsp");
%>