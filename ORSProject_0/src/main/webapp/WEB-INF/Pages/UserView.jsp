<%@page import="java.util.HashMap"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
$(function() {
	$("#date").datepicker({
		/*  beforeShowDay:DisableSunday, */
		changeMonth : true,
		changeYear : true,
		yearRange : '1980:2001',
		/* dateFormat : 'dd-mm-yy',
 */	    /*minDate:0 */
	});
});
</script>
<style type="text/css">
 body {
	background-image: url("/ORSProject_0/resources/img/a11.png");
background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
} 
.card{
   background-color:#607d8b91!important;
  
}

</style>

</head>
<body>
	<sf:form modelAttribute="form" method="post">
		<div class="container-fluid" align="center" style="padding-right: 10%">

			<aside class="col-sm-4">

				<!-- <div class="card shadow" align="center" style="opacity: 0.8;"> -->
					<div class="card">
					<article class="card-body">



						<c:choose>
<c:when test="${form.id==0}"><h4 class="card-title text-center mb-4 mt-1" style="color: #fff;"><u><s:message code="label.adduser" /></u></h4></c:when>
<c:otherwise>
<h4 class="card-title text-center mb-4 mt-1" style="color: #fff;"><u><s:message code="label.updateuser"></s:message></u></h4>
 </c:otherwise>
