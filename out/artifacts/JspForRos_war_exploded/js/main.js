function check() {
    if (document.getElementById(username).value == "") {
        alert("对不起，用户名不能为空值!");
    }
    if (document.getElementById(password).value == "") {
        alert("对不起，密码不能为空值!")
        return false;
    }
    return true;
}

var Tabs = (function() {
    var s;

    return {
        settings: {
            tabs: document.getElementsByClassName('tabs__item'),
            tab: document.getElementsByClassName('tab')
        },

        init: function() {
            s = this.settings;
            this.display();
            this.click();
        },

        display: function() {
            if (s.tab.length) {
                [].forEach.call(s.tab, function(tab) {
                    tab.style.display = 'none';
                });
                s.tab[0].style.display = 'block';
                s.tab[0].classList.add('active');
                s.tabs[0].classList.add('active');
            }
        },

        click: function() {
            if (s.tabs.length) {
                var currentIdx = 0,
                    prevIdx = currentIdx;

                [].forEach.call(s.tabs, function(tab, idx) {
                    tab.addEventListener('click', function() {
                        prevIdx = currentIdx;
                        currentIdx = idx;

                        if (prevIdx !== currentIdx) {
                            s.tab[prevIdx].style.display = 'none';
                            s.tab[prevIdx].classList.remove('active');
                            s.tabs[prevIdx].classList.remove('active');
                            s.tab[currentIdx].style.display = 'block';
                            s.tab[currentIdx].classList.add('active');
                            s.tabs[currentIdx].classList.add('active');
                        }
                    });
                });
            }
        }

    }
})();

var Preview = (function() {
    var s;

    return {
        settings: {
            img: document.getElementsByClassName('preview__img'),
            post: document.getElementsByClassName('preview')
        },

        init: function() {
            s = this.settings;
            this.display();
            this.mouseenter();
        },

        display: function() {
            if (s.img.length) {
                [].forEach.call(s.img, function(img) {
                    img.style.display = 'none';
                });
                s.img[0].style.display = 'block';
            }
        },

        mouseenter: function() {
            if (s.post.length) {
                var currentIdx = 0,
                    prevIdx = currentIdx;

                [].forEach.call(s.post, function(preview, idx) {
                    preview.addEventListener('mouseenter', function() {
                        prevIdx = currentIdx;
                        currentIdx = idx;

                        if (prevIdx !== currentIdx) {
                            s.img[prevIdx].style.display = 'none';
                            s.img[currentIdx].style.display = 'block';
                        }
                    });
                });
            }
        }
    }
})();

document.addEventListener('DOMContentLoaded', function() {
    Tabs.init();
    Preview.init();
});

var h1 = document.querySelector("h1");

h1.addEventListener("input", function() {
    this.setAttribute("data-heading", this.innerText);
});

//比赛信息滚动
function customWayPoint(className, addClassName, customOffset) {
    var waypoints = $(className).waypoint({
        handler: function(direction) {
            if (direction == "down") {
                $(className).addClass(addClassName);
            } else {
                $(className).removeClass(addClassName);
            }
        },
        offset: customOffset
    });
}

var defaultOffset = '50%';

for (i = 0; i < 17; i++) {
    customWayPoint('.timeline__item--' + i, 'timeline__item-bg', defaultOffset);
}