<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="app.Phonebook"%>
<%@ page import="app.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Список людей</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<%
	String user_message = "";
	HashMap<String,String> jsp_parameters = new HashMap<String,String>();
	Phonebook phonebook = (Phonebook)request.getAttribute("phonebook");
	if(phonebook == null){
		phonebook = Phonebook.getInstance();
	}
	if (request.getAttribute("jsp_parameters") != null)
	{
		jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
	}
	
	user_message = jsp_parameters.get("current_action_result_label");
%>
<br />
<table class="table table-striped">
    
    <%
    if ((user_message != null)&&(!user_message.equals("")))
    {
    %>
    <tr>
     	<td colspan="6" align="center"><%=user_message%></td>
    </tr>
    <%
    }
    %>
    
    <thead class="table-light">
	    <tr>
	        <td><b>Фамилия</b></td>
	        <td><b>Имя</b></td>
	        <td><b>Отчество</b></td>
	        <td><b>Телефон(ы)</b></td>
	        <td>&nbsp;</td>
	    </tr>
    </thead>
     <tbody>
        <%
        for (Person person : phonebook.getContents().values()) {
            
        %>
          <tr>
           <td><%=person.getSurname()%></td>
           <td><%=person.getName()%></td>
           <td><%=person.getMiddlename()%></td>
           <td>
            <%
             for(String phone : person.getPhones().values())
              {
            %>
             <%=phone%><br />
            <%
              }
            %>
           </td>
           <td>
           		<a href="<%=request.getContextPath()%>/?action=edit&id=<%=person.getId()%>"><button type="button" class="btn btn-outline-primary">Редактировать</button></a>
           		<a href="<%=request.getContextPath()%>/?action=delete&id=<%=person.getId()%>"><button type="button" class="btn btn-outline-danger">Удалить</button></a>
           </td>
          </tr>   
           <%
          }
        %>  
       </tbody>
       <tfoot>
       	<tr>
     		<td colspan="6" align="center">
     			<a href="<%=request.getContextPath()%>/?action=add">
     				<button type="button" class="btn btn-success">Добавить запись</button>
     			</a>
     		</td>
   		</tr>
       </tfoot>     
    
 </table>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>