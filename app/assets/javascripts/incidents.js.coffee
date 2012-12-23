# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$("#addFeeling").click ->
  $("#newFeelingPartial").toggle ->
    $("#addFeeling").toggle()


$("#createFeeling, #closeFeeling").click ->
  $("#newFeelingPartial").toggle ->
    $("#addFeeling").toggle()

console.log('from incidents.js')