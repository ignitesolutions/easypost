<cfcomponent output="false">
	
<cfscript>
This.name = "easypost";
This.clientmanagement = false;
This.sessionmanagement = true;
This.loginstorage = "Session";

// This checks if a cookie is created, for bots this will return false and use the low session timeout
This.sessionTimeout = StructKeyExists(cookie, "cfid") ? createTimeSpan(0,0,60,0) : createTimeSpan(0,0,0,2);
</cfscript>

<cffunction name="onApplicationStart" returnType="boolean" output="false">  
  <cfscript>
        application.easyPostApiKey = "YOUR_API_KEY";
        application.carrierAccountNumberList = "CARRIER_LIST";
     	application.easypostLib = CreateObject("component","/components/easypost");
  </cfscript>
 <cfreturn true>
</cffunction>

<cffunction name="onSessionStart" returnType="boolean" output="false">
	<cfreturn true>
</cffunction>


<cffunction name="onRequestStart" output="false">
	<cfreturn true>
</cffunction>


<cffunction name="onMissingTemplate" returnType="boolean" output="true">
	<cfargument name="targetpage" required="true" type="string" />
	
	<cfinclude template="pagenotfound.cfm">
	
	<cfreturn true />
</cffunction>

<!---
<cffunction name="OnError" access="public" output="true" returntype="void">
	<cfargument name="Exception" type="any" required="true"> 
	<cfargument name="EventName" type="string" required="false" default=""> 
	
	<cfif structkeyexists(arguments.exception,"rootCause") and arguments.exception.rootCause eq "coldfusion.runtime.AbortException">
        <cfreturn/>
    </cfif>
	
    <cfif NOT (Arguments.EventName eq "onSessionEnd") OR (Arguments.EventName eq "onApplicationEnd")>
		   <CFCONTENT RESET="Yes">
		   <cfinclude template="custom-error.cfm">
	</cfif>

	<cfreturn>
</cffunction>
--->


</cfcomponent>