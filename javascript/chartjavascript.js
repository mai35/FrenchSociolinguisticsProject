"use strict";
window.addEventListener('DOMContentLoaded',init,false);

function init() {
    var spans = document.getElementsByTagName("span");
    for (var i = 0; i < spans.length; i++) {
        spans[i].addEventListener('click', popup, false);
    }
}

function popup(e) {
    if (! this.id) {
        var overlay = document.createElement("div");
        var XMousePos = e.clientX + 150;
        var YMousePos = e.clientY + 1500;
        var windowWidth = window.innerWidth;
        var random = "n" + Math.random();
        
        this.id = random;
        overlay.innerHTML = this.dataset.definition;
        overlay.style.backgroundColor = "#8AB8E6";
        overlay.style.position = "absolute";
        overlay.style.left = XMousePos + "px";
        overlay.style.top = YMousePos + "px";
        overlay.style.border = "1px solid black";
        overlay.style.width = "300px";
        overlay.style.margin = "0";
        overlay.style.padding = ".5em";
        overlay.dataset.pointer = random;
        overlay.addEventListener('click', destroy, false);
        document.body.appendChild(overlay);
    }
}

function destroy() {
    var span = document.getElementById(this.dataset.pointer);
    span.removeAttribute("id");
    document.body.removeChild(this);
}


window.onload = init;