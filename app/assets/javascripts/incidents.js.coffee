# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

		
	$("#addFeeling").click ->
	  $("#newFeelingPartial").toggle ->
	    $("#addFeeling").toggle()


	$("#createFeeling, #closeFeeling").click ->
	  $("#newFeelingPartial").toggle ->
	    $("#addFeeling").toggle()

	$("#addThought").click ->
	  $("#newThoughtPartial").toggle ->
	    $("#addThought").toggle()


	$("#createThought, #closeThought").click ->
	  $("#newThoughtPartial").toggle ->
	    $("#addThought").toggle()

