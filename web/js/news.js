// Wait for all images to load to fix the iOS animation behavior
window.addEventListener("load", function() {
    document.body.classList.add('loaded');
});

function replay() {
    document.body.classList.remove('loaded');
    setTimeout(function() {
        document.body.classList.add('loaded');
    }, 100);
}