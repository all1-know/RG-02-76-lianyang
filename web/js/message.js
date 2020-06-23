var ughs = [
    [
        "Hello It's Me",
        "Aug 17, 2016"
    ],
    [
        "I've Been Wondering",
        "Aug 17, 2016"
    ],
    [
        "If After All These Years",
        "Aug 17, 2016"
    ],
    [
        "You'd Like To",
        "Aug 17, 2016"
    ],
    [
        "Meet",
        "Aug 17, 2016"
    ],
    [
        "To Go Over",
        "Aug 17, 2016"
    ],
    [
        "Everything",
        "Aug 17, 2016"
    ],
    [
        "They Say Time Heals All Wounds",
        "Aug 17, 2016"
    ],
    [
        "But I",
        "Aug 17, 2016"
    ],
    [
        "Haven't Done Much",
        "Aug 17, 2016"
    ],
    [
        "Heal",
        "Aug 17, 2016"
    ],
    [
        "Hello ? ",
        "Aug 17, 2016"
    ],
    [
        "Can You Hear Me ? ",
        "Aug 17, 2016"
    ]
];

var inputs = [];
var labels = [];

function create(i) {
    inputs.push(document.createElement("INPUT"));
    inputs[inputs.length - 1].type = "checkbox";
    inputs[inputs.length - 1].className = "course-item-checkbox";
    inputs[inputs.length - 1].id = "course-item-" + i;

    labels.push(document.createElement("LABEL"));
    labels[labels.length - 1].htmlFor = "course-item-" + i;
    labels[labels.length - 1].className = "courses-item flex column";
    labels[labels.length - 1].id = "courses-item-" + i;
    spann = document.createElement("SPAN");
    spann.appendChild(document.createTextNode(ughs[i - 1][0]));
    spannn = document.createElement("SPAN");
    spannn.appendChild(document.createTextNode(ughs[i - 1][1]));
    labels[labels.length - 1].appendChild(spann);
    labels[labels.length - 1].appendChild(spannn);
}

function clear() {
    document.getElementById("courses-list").innerHTML = "";
}

function draw() {
    for (var i = 0; i < ughs.length; i++) {
        document.getElementById("courses-list").appendChild(inputs[i]);
        document.getElementById("courses-list").appendChild(labels[i]);
    }
}

function load() {
    inputs = [];
    labels = [];

    for (var i = 0; i < ughs.length; i++) {
        create((i + 1));
    }

    clear();
    draw();
}

function remove() {
    checked = [];

    for (var i = 0; i < ughs.length; i++) {
        if (document.getElementById("course-item-" + (i + 1)).checked)
            checked.push(i);
    }

    for (var i = 0; i < checked.length; i++) {
        ughs.splice(checked[i], 1);
    }

    load();
}

function add() {
    ughs.unshift([
        document.getElementById("ugh-text").value,
        document.getElementById("ugh-date").value
    ]);

    document.getElementById("ugh-text").value = "";
    document.getElementById("ugh-date").value = "";

    load();
}

window.onload = load();