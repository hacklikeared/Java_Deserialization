<%@ page language="java" contentType="text/html"%>
<%@ page import="org.apache.commons.codec.DecoderException, org.apache.commons.codec.binary.Hex, java.io.*, dttl.test.call_me" %>

<html>
	<head>
		<title>Crying Over Spilled Coffee</title>
		<style>
			body {
				background-image: url("coffee.jpg");
				text-align:center;
				background-size:300px 300px;
			}
		</style>
		<!--In dev: http://localhost:8080/index.jsp?obj=aced0005-->
		<!--In dev: http://localhost:8080/call_me.jar-->
	</head>
	<body>

<h1>

<%
try {
	call_me object = null;

	if (request.getParameter("obj") != null) {
		String s = request.getParameter("obj");
		byte[] serialized = Hex.decodeHex(s.toCharArray());

		ByteArrayInputStream in = new ByteArrayInputStream(serialized);
		ObjectInputStream objIn = new ObjectInputStream(in);

		object = (call_me) objIn.readObject();
	}
	else {
		object = new call_me();
	}

	out.print(object.never_call_me());
}
catch (Exception e){
	// Do nothing
}

%>

</h1>

	</body>
</html>
