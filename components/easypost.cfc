<cfcomponent displayname="Easy Post Library" output="no" >

<cfscript>
variables.ds = application.datasource;
variables.EasyPostApiKey = application.easyPostApiKey;
variables.endPoint = "https://api.easypost.com/v2";
</cfscript>

<!--- Voucher functions ---> 


<cffunction name="getAddress" output="no" returntype="any">
	<cfargument name="addressid" type="string" required="true">	
	
	<cfset var response = "">
	
	<cfhttp url="#variables.endpoint#/addresses/#arguments.addressid#" 
	        authtype="basic" 
	        method="get" 
	        result="response" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.easyPostApiKey#" 
	        password="">	 
	</cfhttp> 



	
	
	<cfreturn response>
</cffunction>

<cffunction name="verifyAddress" output="no" returntype="any">
	<cfargument name="address1" type="string" required="true">
	<cfargument name="address2" type="string" required="false" default="">
	<cfargument name="city" type="string" required="true">
	<cfargument name="state" type="string" required="true">
	<cfargument name="zip" type="string" required="true">
	<cfargument name="phone" type="string" required="false" default="">
	<cfargument name="verifyType" type="string" required="false" default="delivery">
	<cfargument name="strict" type="string" required="false" default="false">
	
	<cfset var response = "">
	<cfset myResp = "">
	<cfset resp = {}>
	
	<cfhttp url="#variables.endpoint#/addresses" 
	        authtype="basic" 
	        method="post" 
	        result="response" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.easyPostApiKey#" 
	        password="">	
	      <cfhttpparam type="formfield" name="address[street1]" value="#arguments.address1#" />
		  <cfhttpparam type="formfield" name="address[street2]" value="#arguments.address2#" />
		  <cfhttpparam type="formfield" name="address[city]" value="#arguments.city#" />
          <cfhttpparam type="formfield" name="address[state]" value="#arguments.state#" />
          <cfhttpparam type="formfield" name="address[zip]" value="#arguments.zip#" />
          <cfhttpparam type="formfield" name="address[country]" value="USA" />
          <cfif arguments.phone neq "">
          	<cfhttpparam type="formfield" name="address[phone]" value="#arguments.phone#" />
          </cfif>
          
          <cfif arguments.strict>
            <cfhttpparam type="formfield" name="verify_strict[]" value="#arguments.verifytype#" />
          <cfelse> 	
          	<cfhttpparam type="formfield" name="verify[]" value="#arguments.verifytype#" />
          </cfif>
           
	</cfhttp>

	<cfset myResp = deserializeJSON(response.filecontent)> 
	<cfif myResp.verifications.delivery.success is "YES">
		<cfset resp.verified = true>
		<cfset resp.id = myResp.id>
		<!--- <cfset resp.fullresponse = myREsp> --->
	<cfelse>
		<cfset resp.verified = false>
		<cfset resp.id = myResp.id>
		<!--- <cfset resp.fullresponse = myREsp> --->
		<cfset resp.errors = myREsp.verifications.delivery.errors>
	</cfif>



	
	
	<cfreturn resp>
</cffunction>


<cffunction name="createAAOShipment" output="no" returntype="any">
	<cfargument name="toName" type="string" required="true">
	<cfargument name="toCompany" type="string" required="true">
	<cfargument name="toAddress1" type="string" required="true">
	<cfargument name="toAddress2" type="string" required="false" default="">
	<cfargument name="toCity" type="string" required="true">
	<cfargument name="toState" type="string" required="true">
	<cfargument name="toZip" type="string" required="true">
	<cfargument name="toPhone" type="string" required="false" default="">
	<cfargument name="toEmail" type="string" required="false" default="">
	<cfargument name="toResidential" type="boolean" required="true">

	<cfargument name="fromName" type="string" required="true">
	<cfargument name="fromAddress1" type="string" required="true">
	<cfargument name="fromAddress2" type="string" required="false" default="">
	<cfargument name="fromCity" type="string" required="true">
	<cfargument name="fromState" type="string" required="true">
	<cfargument name="fromZip" type="string" required="true">
	<cfargument name="fromPhone" type="string" required="false" default="">
	<cfargument name="fromEmail" type="string" required="false" default="">

	<cfargument name="parcelLength" type="string" required="true" default="">
	<cfargument name="parcelHeight" type="string" required="true" default="">
	<cfargument name="parcelDepth" type="string" required="true" default="">
	<cfargument name="parcelWeight" type="string" required="true" default="">
	<cfargument name="reference" type="string" required="true">


	
	<cfset var response = "">
	<cfset var shipObj = "">
	
	<cfhttp url="https://api.easypost.com/v2/shipments" 
	        authtype="basic" 
	        method="post" 
	        result="resp" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.easyPostApiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfhttpparam type="formfield" name="shipment[to_address][name]" value="#arguments.toName#" />
		  <cfhttpparam type="formfield" name="shipment[to_address][company]" value="#arguments.toCompany#" />
		  <cfhttpparam type="formfield" name="shipment[to_address][street1]" value="#arguments.toAddress1#" />
		  <cfhttpparam type="formfield" name="shipment[to_address][street2]" value="#arguments.toAddress2#" />
		  <cfhttpparam type="formfield" name="shipment[to_address][city]" value="#arguments.toCity#" />
          <cfhttpparam type="formfield" name="shipment[to_address][state]" value="#arguments.toState#" />
          <cfhttpparam type="formfield" name="shipment[to_address][zip]" value="#arguments.toZip#" />
          <cfhttpparam type="formfield" name="shipment[to_address][country]" value="USA" />
          <cfhttpparam type="formfield" name="shipment[to_address][phone]" value="#arguments.toPhone#" />
          <cfhttpparam type="formfield" name="shipment[to_address][email]" value="#arguments.toEmail#" />
          <cfhttpparam type="formfield" name="shipment[to_address][residential]" value="#arguments.toResidential#" />

          <cfhttpparam type="formfield" name="shipment[from_address][name]" value="#arguments.fromName#" />
		  <cfhttpparam type="formfield" name="shipment[from_address][street1]" value="#arguments.fromAddress1#" />
		  <cfhttpparam type="formfield" name="shipment[from_address][street2]" value="#arguments.fromAddress2#" />
		  <cfhttpparam type="formfield" name="shipment[from_address][city]" value="#arguments.fromCity#" />
          <cfhttpparam type="formfield" name="shipment[from_address][state]" value="#arguments.fromState#" />
          <cfhttpparam type="formfield" name="shipment[from_address][zip]" value="#arguments.fromZip#" />
          <cfhttpparam type="formfield" name="shipment[from_address][country]" value="USA" />
          <cfhttpparam type="formfield" name="shipment[from_address][phone]" value="#arguments.fromPhone#" />
          <cfhttpparam type="formfield" name="shipment[from_address][email]" value="#arguments.fromEmail#" />

          <cfhttpparam type="formfield" name="shipment[parcel][length]" value="#arguments.parcelLength#" />
          <cfhttpparam type="formfield" name="shipment[parcel][width]" value="#arguments.parcelWidth#" />
          <cfhttpparam type="formfield" name="shipment[parcel][height]" value="#arguments.parcelHeight#" />
          <cfhttpparam type="formfield" name="shipment[parcel][weight]" value="#arguments.parcelWeight#" />
          <cfhttpparam type="formfield" name="shipment[options][print_custom_1_code]" value="Reference" />
          <cfhttpparam type="formfield" name="shipment[options][print_custom_1]" value="#arguments.reference#" />
          <cfhttpparam type="formfield" name="carrieraccounts" value="#application.carrierAccountNumberList#" />
	</cfhttp> 


	<cfset shipObj = deserializeJSON(resp.filecontent)>





	
	
	<cfreturn shipObj>
