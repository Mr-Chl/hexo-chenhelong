<style type="text/css">

    .circle {
        width: 40px;
        height: 40px;
        background: #555 no-repeat;
        cursor: move;
    }

    .assist-btn {
        position: fixed;
        top: 50%;
        left: 10px;
        -moz-border-radius: 50px;
        -webkit-border-radius: 50px;
        border-radius: 50px;
        outline: none;
        border: none;
        color: #87daff;
        z-index:1000;
    }
    #canvas{
        position:absolute;
        left:0;
        top:0;
        z-index:0;
    }
</style>
<canvas width="100%" height="100%" id="canvas"></canvas>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/trianglify/0.4.0/trianglify.min.js"></script>
<script type="text/javascript" src="{{ url_for(theme.vendors) }}/jquery/index.js?v=2.1.3"></script>
<script type="text/javascript">
    // 浮动圆点展开与收缩
    /*
    $(function () {
        var assist_box = $('.assist-box');
        $('#assist_btn').hover(function () {
            assist_box.stop().show(300);
        }, function () {
            assist_box.stop().hide(150);
        })
    });
    */  
    //浮动圆点拖动
    $(function () {
        var box = document.getElementById('assist_btn');
        box.onmousedown = function (event) {
            var e = event || window.event,
                t = e.target || e.srcElement,
                // 鼠标按下时的坐标x1,y1
                x1 = e.clientX,
                y1 = e.clientY,
                //鼠标按下时的左右偏移量
                dragLeft = this.offsetLeft,
                dragTop = this.offsetTop;

            document.onmousemove = function (event) {
                var e = event || window.event,
                    t = e.target || e.srcElement,
                    // 鼠标移动时的动态坐标
                    x2 = e.clientX,
                    y2 = e.clientY,
                    // 鼠标移动时的坐标的变化量
                    x = x2 - x1,
                    y = y2 - y1;
                box.style.left = (dragLeft + x) + 'px';
                box.style.top = (dragTop + y) + 'px';
            }

            document.onmouseup = function () {
                this.onmousemove = null;
            }
        }
    });

/*
    $whitesmoke   = #f5f5f5
    $gainsboro    = #eee
    $gray-lighter = #ddd
    $grey-light   = #ccc
    $grey         = #bbb
    $grey-dark    = #999
    $grey-dim     = #666
    $black-light  = #555
    $black-deep   = #222
    $red          = #ff2a2a
    $blue-bright  = #87daff
    $blue         = #0684bd
    $blue-deep    = #262a30
*/

    var clickFlog = false;
    var body = {color:  $("body").css('color'), background: $("body").css('background')};
    var a_tag = {color: '#555' };
    var header = { background: $(".header").css('background')};
    var logo_line_i = {background: $(".logo-line-before i").css('background')};
    function switch_theme() {
        if (!clickFlog) {
            var bodyB= {background: "rgb(51, 51, 51) ", color: "rgb(187, 187, 187)"}
            var a_tagB= {color: "rgb(238, 238, 238)"}
            var headerB= {background: "rgb(68, 68, 68) "}
            var logo_line_iB= {background: "rgb(238, 238, 238)"}
            clickFlog = true;
            configtheme({
                body: bodyB,
                a_tag: a_tagB,
                header: headerB,
                logo_line_i: logo_line_iB,
            })
        } else {
            clickFlog = false;
            configtheme({
                body: body,
                a_tag: a_tag,
                header: header,
                logo_line_i: logo_line_i,
            })
        } 
    }

    $(function () {
        $("#assist_btn").dblclick(function() {
            var pattern = Trianglify({
                width: $('.container').width(),
                height: $('.container').height(),
            });
            pattern.canvas(document.getElementsByTagName('canvas')[0]);
        });
    });
    function configtheme(opt) {
        $(".container").css(opt.body);
        $("a:not('.links-of-author-item a, .site-state-item a, .site-state-posts a, .feed-link a, .motion-element a, .post-tags a, .show-commit-cls a, #donate_board a')").css(opt.a_tag);
        $(".header, .footer").css(opt.header);
        $(".logo-line-before i, .logo-line-after i").css(opt.logo_line_i);
        $("#idhyt-surprise-ball #idhyt-surprise-ball-animation .drag").css(opt.a_tag);
        $(".post-title-link, .posts-expand .post-meta, .post-comments-count, .disqus-comment-count, .post-category a, .post-nav-next a, .post-nav-item a").css(opt.a_tag);
    }
</script>
<script>

</script>
<button class="assist-btn circle" id="assist_btn" title="双击切换主题">C</button>








