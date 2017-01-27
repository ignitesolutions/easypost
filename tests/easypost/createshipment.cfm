<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>EasyPost Test</title>
</head>
<body>



<cfset variables.carrierAccounts = "{CARRIER ACOUNT LIST}">




<cfhttp url="https://api.easypost.com/v2/shipments" 
	        authtype="basic" 
	        method="post" 
	        result="resp" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.apiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfhttpparam type="formfield" name="shipment[to_address][name]" value="John Smith" />
		  <cfhttpparam type="formfield" name="shipment[to_address][street1]" value="123 Main Street" />
		  <cfhttpparam type="formfield" name="shipment[to_address][street2]" value="" />
		  <cfhttpparam type="formfield" name="shipment[to_address][city]" value="Chicago" />
          <cfhttpparam type="formfield" name="shipment[to_address][state]" value="IL" />
          <cfhttpparam type="formfield" name="shipment[to_address][zip]" value="60606" />
          <cfhttpparam type="formfield" name="shipment[to_address][country]" value="USA" />
          <cfhttpparam type="formfield" name="shipment[to_address][phone]" value="555-555-1212" />
          <cfhttpparam type="formfield" name="shipment[to_address][email]" value="name@gmail.com" />

          <cfhttpparam type="formfield" name="shipment[from_address][name]" value="Bill Smith" />
		  <cfhttpparam type="formfield" name="shipment[from_address][street1]" value="123 Oak Ave" />
		  <cfhttpparam type="formfield" name="shipment[from_address][street2]" value="" />
		  <cfhttpparam type="formfield" name="shipment[from_address][city]" value="Joliet" />
          <cfhttpparam type="formfield" name="shipment[from_address][state]" value="IL" />
          <cfhttpparam type="formfield" name="shipment[from_address][zip]" value="60606" />
          <cfhttpparam type="formfield" name="shipment[from_address][country]" value="USA" />
          <cfhttpparam type="formfield" name="shipment[from_address][phone]" value="555-555-1212" />
          <cfhttpparam type="formfield" name="shipment[from_address][email]" value="bob@gmail.com" />

          <cfhttpparam type="formfield" name="shipment[parcel][length]" value="10" />
          <cfhttpparam type="formfield" name="shipment[parcel][width]" value="11" />
          <cfhttpparam type="formfield" name="shipment[parcel][height]" value="2" />
          <cfhttpparam type="formfield" name="shipment[parcel][weight]" value="2" />
          <cfhttpparam type="formfield" name="carrieraccounts" value="#variables.carrierAccounts#" />
		 
	</cfhttp> 


	<cfoutput>

	<cfset shipObj = deserializeJSON(resp.filecontent)>
    
    <cfdump var="#shipObj#">






	</cfoutput>



	
</body>
</html>