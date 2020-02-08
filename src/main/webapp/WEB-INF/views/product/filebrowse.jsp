<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Files Browser</title>
<style type="text/css">
body {
	font-family: 'Seqoe UI', Verdana, Helvetica, sans-serif;
	font-size: 80%;
}

#form {
	width: 600px;
}

#folderExplorer {
	float: left;
	width: 100px;
}

#fileExplorer {
	float: left;
	width: 680px;
	border-left: 1px solid #dff0ff;
}

.thumbnail {
	float: left;
	margin: 3px;
	padding: 3px;
	border: px solid #dff0ff;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}


li {
	padding: 0;
}
</style>
<script src="${$pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="${$pageContext.request.contextPath}/resources/js/ckeditor-full/ckeditor.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function () {
		var funcNum = @(Context.Request.Query["CKEditorFuncNum"] + ";"); 
		$('#fileExplorer').on('click', 'img', function() {
			var fileUrl = '/uploads/' + $(this).attr('title');
			window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
			window.close();
		}).hover(function() {
				$(this).css('cursor','pointer');
			});
	});
</script>

</head>
<body>
	<div id="fileExplorer">
		<c:forEach var="file" items="${files}">
			<div class="thumbnail">
				<img src="${pageContext.request.contextPath}/uploads/${file.name}" alt="thumb" title="${file.name }" width="120" height="100" /> </br> ${file.name }
			</div>
		</c:forEach>
	</div>
</body>
</html>