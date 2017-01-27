<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>


<cfhttp url="https://api.easypost.com/v2/batches/{BATCH_ID}/label" 
	        authtype="basic" 
	        method="post" 
	        result="resp" 
	        compression="none" 
	        timeout="120" 
	        username="#application.easyPostApiKey#" 
	        password="">
	      <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfhttpparam type="formfield" name="file_format" value="pdf" />

 
		 
	</cfhttp> 


	<cfoutput>

	<cfset shipObj = deserializeJSON(resp.filecontent)>
    
    <cfdump var="#shipObj#">

    </cfoutput>


	
</body>
</html>