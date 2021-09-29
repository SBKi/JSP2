<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.FreeboardDao"%>
<%@page import="dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
String password = request.getParameter("password");
FreeboardDao dao = FreeboardDao.getInstance();
Map<String, Object> map = new HashMap<>();
map.put("idx", idx);
map.put("password", password);

int n = dao.delete(map);
String del = null;
String href = null;
String message = null;

if (n == 1) {
	message = "삭제 완료 되었습니다.";
	href = "listAction.jsp";
} else {
	message = "비밀번호가 다릅니다.";
	href = "detailAction.jsp?page=1&idx=" + idx;
}
// response.sendRedirect("listAction.jsp?del=" + del);

out.print("<script>");
out.print("alert('" + message + "');");
out.print("location.href='" + href + "';");
out.print("");
out.print("</script>");
%>