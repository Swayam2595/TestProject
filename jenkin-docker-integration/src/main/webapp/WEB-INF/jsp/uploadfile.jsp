<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<jsp:include page="header.jsp"/>
<head>
<title>Upload Files</title>
<jsp:include page="mainpage.jsp"/>
<script
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script>
    $(document)
            .ready(
                    function() {
                        //add more file components if Add is clicked
                        $('#addFile')
                                .click(
                                        function() {
                                            var fileIndex = $('#fileTable tr')
                                                    .children().length - 1;
                                            $('#fileTable')
                                                    .append(
                                                            '<tr><td>'
                                                                    + '   <input type="file" name="files['+ fileIndex +']" />'
                                                                    + '</td></tr>');
                                        });
 
                    });
</script>
<style type="text/css">

</style>
</head>
<body>
    <br>
    <br>
    <div align="center">
        <h1>Upload Files</h1>
 
        <form:form method="post" action="savefiles.html"
            modelAttribute="uploadForm" enctype="multipart/form-data">
 
            <p style="color:black;font-size:18px;">Select files to upload. Press Add button to add more file inputs.</p>
 
            <table id="fileTable">
                <tr>
                    <td><input style="color:red;" name="files[0]" type="file" /></td>
                </tr>
                
            </table>
            <br />
            <input  style="color:red;font-size:15px;" type="submit" value="Upload" />
            <input style="color:red;font-size:15px;" id="addFile" type="button" value="Add File" />
        </form:form>
 
        <br />
    </div>
</body>
</html>