<!---

    Enlist - Volunteer Management Software
    Copyright (C) 2011 GreatBizTools, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.

$Id: $

Notes:
--->
<cfcomponent output="false">

	<!---
	PROPERTIES
	--->
	<cfset variables.navigationLinkGateway = "" />
	
	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="NavigationLinkService" output="false"
		hint="Initializes the service."> 
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getNavigationLinkGateway" access="public" returntype="Enlist.model.navigation.NavigationLinkGateway" output="false">
		<cfreturn variables.navigationLinkGateway />
	</cffunction> 
	<cffunction name="setNavigationLinkGateway" access="public" returntype="void" output="false">
		<cfargument name="navigationLinkGateway" type="Enlist.model.navigation.NavigationLinkGateway" required="true" /> 
		<cfset variables.navigationLinkGateway = arguments.navigationLinkGateway />
	</cffunction> 

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="getNavigationLink" access="public" returntype="Enlist.model.navigation.NavigationLink" output="false">
		<cfargument name="id" type="string" required="false" default="">
		<cfreturn getNavigationLinkGateway().getNavigationLink(arguments.id) />
	</cffunction> 
	
	<cffunction name="getNavigationLinks" access="public" returntype="array" output="false">
		<cfreturn getNavigationLinkGateway().getNavigationLinks() />
	</cffunction>
	
	<cffunction name="deleteNavigationLink" access="public" returntype="void" output="false">
		<cfargument name="id" type="string" required="true">
		<cfset getNavigationLinkGateway().deleteNavigationLink(getNavigationLink(arguments.id)) />
	</cffunction> 
	
	<cffunction name="saveNavigationLink" access="public" returntype="void" output="false">
		<cfargument name="navigationLink" type="Enlist.model.navigation.NavigationLink" required="true">
		<cfset getNavigationLinkGateway().saveNavigationLink(arguments.navigationLink) />
	</cffunction> 
	
</cfcomponent>