document.addEventListener("DOMContentLoaded", function () {
    var collapsible = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < collapsible.length; i++) {
        var button = collapsible[i].getElementsByClassName("collapsible-button")[0];
        var content = collapsible[i].getElementsByClassName("collapsible-content")[0];
        button.addEventListener("click", function () {
            button.classList.toggle("collapsible-open");
            if (content.style.display === "block") {
                content.style.display = "none";
            } else {
                content.style.display = "block";
            }
        });
    }
});
