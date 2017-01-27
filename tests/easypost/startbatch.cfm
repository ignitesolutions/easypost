<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>process</title>
</head>
<body>
     
     <!--- MUST PASS AN ARRAY OF SHIPMENT IDS TO CREATE BATCH --->
    <cfset shippingManifest = []>

    <cfquery name="getShipments" datasource="#application.datasource#">
      select epShipmentId from shipments where batchId is NULL
    </cfquery>

    <cfloop query="getShipments">
      <cfset tmp = arrayAppend(shippingManifest, epShipmentId)>
    </cfloop>

     

    <cfset resp = application.easyPostLib.createBatch(shippingManifest)>
    <cfdump var="#resp#">

    <BR>CREATE BATCH LABELS</br>
    <cfset resp2 = application.easyPostLib.createBatchLabels(resp.id)>
    <cfdump var="#resp2#">

    <cfset application.easyPostLib.createBatchRecord(batchId = resp2.id)>

    




</body>
</html>