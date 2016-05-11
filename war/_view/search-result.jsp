<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Search</title>
		<link rel="stylesheet" type="text/css" href="_view/mainstyle.css">
	</head>

	<body>
		<table>
			<tr>
				<td>
					<form action="${pageContext.servletContext.contextPath}/home" method="post">
							<input type="image" src="res/logo.gif.png" alt="YCP Logo" name="buttonPress" value="home"/>
						</form>
					
					<form action="${pageContext.servletContext.contextPath}/search" method="post">
						<div>
							<input type="text" name="search" placeholder="Search by title, author, ISBN...">
						</div>
						
						<div>
						<table>
							<tr>
								<td>
  									<input name="bybutton" type="submit" value="Search by Title" />
								</td>
								<td>
  									<input name="bybutton" type="submit" value="Search by Author" />
								</td>
								<td>
									<input name="bybutton" type="submit" value="Search by ISBN" />
								</td>
							</tr>
						</table>
						</div>
						
					</form>
					
					<div>
					<table>
						<tr>
							<td>Pick</td>
							<td class="bookColHeading">Title</td>
       						<td class="isbnColHeading">ISBN</td>
							<td class="nameColHeading">Last Name</td>
       						<td class="nameColHeading">First Name</td>
			    		</tr>
			    		<form action="${pageContext.servletContext.contextPath}/buy-book" method="GET">
			    		<c:forEach items="${books}" var="book">
			        		<tr class="bookRow">
			        			<td><input type="checkbox" name="r${book.title}" value="${book.title}" ></td>
			            		<td class="bookCol">${book.title}</td>
			            		<td class="isbnCol">${book.isbn}</td>
			            		<td class="nameCol">${book.authorslastname}</td>
			            		<td class="nameCol">${book.authorsfirstname}</td>			            
			        		</tr>
			    		</c:forEach> 
			    		<tr><td>
			    			<input type="submit" name="buttonPress" value="Buy">
			    		</td></tr>
			    		
			    		</form>
			    		</table>
					</div>
				</td>
				
				<td>
					<c:choose>
				<c:when test="${loggedin}">
					<div> 
						<table>
							<tr>
								<td>Username: ${account.username}</td>
							</tr>
							<tr>
								<td>Name: ${account.name}</td>
							</tr>
							<tr>
								<td>Email: ${account.email}</td>
							</tr>
							<tr>
								<td>Phone Number: ${account.phoneNumber}</td>
							</tr>
							<tr>
								<td>Number of Books for Sale: ${account.numberOfBooksForSale}</td>
							</tr>
							<tr>
								<table>
								<tr>
								<td>  
									<form action="${pageContext.servletContext.contextPath}/enter-book" method = "get">
										<input name="buttonPress" type="submit" value="Sell A Book">
									</form>
								</td>
								<td>
									<form action="${pageContext.servletContext.contextPath}/update-account" method = "get">
										<input name="buttonPress" type="submit" value="Edit Account">
									</form>
								</td>
								<td>
									<form action="${pageContext.servletContext.contextPath}/login" method = "post">
										<input name="buttonPress" type="submit" value="Logout">
									</form>
								</td>
								</tr>
								</table>
							</tr>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<form action="${pageContext.servletContext.contextPath}/create-login" method="get">
						<div>Username: <input name="Username" type="text" placeholder="Username"/> </div>
						<div>Password: <input name="Password" type="text" placeholder="Password"/> </div>
  						<div> 
  							<input name="buttonPress" type="submit" value="Login" />
  							<input name="buttonPress" type="submit" value="Create" />
  						</div>
					</form>
				</c:otherwise>
				</c:choose>		
				</td>
			</tr>
		</table>
	</body>
</html>