</cffunction>



<cffunction name="buyLabel" output="no" returntype="any">
	<cfargument name="shipmentId" type="string" required="true">
	<cfargument name="rateId" type="string" required="true">
	
	<cfset var response = "">
	<cfset var labelObj = "">
	

<cfhttp url="https://api.easypost.com/v2/shipments/#arguments.shipmentId#/buy" 
	        authtype="basic" 
	        method="post" 
	        result="response" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.easyPostApiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfhttpparam type="formfield" name="rate[id]" value="#arguments.rateId#" />
		 
	</cfhttp> 

    <cfset labelObj = deserializeJSON(response.filecontent)>
	<cfreturn labelObj>
</cffunction>


<cffunction name="createBatch" output="no" returntype="any">
	<cfargument name="shipmentManifest" type="array" required="true">
	
	<cfset var response = "">
	<cfset var labelObj = "">
	<cfset var iter = 1>
	

<cfhttp url="https://api.easypost.com/v2/batches/" 
	        authtype="basic" 
	        method="post" 
	        result="response" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.easyPostApiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		  <cfloop array="#shipmentManifest#" index="thisItem">
		  	<cfhttpparam type="formfield" name="batch[shipments][#iter#][id]" value="#thisItem#" />
		  		<cfset iter++>
		  </cfloop>
		 
	</cfhttp> 

    <cfset labelObj = deserializeJSON(response.filecontent)>
	<cfreturn labelObj>
</cffunction>


<cffunction name="createBatchLabels" output="no" returntype="any">
	<cfargument name="batchId" type="string" required="true">
	
	<cfset var response = "">
	<cfset var labelObj = "">
	

<cfhttp url="https://api.easypost.com/v2/batches/#arguments.batchId#/label" 
	        authtype="basic" 
	        method="post" 
	        result="response" 
	        compression="none" 
	        timeout="120" 
	        username="#variables.easyPostApiKey#" 
	        password="">
	       <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded" />
		   <cfhttpparam type="formfield" name="file_format" value="pdf" />
		 
	</cfhttp> 

    <cfset labelObj = deserializeJSON(response.filecontent)>
	<cfreturn labelObj>
</cffunction>


<cffunction name="createBatchRecord" output="no" returntype="void">
	<cfargument name="batchId" type="string" required="true">

	<cfset var createBatchRecord = "">
	
	<cfquery name="createBatchRecord" datasource="#variables.ds#">
		insert into batches 
			(batchId, batchState, batchCreationDate, batchDescription, batchReference, batchLastUpdated)
			VALUES
			(<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.batchId#">,
			 <cfqueryparam cfsqltype="cf_sql_varchar" value="batch_created">,
			 <cfqueryparam cfsqltype="cf_sql_timestamp" value="#createODBCDateTIme(Now())#">,
			 <cfqueryparam cfsqltype="cf_sql_varchar" value="">,
			 <cfqueryparam cfsqltype="cf_sql_varchar" value="">,
			 <cfqueryparam cfsqltype="cf_sql_timestamp" value="#createODBCDateTIme(Now())#">
			)
				
	</cfquery>
	


</cffunction>










</cfcomponent>