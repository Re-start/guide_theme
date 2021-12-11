<#-- 关键样式  -->
<style type="text/css">
  <#if settings.rip_mode>
    html {
      -webkit-filter: grayscale(100%);
      -moz-filter: grayscale(100%);
      -ms-filter: grayscale(100%);
      -o-filter: grayscale(100%);
      filter: grayscale(100%);
      filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
    } 
  </#if>
  @font-face {
    font-family: "Joe Font";
    font-weight: 400;
    font-style: normal;
    font-display: swap;
    <#if settings.custom_font?? && settings.custom_font!="">
      <#if settings.custom_font?ends_with(".woff")>
        <#assign fontFormat="woff">
      <#elseif settings.custom_font?ends_with(".woff2")>
        <#assign fontFormat="woff2">
      <#elseif settings.custom_font?ends_with(".ttf")>
        <#assign fontFormat="truetype">
      <#elseif settings.custom_font?ends_with(".eot")>
        <#assign fontFormat="embedded-opentype">
      <#elseif settings.custom_font?ends_with(".svg")>
        <#assign fontFormat="svg">
      <#else>
        <#assign fontFormat="xxx">
      </#if>
      src: url(${settings.custom_font}) format("${fontFormat}");
    <#elseif settings.web_font?? && settings.web_font!='off'>
      src: url(${BASE_RES_URL + "/source/font/" + settings.web_font}) format("${settings.web_font?split('.')[1]}");
    <#else>
    </#if>
  }
  html body {
    --theme: ${settings.mode_color_light!'#e62828'};
    font-family: "Joe Font", "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, "sans-serif";
  }
  html[data-mode='dark'] body {
    --theme: ${settings.mode_color_dark!'#9999ff'};
  }
  <#if settings.enable_background_light==true && settings.background_light_mode?? && settings.background_light_mode!=''>
    html[data-mode='light'] body {
      background-position: top center;
      background-attachment: fixed;
      background-repeat: no-repeat;
      background-size: cover;
      background-image: url(${settings.background_light_mode!});
    }
  <#else>
    html[data-mode='light'] body {
      background-image: none;
    }
  </#if>
  <#if settings.enable_background_dark==true && settings.background_dark_mode?? && settings.background_dark_mode!=''>
    html[data-mode='dark'] body {
      background-position: top center;
      background-attachment: fixed;
      background-repeat: no-repeat;
      background-size: cover;
      background-image: url(${settings.background_dark_mode!});
    }
  <#else>
    html[data-mode='dark'] body {
      background-image: none;
    }
  </#if>
  #Joe .joe_container {
    max-width: ${settings.content_max_width!'1320px'}!important;
  }
  #Joe .joe_header.active {
    top: ${settings.enable_fixed_header?string('0px', '-60px')}!important;
  }
</style>