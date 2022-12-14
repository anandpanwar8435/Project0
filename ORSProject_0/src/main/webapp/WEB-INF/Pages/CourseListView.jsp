<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 body {
	background-image: url("/ORSProject_0/resources/img/a11.png");
background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}  
</style>

</head>
<body>

<c:set value="${findList}" var="findtotal"></c:set>
<c:set value="${list}" var="total"></c:set>

<div class="row d-flex justify-content-center h-100">
	<%-- <div id="menuToggle">
		<s:message code="label.menu"></s:message>
		<i class="fa fa-bars"></i>
	</div> --%>
	<div class="col-lg-12 col-sm-12 ml-auto mr-auto">
		<div class="card card-table" style="background-color: #f8f9fa80 ;">
			<h3 class="w-100 text-center under-over-line" style="color: #fff;">
				<u><s:message code="label.courselist"></s:message></u>
			</h3>
			<hr color="white">
						<!-- Error -->
				<c:if test="${error != null}">
				<div class="container" align="center">
					<div class="col-md-4 alert alert-danger alert-with-icon"
						data-notify="container">
						<div class="container">
							<div class="alert-wrapper">
								<button type="button" class="close" data-dismiss="alert">&times;</button>		<div class="message">
									<i class="nc-icon nc-bell-55"></i>${error}
								</div>
							</div>
						</div>
					</div>
					</div>
				</c:if>
				<!-- //Error -->
				<!-- Success -->
				<c:if test="${success != null}">
				<div class="container" align="center">
					<div class="col-md-4 alert alert-success alert-with-icon"
						data-notify="container">
						<div class="container">
							<div class="alert-wrapper">
								<button type="button" class="close" data-dismiss="alert">&times;</button>	<div class="message">
									<i class="nc-icon nc-bell-55"></i>${success}
								</div>
							</div>
						</div>
					</div>
					</div>
				</c:if>
				<!-- //Success -->
				<sf:form class="register-form" method="post" modelAttribute="form">
				<c:set value="${((form.pageNo-1)*form.pageSize)+1}" var="index"></c:set>
				<sf:hidden path="pageNo" />
				<sf:hidden path="pageSize" />
				<c:if test="${!empty list}">
				<div class="row p-2 d-flex justify-content-center">
					<div class="col-lg-3">
						<sf:input path="name" cssClass="form-control border-left-right"
							placeholder="${enterName}"/>
					</div>
					
					<div class="col-lg-3">
						<div class="row">
							<div class="col-6">
								<button type="submit"
									class="btn btn-info btn-block btn-round w-100"  name="operation"
									name="operation" value="Search">
									<b>	<s:message code="label.search" /></b>
									</button>
							</div>
							<div class="col-6">
								<button type="submit"
									class="btn btn-warning btn-block btn-round w-100"  name="operation"
									name="operation" value="Reset">
									<b>	<s:message code="label.reset" /></b>
									</button>
							</div>
						</div>
					</div>
				</div>
				
					<hr color="white">
				
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12 table-responsive">
						<table  border="2" width="100%"  cellpadding=8px cellspacing=".3"
								class="table table-hover table-striped border border-secondary">
								<thead style="background-color: #ff9800a3;">
								<tr>
									<th scope="col" class="text-center text-white"><input
										type="checkbox" id="select_all" /></th>
									<th scope="col" class="text-center" style="color: white;">S.No.</th>
									<th scope="col" class="text-center" style="color: white;"><s:message code="label.name"/></th>
									<th scope="col" class="text-center" style="color: white;"><s:message code="label.duration"/></th>
									<th scope="col" class="text-center" style="color: white;"><s:message code="label.description"/></th>
									<th scope="col" class="text-center" style="color: white;"><s:message code="label.edit"/></th>
								</tr>
							</thead>
							<tbody style="background-color: white;">
							<c:forEach items="${list}" var="course" varStatus="ct">
								<tr>
									<td class="text-center">
										<input class="checkbox" name="chk_1" type="checkbox" value="${course.id}">
									</td>
									<td class="text-center">
										<c:out value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" />
										<c:set var="index" value="${(form.pageSize * (form.pageNo-1))+ct.index+1}" />
									</td>
									 <td class="text-center">${course.name}</td>
							 		<td class="text-center">${course.duration}</td>
									<td class="text-center">${course.description}</td>
									<td class="text-center">
										<c:url var="editUrl" value="/ctl/Course/AddCourse?id=" />
              							<a class="btn btn-outline-warning btn-block btn-round w-100" style="border-color: #8A2BE2; color: #8A2BE2;" href="${editUrl}${course.id}"><i class="fa fa-edit" aria-hidden="true">
              							</i></a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
					<hr color="white">
				
				<div class="row d-flex justify-content-center">
					<div class="col-lg-1 col-3">
						<c:choose>
							<c:when test="${form.pageNo > 1}">
								<button type="submit" class="btn btn-outline-primary btn-block btn-round w-100"  name="operation" name="operation" value="Previous">
									<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
								</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-outline-secondary btn-block btn-round w-100"  name="operation" name="operation" value="Previous" disabled>
									<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
								</button>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-lg-1 col-3">
						<button type="submit" class="btn btn-outline-success btn-block btn-round w-100"  name="operation" name="operation" value="New"><i class="fa fa-plus" aria-hidden="true"></i></button>
					</div>
					<div class="col-lg-1 col-3">
						<button type="submit" class="btn btn-outline-danger btn-block btn-round w-100"  name="operation" name="operation" value="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>
					</div>
					<div class="col-lg-1 col-3">
					<c:choose>
						<c:when test="${nextlistsize != 0}">
							<button type="submit" class="btn btn-outline-primary btn-block btn-round w-100" name="operation" name="operation" value="Next">
								<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="btn btn-outline-secondary btn-block btn-round w-100"  name="operation" name="operation" value="Next" disabled>
								<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
							</button>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				</c:if>
				<c:if test="${empty list}">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-2 col-6">
							<button type="submit" class="btn btn-outline-warning btn-block btn-round w-100"  name="operation" name="operation" value="Back">
								<i class="fa fa-reply" aria-hidden="true"></i><s:message code="label.back"></s:message>
							</button>
						</div>
					</div>
				</c:if>
			</sf:form>
		</div>
	</div>
</div>
<br><br><br><br>
</body>
</html>