<cfsavecontent variable="variables.result"><cfoutput><cffunction name="test">
  <cfargument name="endpointName" type="string" required="true"/>
  <cfset test2(argumentCollection=arguments)/>
</cffunction>

<cffunction name="test2">
  <cfdump var="#arguments#"/>
  <cfabort>
</cffunction>
    
    
<cfset test("temp", "a", "b", "c") />


</cfoutput></cfsavecontent>
