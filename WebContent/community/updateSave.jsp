<%@page import="dao.FreeboardDao"%>
<%@page import="dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
Freeboard vo = new Freeboard();
vo.setIdx(idx);
vo.setSubject(request.getParameter("subject"));
vo.setName(request.getParameter("name"));
vo.setPassword(request.getParameter("password"));
vo.setContent(request.getParameter("content"));
vo.setIp(request.getRemoteAddr());

FreeboardDao dao = FreeboardDao.getInstance();
dao.update(vo);

response.sendRedirect("detailAction.jsp?idx=" + idx+"&page=1");
%>