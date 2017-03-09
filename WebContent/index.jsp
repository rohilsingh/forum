<%@page import="com.Query"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script><title>Insert title here</title>
</head>
<body class="container">
<div class="page-header">
  <h1>Q&A forum <small>The place for all your answers</small></h1>
</div>

<form action="Controller" method="post">
<div class="panel panel-default">
  <div class="panel-body">
    <div class="input-group">
  <span class="input-group-addon">Question:</span>
  <input type="text" class="form-control input-lg" aria-label="Amount (to the nearest dollar)" name="question">
  <span class="input-group-addon">
  	<input type="submit" value="Ask" name="submit" class="btn btn-sm btn-default"/>
  </span>
  </div>
</div>
  
</div>
</form>
<%! int current; %>
<%
if(request.getParameter("q")==null){
	current=1;
}else{
	current=Integer.parseInt(request.getParameter("q"));
}

%>
<%! int j; %>
<%! String ans[]; %>
<% 
ans=Query.answer(current);
%>

<div class="panel panel-primary">
	<div class="panel-heading"><%=Query.question(current) %></div>
  <div class="panel-body">
  
<form action="Controller" method="post" class="well">
  <div class="form-group">
    <label for="exampleInputEmail1">Add your answer:</label>
    <textarea name="answer" type="text" class="form-control" id="exampleInputEmail1" placeholder="Answer" rows="5"></textarea>
  </div>
  <input type="hidden" value="<%=current %>" name="id">
  <input type="submit" value="Submit answer" name="submit" class="btn btn-default"/>
</form>
    
  </div>
  <ul class="list-group">
  
  <% for(j=0;j<ans.length;j++){ %>
    <li class="list-group-item well"><%=ans[j] %></li>
  <% } %>
  </ul>
</div>

<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%! int i; %>
    <%! int qcount=Query.count(); %>
    <% for(i=1;i<=Query.count();i++){ %>
    <li><a href="/forum/index.jsp?q=<%=i%>"><%=i %></a></li>
  	<% } %>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</body>
</html>