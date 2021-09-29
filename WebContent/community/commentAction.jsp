<%@page import="dao.CommentDao"%>
<%@page import="dto.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int mref;
CommentDao dao = CommentDao.getInstance();
if (request.getParameter("del") != null) {
	int cmtidx = Integer.parseInt(request.getParameter("cmtidx"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	dao.delete(cmtidx);
	mref = idx;

} else {
	request.setCharacterEncoding("UTF-8");

	mref = Integer.parseInt(request.getParameter("mref"));
	Comment vo = new Comment();
	vo.setName(request.getParameter("name"));
	vo.setMref(mref);
	vo.setPassword(request.getParameter("password"));
	vo.setContent(request.getParameter("content"));
	vo.setIp(request.getRemoteAddr());

	dao.insert(vo);
	//dao.updateCommnetCnt(mref);

}
dao.updateCountAll(mref);
response.sendRedirect("detailAction.jsp?page=1&idx=" + mref);
%>