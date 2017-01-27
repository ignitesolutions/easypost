<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>BuyLabel</title>
</head>
<body>


 <cfset purchaseShipment = application.easyPostLib.buyLabel(shipmentId = "{SHIPMENT_ID}", rateId = "{RATE_ID}")>
 <cfdump var="#purchaseShipment#">
	
</body>
</html>