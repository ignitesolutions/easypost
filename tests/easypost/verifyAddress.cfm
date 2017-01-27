<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>verify address</title>
</head>
<body>

<cfset resp = application.easyPostLib.verifyAddress(
     address1 = "123 Main Street",
     city = "Chicago",
     zip = "60606",
     state="IL"
     )>
<cfoutput>
		<cfdump var="#resp#">


	</cfoutput>
	
</body>
</html>