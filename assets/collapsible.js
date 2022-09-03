document.addEventListener("DOMContentLoaded", function () {
    const make_visible = function (c) {
        c.style.display = "block";
    };
    const make_invisible = function (c) {
        c.style.display = "none";
    };
    const is_visible = function (c) {
        return c.style.display === "block";
    };
    const forEach = Array.prototype.forEach;

    // Register toggle visibility action to button.
    forEach.call(document.getElementsByClassName("collapsible"), function (c) {
        var button = c.getElementsByClassName("collapsible-button")[0];
        var content = c.getElementsByClassName("collapsible-content")[0];
        button.addEventListener("click", function () {
            if (is_visible(content)) {
                make_invisible(content);
            } else {
                make_visible(content);
            }
        });
    });

    // Make contents visible on load if they are surrounded by div of class "collapsible-default-open".
    forEach.call(document.getElementsByClassName("collapsible-default-open"), function (d) {
        forEach.call(d.getElementsByClassName("collapsible"), function (c) {
            make_visible(c.getElementsByClassName("collapsible-content")[0]);
        });
    });
});
