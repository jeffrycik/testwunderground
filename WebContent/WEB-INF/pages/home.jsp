<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<style>

.page-wrapper {
  padding: 0 15px;
  min-height: 568px;
  background-color: white;
}
@media (min-width: 768px) {
  .page-wrapper {
    position: inherit;
    margin: 0 0 0 250px;
    padding: 0 30px;
    border-left: 1px solid #e7e7e7;
  }
}

</style>
<jsp:include page="include-header.jsp" />
<link
	href="${pageContext.request.contextPath}/static/zoom/lightgallery.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/static/zoom/jquery.min.js"></script>



</head>

<body>

	<div id="wrapper">
	
	
	<jsp:include page="include-navbar.jsp" />
		
		
		
		<!-- Page Content -->
		
		<div class="page-wrapper" id="isiBody">
			
			<div class="row">
                <div class="col-lg-12"><br><br>
                    <h1 class="page-header">Search</h1>
             
				
				
			
			<div class="sidebar-search"> 
			 	<form:form action="search" modelAttribute="WeatherForm" methodParam="POST" role="form">

					<div class="input-group custom-search-form">
                                <span class="input-group-btn">
                                
                                
                                <form:input path="city" class="form-control"  placeholder="City"/>
                                <br>
								<form:input path="country" class="form-control"  placeholder="Country"/>
								<br>
								<label class="form-control">Weather: </label>
								<form:input path="weather" class="form-control"  placeholder="weather"/>
								

                                
                                <button class="btn btn-default" type="submit" id="searchButton">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>			   
					
					
					</div>
				</form:form>
			 </div>
			 </div>
			 </div>
			
		</div>
		<!-- /#page-wrapper -->

	</div>

	<!-- /#wrapper -->

	<jsp:include page="include-js.jsp" />
	
	
	</body>

</html>
