<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>

    <title>Employee Details</title>
    <jsp:include page="mainpage.jsp"/>
    
         <section id="main-content">
				<div class="content-title">
                    <h3 class="main-title"> </h3>
                    <span> </span>
                </div>
               
            <div class="tabbable-panel">
          
                        
               
               <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <div align="center">
            <h1>Employee Details</h1>
            </div>



<div class="panel panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered"
							id="datatable">
<thead>


<th>Year</th>
<th>Employee Required</th>
<th>Employee</th>

<th></th>



</thead>
<tbody>

<c:forEach items="${listemployees}" var="employees">
  <tr>
  
   <td>${employees.getYear()}</td>
   <td>${employees.getEmployeeRequired()}</td>  
   <td>${employees.getEmployee()}</td> 
   <td>
 
  </tr>
    </c:forEach>

										
     </tbody>
     </table>
     </div>
     </div>
     </div>

     <br />
     <br />
     <br />

     </div>
       <div class="clearfix"></div>
               
            
            <!-- /page content -->


<script type="text/javascript"></script>
</section>   

 <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jqueryTables.min.js"></script>
    <script src="bootstrap/js/jqueryTables.min.new.js"></script>    
    <script src="bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="bootstrap/js/1.11.2.jquery.min.js"></script>
    <script src="bootstrap/js/hoe.js"></script>
    <jsp:include page="footer.jsp"/>
    
		
</body>

</html>