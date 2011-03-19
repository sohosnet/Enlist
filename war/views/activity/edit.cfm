﻿<cfsilent>
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
	<cfimport prefix="form" taglib="/MachII/customtags/form">
</cfsilent>
<cfoutput>
<cfif event.getArg("message") neq "">
	<p class="alert">#event.getArg("message")#</p>
</cfif>
</cfoutput>

<cfsavecontent variable="js">
	<script>
		$(function() {
			$( "#startDate" ).datepicker();
			$( "#endDate" ).datepicker();
		});
	</script>

</cfsavecontent>
<cfhtmlhead text="#js#">

<form:form actionEvent="activity.save" bind="activity" id="actForm">
	<form:hidden name="id" path="id" />
	<cfoutput>
	<table style="width: 100%">
		<tr>
			<th>Title:</th>
			<td><form:input path="title" size="40" maxlength="200" class="required" /></td>
		</tr>
 		<tr>
			<th>Description:</th>
			<td><form:input path="description" size="40" maxlength="200" /></td>
		</tr>
		<tr>
			<th>Number of People:</th>
			<td><form:input path="numPeople" size="40" maxlength="4" class="required" /></td>
		</tr>
		<tr>
			<th>Start Date:</th>
			<td><form:input path="startDate" id="startDate" size="40" maxlength="10" class="required date" /></td>
		</tr>
		<tr>
			<th>End Date:</th>
			<td><form:input path="endDate" id="endDate" size="40" maxlength="10" class="required date" /></td>
		</tr>
		<tr>
			<th>Point Hours:</th>
			<td><form:input path="pointHours" size="40" maxlength="4" class="required" /></td>
		</tr>
		<tr>
			<th>Location:</th>
			<td><form:input path="location" size="40" maxlength="20" class="required" /></td>
		</tr>
		<tr>
			<th>Event:</th>
			<td>
				<form:select path="eventId" items="#event.getArg("events")#" bind="#event.getArg("activity").getEvent().getId()#" class="required">
				<form:option value="" label="Choose an event" />
				</form:select>
			</td>
		</tr>
		<!--- TODO: Add dropdown of events --->
		<tr>
			<td></td>
			<td><form:button type="submit" name="save" value="Save Activity" /></td>
		</tr>
		</cfoutput>
	</table>
</form:form>
<script>
	$(document).ready(function(){
		jQuery.validator.addMethod("greaterThan", function(value, element, params) {
			if (!/Invalid|NaN/.test(new Date(value))) {
				return new Date(value) > new Date($(params).val());
			}
			return isNaN(value) && isNaN($(params).val()) || (parseFloat(value) > parseFloat($(params).val()));
		},'Must be greater than {0}.');
		$("#actForm").validate();
		$("#endDate").rules("add", {greaterThan: "#startDate"});
	});
</script>