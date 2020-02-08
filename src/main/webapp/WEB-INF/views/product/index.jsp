<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${$pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="${$pageContext.request.contextPath}/resources/js/ckeditor-full/ckeditor.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace("textareaContent", {
		height: 400,
		filebrowserUploadUrl: '/product/upload_ckeditor',
		filebrowserBrowseUrl: '/product/filebrowse'
	});
});
</script>
</head>
<body>
	<textarea id="textareaContent"></textarea>
</body>
</html>