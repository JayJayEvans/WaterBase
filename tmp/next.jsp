
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;
		charset=UTF-8">
		<link href="style.css" rel="stylesheet" type="text/css"/>
		<title>Home Page</title>
	</head>
	<body>
		<sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
				    url="jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project"
	user="evansj" password="suiteswellzwfate1"/>
		<sql:query dataSource="${dbSource}" var="dbResult">
		SELECT * FROM register;
		</sql:query>

		<div id="myform">
			<form action="insert.jsp" method="post">
				<h1>New Address</h1>
				<p class="mystyle">Add new address details</p>
				<label>Username <span>Insert chosen username</span> </label>
				<input type="text" name="user"/>
				
				<label>Password <span>Insert password</span> </label>
				<input type="password" name = "password"/>
				
				<label>First Name <span>Enter your first name</span> </label>
				<input type="text" name="fname"/>
				
				<label>Last Name <span>Enter Your Last name</span> </label>
				<input type="text" name="lname"/>
				
				<label>Phone <span>Enter phone number</span></label>
				<input type="text" name="phone"/>
				
				<label> Email <span>Enter email address</span></label>
				<input type="text" name="email"/>
				
				<input type="submit" value="Add New"/>
			</form>
		</div>

		<br/>
		<font color="blue">
			<c:if test="${not empty param.msg}">
			<c:out value="${param.msg}" />
			</c:if>
		</font>
		<br/>
		<form>
			<div class="CSSTableGenerator" >
				<table>
					<tr>
						<td>Username</td>
						<td>Password</td>
						<td>First Name</td>
						<td>Last Name</td>
						<td>Phone</td>
						<td>Email</td>
						<td colspan="2"></td>
					</tr>
					<c:forEach var="row" items="${dbResult.rows}">
					<tr>
						<td><c:out value="${row.User}"/></td>
						<td><c:out value="${row.Password}"/></td>
						<td><c:out value="${row.FirstName}"/></td>
						<td><c:out value="${row.LastName}"/></td>
						<td><c:out value="${row.PhoneNumber}"/></td>
						<td><c:out value="${row.EmailAddress}"/></td>
						<td>
							<a href="updateForm.jsp?id=<c:out
							value="${row.id}"/>">Update</a>
						</td>
						<td><a href="delete.jsp?id=<c:out
						value="${row.id}"/>">Delete</a></td>
					</tr>
								</c:forEach>
				</table>
			</div>
		</form>
		<br/>
	</body>
</html>
