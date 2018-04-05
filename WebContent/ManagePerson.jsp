<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="app.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Управление данными о человеке</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<%
	HashMap<String,String> jsp_parameters = new HashMap<String,String>();
	Person person = new Person();
	String user_message = "";

	if (request.getAttribute("jsp_parameters") != null)
	{
		jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
	}

	if (request.getAttribute("person") != null)
	{
		person=(Person)request.getAttribute("person");
	}
	
	user_message = jsp_parameters.get("current_action_result_label");
%>

<form action="<%=request.getContextPath()%>/" method="post">
<input type="hidden" name="id" value="<%=person.getId()%>"/>
<table class="table table-bordered">
    <%
    if ((user_message != null)&&(!user_message.equals("")))
    {
    %>
    <tr>
     	<td colspan="2" align="center"><span><%=user_message%></span></td>
    </tr>
    <%
    }
    %>
    <tr>
        <td colspan="2" align="center">Информация о человеке</td>
    </tr>
   
    <tr>
        <td>Фамилия:</td>
        <td>
			<div class="form-group">
			    <input type="text" class="form-control" name="surname" value="<%=person.getSurname()%>" required placeholder="Петров" />
			</div>
		</td>      
    </tr>
    <tr>
        <td>Имя:</td>
		<td>
			<div class="form-group">
			    <input type="text" class="form-control" name="name" value="<%=person.getName()%>" required placeholder="Пётр" />
			</div>
			</td>        
    </tr>
    <tr>
        <td>Отчество:</td>
        <td>
        	<div class="form-group">
			    <input type="text" class="form-control" name="middlename" value="<%=person.getMiddlename()%>" required placeholder="Петрович" />
			</div>
        </td>
    </tr>
    <%
    if (jsp_parameters.get("current_action").equals("edit"))
    {
    %>
	    <tr>
	        <td>Телефоны:</td>
	        <td>
	         <%
	         Iterator it = person.getPhones().entrySet().iterator();
	         while (it.hasNext()) {	        
	        	   Entry phone = (Entry) it.next();
	        	   out.write(String.valueOf(phone.getValue())); 
	         	%>
	         	 <a href="<%=request.getContextPath()%>/?action=editPhone&id=<%=person.getId()%>&idPhone=<%=phone.getKey()%>"><button type="button" class="btn btn-outline-warning btn-sm">Редактировать</button></a>
	         	 <a href="<%=request.getContextPath()%>/?action=deletePhone&id=<%=person.getId()%>&idPhone=<%=phone.getKey()%>"><button type="button" class="btn btn-outline-danger btn-sm">Удалить</button></a>
	         	 <br />
	           <%
	           }
	           %>
    	       <a href="<%=request.getContextPath()%>/?action=addPhone&id=<%=person.getId()%>"><button type="button" class="btn btn-success btn-sm">Добавить</button></a>
	        </td>
	    </tr>
	<%
    }
    %>    
    <tr>
        <td colspan="2" align="center">
         <button type="submit" class="btn btn-success" name="<%=jsp_parameters.get("next_action")%>"><%=jsp_parameters.get("next_action_label")%></button>
         <a href="<%=request.getContextPath()%>"><button type="button" class="btn btn-outline-primary">Вернуться к списку</button></a>
        </td>
    </tr> 
 </table>
 </form>
 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>