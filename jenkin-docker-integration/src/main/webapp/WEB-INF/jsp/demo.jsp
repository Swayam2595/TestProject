<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>

    <title>Dynamic tree graph</title>
    <jsp:include page="mainpage.jsp"/>
   
         <section id="main-content">
				<div class="content-title">
                    <h3 class="main-title"> </h3>
                    <span> </span>
                </div>
               
               
             <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <div align="center">
            <h1>Welcome</h1>
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
   
            $('#demo').addClass('active');
});

</script>
</body>

</html>