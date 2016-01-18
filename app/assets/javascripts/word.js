// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
    // pusher related logic
    var pusher = new Pusher(pusherKey);
    var channel = pusher.subscribe(myChannel);
    channel.bind('word', function(data) {
        $("#streamingPlace").text(data["word"]).removeClass().addClass(data["color"]);
    });

    // resume/pause logic
    var pause = $("#pause");
    var resume = $("#resume");

    function toggleEnableDisable(toEnable, toDisable) {
        toEnable.addClass("enabled").removeClass("disabled");
        toDisable.addClass("disabled").removeClass("enabled");
    }

    $("#pause").click(function() {
        $.post({
            url: "/word/pause",
            data: {
                jobId: jobId
            },
            success: function() {
                toggleEnableDisable(resume, pause);
            }
        });
    });
    $("#resume").click(function() {
        $.post({
            url: "/word/resume",
            data: {
                jobId: jobId
            },
            success: function() {
                toggleEnableDisable(pause, resume);
            }
        });
    });
});