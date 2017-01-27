<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>


<cfhttp url="https://api.easypost.com/v2/shipments/{SHIPMENT_ID}/buy" 
	        authtype="basic" 
	        method="post" 
	        result="resp" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.apiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfhttpparam type="formfield" name="rate[id]" value="{RATE_ID}" />
		 
	</cfhttp> 

    <cfset labelObj = deserializeJSON(resp.filecontent)>
    <cfdump var="#labelObj#">


	
</body>
</html>