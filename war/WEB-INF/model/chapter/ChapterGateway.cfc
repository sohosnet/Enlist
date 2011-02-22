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

	<cffunction name="getChapter" access="public" returntype="Enlist.model.chapter.Chapter" output="false">
		<cfargument name="chapterID" type="string" required="false" default="">

		<cfset var chapters = 0 />
		<cfset var chapter = 0 />

		<cfif NOT Len(arguments.chapterID)>
			<cfset chapter = createObject("component", "Enlist.model.chapter.Chapter").init() />
		<cfelse>
			<cfset chapters = GoogleQuery("select from chapter where id == '#arguments.chapterID#'") />
			<cfset chapter = chapters[1] />
		</cfif>

		<cfreturn chapter />
	</cffunction>

	<cffunction name="getChapters" access="public" returntype="array" output="false">
		<cfreturn googleQuery("select from chapter") />
	</cffunction>

	<cffunction name="saveChapter" access="public" returntype="void" output="false">
		<cfargument name="chapter" type="Enlist.model.chapter.Chapter" required="true">

		<cfset var key = "" />

		<cfif chapter.getID() eq "">
			<cfset chapter.setID(createUUID()) />
		<cfelse>
			<cfset googleDelete(arguments.chapter) />
		</cfif>
		<cfset key = arguments.chapter.googleWrite("chapter") />
	</cffunction>

</cfcomponent>