</c:choose> 

						<hr color="white">

						<c:if test="${success != null}">
							<div class="alert alert-success alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<b>${success}</b>
							</div>
						</c:if>

						<c:if test="${error != null}">
							<div class="alert alert-danger alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<b>${error}</b>
							</div>
						</c:if>

						<sf:hidden path="id" />
						<sf:hidden path="createdBy" />
						<sf:hidden path="modifiedBy" />
						<sf:hidden path="createdDatetime" />
						<sf:hidden path="modifiedDatetime" />


						<div class="form-group">

							<div align="left" style="color: #fff;"
								for="validationDefault02">
								<s:message code="label.firstName" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i>
									</span>
								</div>

							<sf:input path="firstName" class="form-control"
									placeholder="${enterfirstName}"/>


							</div>
							<div align="left">
								<font style="color: red"><sf:errors path="firstName" /></font>
							</div>

						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"
								for="validationDefault02">
								<s:message code="label.lastName" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="fas fa-user"></i></i>
									</span>
								</div>


								<sf:label path="lastName">

									<c:if test="${not empty lastNameErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tlastName')"
											onmouseout="hideError('tlastName')"></i>
									</c:if>
								</sf:label>
								<sf:input path="lastName" class="form-control"
									placeholder="${enterLastName}" />


							</div>
							<div align="left">
								<font style="color: red"><sf:errors path="lastName" /></font>
							</div>

						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"
								for="validationDefault02">
								<s:message code="label.email" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-envelope"></i>
									</span>
								</div>


								<sf:label path="login">
									<c:if test="${not empty loginErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tlogin')"
											onmouseout="hideError('tlogin')"></i>
									</c:if>
								</sf:label>
								<sf:input path="login" class="form-control"
									placeholder="${enteremail}" />

							</div>
							<div align="left">
								<font style="color: red"><sf:errors path="login" /> </font>
							</div>

						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"validationDefault02">
								<s:message code="label.password" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="fa fa-lock"></i>
									</span>
								</div>

								<sf:label path="password">

									<c:if test="${not empty passwordErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tpassword')"
											onmouseout="hideError('tpassword')"></i>
									</c:if>
								</sf:label>
								<sf:input type="password" path="password" class="form-control"
									placeholder="${enterpassword}" />



							</div>

							<div align="left">
								<font style="color: red"><sf:errors path="password" /></font>
							</div>
						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"validationDefault02">
								<s:message code="label.confirmpassword" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="fa fa-lock"></i>
									</span>
								</div>

								<sf:label path="confirmPassword">
									<c:if test="${not empty confirmPasswordErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tconfirmPassword')"
											onmouseout="hideError('tconfirmPassword')"></i>
									</c:if>
								</sf:label>
								<sf:input type="password" path="confirmPassword"
									class="form-control" placeholder="${enterconPassword}" />

							</div>

							<div align="left">
								<font style="color: red"><sf:errors
										path="confirmPassword" /> </font>
							</div>
						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"validationDefault02">
								<s:message code="label.role" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="fa fa-lock"></i>
									</span>
								</div>

								<sf:label path="roleId">
									<c:if test="${not empty roleIdErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('troleId')"
											onmouseout="hideError('troleId')"></i>
									</c:if>
								</sf:label>
								<sf:select path="roleId" class="form-control">
									<sf:option value="0" label="${enterRoleName}">
										<s:message code="label.selectrole"></s:message>
									</sf:option>
									<sf:options items="${roleList}" itemValue="id" itemLabel="name"></sf:options>
								</sf:select>
								



							</div>

							<div align="left">
								<font style="color: red"><sf:errors path="roleId" /> </font>
							</div>
						</div>




						<div class="form-group">

							<div align="left" style="color: #fff;"
								for="validationDefault02">
								<s:message code="label.gender" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class='fas fa-venus-double'></i></span>
								</div>


								<sf:label path="gender">
									<c:if test="${not empty genderErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tgender')"
											onmouseout="hideError('tgender')"></i>
									</c:if>
								</sf:label>
								<sf:select path="gender" class="form-control">

									<sf:option value="">
										<s:message code="label.selectgender"></s:message>
									</sf:option>
									<sf:options items="${genderList}" />


								</sf:select>




							</div>
							<div align="left">
								<font style="color: red"><sf:errors path="gender" /> </font>
							</div>

						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"
								for="validationDefault02">
								<s:message code="label.dob" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class='fas fa-calendar-alt'></i></span>
								</div>

								<sf:label path="dob">

									<c:if test="${not empty dobErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tdob')"
											onmouseout="hideError('tdob')"></i>
									</c:if>
								</sf:label>
								<sf:input readonly="readonly" path="dob" class="form-control"
									id="date" placeholder="${enterdob}" autocomplete="off" />


							</div>
							<div align="left">
								<font style="color: red"><sf:errors path="dob" /> </font>
							</div>

						</div>

						<div class="form-group">

							<div align="left" style="color: #fff;"
								for="validationDefault02">
								<s:message code="label.mobileNo" />
								<span style="color: red">*</span>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class='fas fa-mobile-alt'></i></span>
								</div>

								<sf:label path="mobileNo">

									<c:if test="${not empty mobileNoErrors}">
										<i class="fa fa-exclamation-circle text-danger"
											onmouseover="showError('tmobileNo')"
											onmouseout="hideError('tmobileNo')"></i>
									</c:if>
								</sf:label>
								<sf:input path="mobileNo" class="form-control"
									placeholder="${enterMobile}" />



							</div>
							<div align="left">
								<font style="color: red"><sf:errors path="mobileNo" />
								</font>
							</div>

						</div>
						<c:choose>
							<c:when test="${form.id==0}">
								<button type="submit" name="operation"
									style="float: left; width: 70px; margin-left: 50px;"
									value="save" class="btn btn-info btn-block button2 msgBtn">
									<s:message code="label.save" />
								</button>


								<button type="submit" name="operation"
									style="width: 70px; margin-left: 80px;" value="reset"
									class="btn btn-warning btn-block button2">
									<s:message code="label.reset" />
								</button>
							</c:when>
							<c:otherwise>
								<button type="submit" name="operation"
									style="float: left; width: 70px; margin-left: 50px;"
									value="save" class="btn btn-info btn-block button2 msgBtn">
									<s:message code="label.update" />
								</button>


								<button type="submit" name="operation"
									style="width: 70px; margin-left: 80px;" value="Cancel"
									class="btn btn-warning btn-block button2">
								 <s:message code="label.cancel" />
				 				</button>
							</c:otherwise>
						</c:choose>



					</article>
				</div>

			</aside>

		</div>

	

	</sf:form>
	<br><br><br>
</body>

</html>