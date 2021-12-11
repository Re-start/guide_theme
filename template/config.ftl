<script id="compatiable-checker">
  // 兼容性检查
  function detectIE() {
    var n = window.navigator.userAgent, e = n.indexOf("MSIE ");
    if (e > 0) {
      return parseInt(n.substring(e + 5, n.indexOf(".", e)), 10);
    }
    if (n.indexOf("Trident/") > 0) {
      var r = n.indexOf("rv:");
      return parseInt(n.substring(r + 3, n.indexOf(".", r)), 10);
    }
    var i = n.indexOf("Edge/");
    return i > 0 && parseInt(n.substring(i + 5, n.indexOf(".", i)), 10);
  };
  detectIE() && (alert('当前站点不支持IE浏览器或您开启了兼容模式，请使用其他浏览器访问或关闭兼容模式。'), (location.href = 'https://www.baidu.com'));
</script>
<#assign mode = (blog_url?index_of("localhost") == -1 && blog_url?index_of("127.0.0.1") == -1)?then('production', 'development')>
<#global BASE_RES_URL = (mode == "production" && settings.enable_cdn == true)?string("https://cdn.jsdelivr.net/gh/re-start/guide_theme@" + theme.version, theme_base)>
<#global EMPTY_IMG = "data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">
<script id="theme-config-getter" type="text/javascript">
  // 获取主题配置
  var ThemeConfig = {};
  <#list settings?keys as key>
    <#assign valueString = settings[key]?string>
    <#assign isNeeded = key?index_of('custom_')==-1 && valueString?index_of('<script')==-1 && valueString?index_of('<link')==-1>
    <#if isNeeded>
      var field = '${key}';
      var value = '${valueString?js_string}';
      value = value.replace(/</g,"&lt;").replace(/>/g, "&gt;");
      if(/^(true|false)$/.test(value)) {
        value = JSON.parse(value);
      }
      if(/^\d+$/.test(value)) {
        value = Number(value);
      }
      ThemeConfig[field] = value;
    </#if>
  </#list>
  ThemeConfig['mode'] = '${mode!}';
  ThemeConfig['blog_title'] = '${blog_title!}';
  ThemeConfig['blog_url'] = '${blog_url!}';
  ThemeConfig['author'] = '${user.nickname!}';
  ThemeConfig['BASE_URL'] = 'https://www.haowuguide.com';
  ThemeConfig['BASE_RES_URL'] = '${BASE_RES_URL}';
  ThemeConfig['post_index_page_size'] = '${options.post_index_page_size!10}';
  // ThemeConfig['comment_plugin'] = '${options.comment_internal_plugin_js!}'
</script>

<script id="metas-getter" type="text/javascript">
  // 获取当前页面元数据
  window.PageAttrs = {
    "metas": {
      <#if metas??>
        <#list metas?keys as key>
          "${key}": "${metas['${key}']}",
        </#list>
      </#if>
    }
  };
</script>

<script id="theme-config-getter" type="text/javascript">
  if (ThemeConfig.mode === "development") {
    console.log('%cJoe2.0主题配置：', "color:#fff; background: linear-gradient(270deg, #986fee, #8695e6, #68b7dd, #18d7d3); padding: 6px 12px; border-radius: 0 12px 0 12px", ThemeConfig);
    console.log('资源根路径：', ThemeConfig.BASE_RES_URL);
  }
  // 读取主题模式
  var initThemeMode = function() {
    var curMode='';
    if (ThemeConfig.enable_auto_switch_mode) {
      var light_scope = ThemeConfig.light_time_scope.split("~");
      var now = new Date();
      var today = now.toLocaleString().split(" ")[0];
      var curMode = now >= new Date(today + " " + light_scope[0]) && now <= new Date(today + " " + light_scope[1]) ? "light" : "dark";
      localStorage.removeItem("data-mode");
    } else {
      if (ThemeConfig.static_mode === "off") {
        // 用户模式下会从本地取主题模式，默认为浅色
        curMode = localStorage.getItem("data-mode") || "light";
        localStorage.setItem("data-mode", curMode);
      } else {
        // 非用户模式下直接取后台配置的模式
        curMode = ThemeConfig.static_mode;
        localStorage.removeItem("data-mode");
      }
    }
    document.querySelector("html").setAttribute("data-mode", curMode);
  }
  initThemeMode();
  window.Joe = {
    BASE_API: "",
    isMobile: /windows phone|iphone|android/gi.test(window.navigator.userAgent)
  }
  var meting_api='https://api.mizore.cn/meting/api.php?server=:server&type=:type&id=:id';
