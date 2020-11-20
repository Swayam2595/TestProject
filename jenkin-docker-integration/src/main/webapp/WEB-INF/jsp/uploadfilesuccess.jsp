<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<jsp:include page="header.jsp"/>
<head>
<title>Upload Multiple Files Example</title>
<jsp:include page="mainpage.jsp"/>
<style type="text/css">

</style>
</head>
<body>
    <br>
    <br>
    <div align="center">
 
        <h1>Uploaded Files</h1>
        <p style="color:black;font-size:18px;"> Following files are uploaded successfully.</p>
        <ol>
            <c:forEach items="${files}" var="file">
           - ${file} <br>
            </c:forEach>
        </ol>
         <br />
        <br />
        <br />
       
    </div>
</body>
</html>