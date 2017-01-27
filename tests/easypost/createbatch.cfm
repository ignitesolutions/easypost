<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>


<cfhttp url="https://api.easypost.com/v2/batches" 
	        authtype="basic" 
	        method="post" 
	        result="resp" 
	        compression="none" 
	        timeout="120" 
	        username="#application.easyPostApiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][to_address][name]" value="BoB Smith" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][to_address][street1]" value="123 Main Street" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][to_address][street2]" value="" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][to_address][city]" value="Chicago" />
          <cfhttpparam type="formfield" name="batch[shipment][0][to_address][state]" value="IL" />
          <cfhttpparam type="formfield" name="batch[shipment][0][to_address][zip]" value="60606" />
          <cfhttpparam type="formfield" name="batch[shipment][0][to_address][country]" value="USA" />
          <cfhttpparam type="formfield" name="batch[shipment][0][to_address][phone]" value="555-555-1212" />
          <cfhttpparam type="formfield" name="batch[shipment][0][to_address][email]" value="bob@gmail.com" />

          <cfhttpparam type="formfield" name="batch[shipment][0][from_address][name]" value="BoB Smith" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][from_address][street1]" value="8001 Cavalier Drive" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][from_address][street2]" value="" />
		  <cfhttpparam type="formfield" name="batch[shipment][0][from_address][city]" value="Chicago" />
          <cfhttpparam type="formfield" name="batch[shipment][0][from_address][state]" value="IL" />
          <cfhttpparam type="formfield" name="batch[shipment][0][from_address][zip]" value="60606" />
          <cfhttpparam type="formfield" name="batch[shipment][0][from_address][country]" value="USA" />
          <cfhttpparam type="formfield" name="batch[shipment][0][from_address][phone]" value="312-239-0032" />
          <cfhttpparam type="formfield" name="batch[shipment][0][from_address][email]" value="bob@gmail.com" />

          <cfhttpparam type="formfield" name="batch[shipment][0][parcel][length]" value="10" />
          <cfhttpparam type="formfield" name="batch[shipment][0][parcel][width]" value="11" />
          <cfhttpparam type="formfield" name="batch[shipment][0][parcel][height]" value="2" />
          <cfhttpparam type="formfield" name="batch[shipment][0][parcel][weight]" value="2" />

          <cfhttpparam type="formfield" name="batch[shipment][0][carrier]" value="USPS" />
          <cfhttpparam type="formfield" name="batch[shipment][0][service]" value="First" />
 
		 
	</cfhttp> 


	<cfoutput>

	<cfset shipObj = deserializeJSON(resp.filecontent)>
    
    <cfdump var="#shipObj#">

    </cfoutput>


	
</body>
</html>