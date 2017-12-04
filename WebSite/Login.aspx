<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script src="jquery.min.js" type="text/javascript">
</script>

    <style type="text/css">
div.fileinputs {
	position: relative;

}
.fileinputs img{
        height:50px;
    width:50px;
}

div.fakefile {
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 1;
}

input.file {
	position: relative;
	text-align: right;
	-moz-opacity:0 ;
	filter:alpha(opacity: 0);
	opacity: 0;
	z-index: 2;
}
    </style>
</head>
<body>


<form id="msform" name="cb" action="#"  runat="server">
<div class="fileinputs">
	<input type="file" class="file" />
	<div class="fakefile">
		<input />
		<img src="http://amadeus.ezpress.it/img/upload.png" />
        		<%--<img src="images/Arrow-32.png" />--%>
	</div>

    </div>
</form>
</body>
</html>

