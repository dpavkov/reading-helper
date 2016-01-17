// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
    var pusher = new Pusher(pusherKey);
    var channel = pusher.subscribe(myChannel);
    channel.bind('word', function(data) {
        $("#streamingPlace").text(data["word"]).removeClass().addClass(data["color"]);
    });
});