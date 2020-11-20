<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>

    <title>Employee Strength</title>
    <jsp:include page="mainpage.jsp"/>
   
         <section id="main-content">
				<div class="content-title">
                    <h3 class="main-title"> </h3>
                    <span> </span>
                </div>
               
               
             <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <div align="center">
            <h1>Employee Strength</h1>
            </div>



<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered"
							id="datatable">
		
   <div class="form-body">
           <div class="formbodycontent">
              <div class="form-group">
              <form method="post" action="./addemployee.html" >
              
                   <div class="row">
                       <label for="year" class="col-md-2 col-sm-2"><strong> Year </strong></label>
                             <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="year" placeholder="Enter Year" name="year">
                             </div>
				   </div>
	               <br>
											  
			      <div class="row">
					   <label for="employeeRequired" class="col-sm-2 col-md-2"> <strong> Employee Required </strong></label>
                             <div class="col-sm-4 col-md-4">
                                   <input type="text" class="form-control" id="employeeRequired" placeholder="Enter no.of employee required" name="employeeRequired">
                             </div>
		           </div>
		           <br>
		           
		           
		            <div class="row">
					   <label for="employee" class="col-sm-2 col-md-2"> <strong> Employee</strong></label>
                             <div class="col-sm-4 col-md-4">
                                   <input type="text" class="form-control" id="employee" placeholder="Enter no.of employee working" name="employee">
                             </div>
		           </div>
		           <br>
		          
		           
		          <div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				  </div>
				</div>
 </form>
		           </div>
		           </div>
		           </div>
		           


</tbody>
</table>
</div>
</div>
</div>


<meta name="viewport" content="width=device-width, initial-scale=1">
               
            </section>   

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="bootstrap/js/1.11.2.jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/hoe.js"></script>
    <script src="bootstrap/js/jqueryTables.min.js"></script>
    <script src="bootstrap/js/jqueryTables.min.new.js"></script>
    <jsp:include page="footer.jsp"/>

<script type="text/javascript">

$(function () {
    $('#datetimepicker1').datepicker();
});




$(function () {
   
            $('#dashboard').addClass('active');
});

</script>
</body>

</html>