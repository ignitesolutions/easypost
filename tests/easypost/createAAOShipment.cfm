<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>createAAOShipment</title>
</head>
<body>

	<!--- To Create an error response set the parcelWeight = 0 --->


<cfset shipmentInfo = application.easyPostLib.createAAOShipment(
                                 toName = "Bob Smith",
                                 toAddress1 = "123 Main Street",
                                 toAddress2 = "",
                                 toCity = "Chicago",
                                 toState ="IL",
                                 toZip = "60606",
                                 toPhone = "3555-555-1212",
                                 toEmail = "mike@ignitesolutions.com",
                                 toResidential = "true",
                                 fromName = 'John Smith',
                                 fromAddress1 = '123 Oak Street',
                                 fromAddress2 = 'Suite 60',
                                 fromCity = 'Chicago',
                                 fromState = 'IL',
                                 fromZip = '60606',
                                 fromPhone = '555-555-1212',
                                 fromEmail = 'john@gmail.com',
                                 parcelHeight = 10,
                                 parcelWidth = 6,
                                 parcelLength = 4,
                                 parcelWeight = 1,
                                 reference = '1111-2222-3333-4444'
                               )>

<cfdump var="#shipmentInfo#">

	
</body>
</html>