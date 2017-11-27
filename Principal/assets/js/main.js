$(function () {

    $('#btnShowPopup').click(function () {
        $('#popup').show();
        $("body").addClass("blur");
    })
    $(document).mouseup(function (e) {
        var container = $("#popup");

        if (!container.is(e.target) // if the target of the click isn't the container...
            && container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            container.hide();
            $("body").removeClass("blur")
        }
    });

});