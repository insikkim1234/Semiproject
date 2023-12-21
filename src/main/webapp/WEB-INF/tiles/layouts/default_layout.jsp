<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
    <tiles:insertAttribute name="head" />
</head>
<body>

<div class="navigationbar" >
    <tiles:insertAttribute name="navigationbar" />
</div>

    <div class="container">
    <tiles:insertAttribute name="content" />
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"  />
</div>

</body>
</html>
