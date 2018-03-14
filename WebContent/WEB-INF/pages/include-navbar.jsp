<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<security:authentication var="principal" property="principal" />
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0" >
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
	
	<a class="navbar-brand" href="${pageContext.request.contextPath}/home"><font size="4px">Weather Search</font> </a>
		</div>
	<!-- /.navbar-header -->

	
	<!-- /.navbar-top-links -->


	<!-- Baar -->

	<!-- Side Bar -->

	<div class="navbar-default sidebar small" role="navigation" id="navCollapse">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<!-- <li class="sidebar-search">
				<form action="${pageContext.request.contextPath}/searchAll"  methodParam="GET" role="form">
					<div class="input-group custom-search-form">
						<input name="searchKey" type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> 
				</form>
				</li>
 -->
				
				<li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-home fa-fw"></i> Search</a></li>
				
			
			</ul>
		</div>
		<!-- /.navbar-static-side -->
	</div>

	<!-- END SIDE NAVBAR-->
</nav>
