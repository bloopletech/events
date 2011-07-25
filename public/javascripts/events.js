$(function() {
  $("#event_start").live('click', function() {
    $(this).attr('disabled', 'disabled');
    $("#event_started_fields").css('display', 'inline');
    $("#event_started_at").val((new Date()).toISO8601());
  });
  
  $("#event_submit").live('click', function() {
    $("#event_finished_at").val((new Date()).toISO8601());    
  });
});