<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"/>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row ">
          		 <div class="col-lg-12 ">
          		 <div class=" alert alert-info">
          
          <form action="/AddTreeData" method="post">
          	 <div class="row">
				<div class="col-lg-12">
             <div class="form-group col-xs-4 ">
             <center><label class="control-label " > Country/State/Dist:</label>
            <input type="text" name="name"></input>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  Belongs To: <select path="" name="parentname" id=""  style="width: 300px" class=" form-control">
					<option value="">Select</option>
						<c:forEach items="${listoftree}" var="value">
    						<option value="${value.getName()}">${value.getName()}</option>
    					</c:forEach>
						   
							</select></center>
             </div>
            
             <div class="form-group col-xs-4">
                      
			
			
			 
             </div>
             </div>
            <br>
             <center><button type="submit" value="Submit">Submit</button></center>
            
</form>
 </div>
             </div></div>
</body>
<jsp:include page="footer.jsp"/>
</html>