</script>
<script type='text/javascript'>
        const handler = setInterval(function () { console.clear(); const before = new Date(); debugger; const after = new Date(); const cost = after.getTime() - before.getTime(); if (cost > 100) { } }, 1);
        //屏蔽右键菜单
        document.oncontextmenu = function (event) {
            if (window.event) {
                event = window.event;
            }
            try {
                var the = event.srcElement;
                if (!((the.tagName == "INPUT" && the.type.toLowerCase() == "text") || the.tagName == "TEXTAREA")) {
                    return false;
                }
                return true;
            } catch (e) {
                return false;
            }
        }
        //屏蔽粘贴
        document.onpaste = function (event) {
            if (window.event) {
                event = window.event;
            }
            try {
                var the = event.srcElement;
                if (!((the.tagName == "INPUT" && the.type.toLowerCase() == "text") || the.tagName == "TEXTAREA")) {
                    return false;
                }
                return true;
            } catch (e) {
                return false;
            }
        }
        //屏蔽复制
 
        //屏蔽剪切
        document.oncut = function (event) {
            if (window.event) {
                event = window.event;
            }
            try {
                var the = event.srcElement;
                if (!((the.tagName == "INPUT" && the.type.toLowerCase() == "text") || the.tagName == "TEXTAREA")) {
                    return false;
                }
                return true;
            } catch (e) {
                return false;
            }
        }
        //禁止f12
 
        function fuckyou() {
            window.open("/", "_blank"); //新窗口打开页面
            window.close(); //关闭当前窗口(防抽)
            window.location = "about:blank"; //将当前窗口跳转置空白页
        }
        //禁止Ctrl+U
        var arr = [123, 17, 18];
        document.oncontextmenu = new Function("event.returnValue=false;"), //禁用右键
 
            window.onkeydown = function (e) {
                var keyCode = e.keyCode || e.which || e.charCode;
                var ctrlKey = e.ctrlKey || e.metaKey;
                console.log(keyCode + "--" + keyCode);
                if (ctrlKey && keyCode == 85) {
                    e.preventDefault();
                }
                if (arr.indexOf(keyCode) > -1) {
                    e.preventDefault();
                }
            }
 
        function ck() {
            console.profile();
            console.profileEnd();
            //我们判断一下profiles里面有没有东西，如果有，肯定有人按F12了，没错！！
            if (console.clear) {
                console.clear()
            };
            if (typeof console.profiles == "object") {
                return console.profiles.length > 0;
            }
        }
 
        function hehe() {
            if ((window.console && (console.firebug || console.table && /firebug/i.test(console.table()))) || (
                typeof opera ==
                'object' && typeof opera.postError == 'function' && console.profile.length > 0)) {
                fuckyou();
            }
            if (typeof console.profiles == "object" && console.profiles.length > 0) {
                fuckyou();
            }
        }
        hehe();
        window.onresize = function () {
            if ((window.outerHeight - window.innerHeight) > 100)
                //判断当前窗口内页高度和窗口高度，如果差值大于100，那么呵呵
                fuckyou();
        }
 
        document.onkeydown = function (event) {
            if ((event.keyCode == 112) || //屏蔽 F1
                (event.keyCode == 113) || //屏蔽 F2
                (event.keyCode == 114) || //屏蔽 F3
                (event.keyCode == 115) || //屏蔽 F4
                // (event.keyCode == 116) || //屏蔽 F5
                (event.keyCode == 117) || //屏蔽 F6
                (event.keyCode == 118) || //屏蔽 F7
                (event.keyCode == 119) || //屏蔽 F8
                (event.keyCode == 120) || //屏蔽 F9
                (event.keyCode == 121) || //屏蔽 F10
                (event.keyCode == 122) || //屏蔽 F11
                (event.keyCode == 123)) //屏蔽 F12
            {
                return false;
            }
        }
        window.onhelp = function () {
            return false;
        }
</script>