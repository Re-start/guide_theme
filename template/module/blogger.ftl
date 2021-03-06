<section class="joe_aside__item author">
  <img width="100%" height="120" class="image lazyload" data-src="${(settings.author_bg!='')?then(settings.author_bg,BASE_RES_URL+'/source/img/author_bg.jpg')}" src="${EMPTY_IMG!}" onerror="this.src='${EMPTY_IMG!}'" alt="博主栏壁纸">
  <div class="user">
    <div class="avatar_wrapper ${settings.avatar_type!}">
      <img class="avatar lazyload" data-src="${(user.avatar?? && user.avatar!='')?then(user.avatar,default_avatar)}" src="${settings.lazyload_avatar!}" onerror="this.src='${settings.default_avatar!}'" alt="博主头像"/>
      <#if settings.avatar_frame?? && settings.avatar_frame!="0">
        <img class="avatar_frame ${settings.avatar_frame}" src="${BASE_RES_URL!}/source/frame/${settings.avatar_frame!}.png" onerror="this.src='${EMPTY_IMG!}'" alt="挂架"/>
      </#if>
      <#if settings.avatar_widget?? && settings.avatar_widget!="0">
        <img class="avatar_widget ${settings.avatar_widget}" src="${BASE_RES_URL!}/source/widget/${settings.avatar_widget!}.gif" onerror="this.src='${EMPTY_IMG!}'" alt="相框"/>
      </#if>
    </div>
    <a class="link" href="${blog_url!}" target="_blank" rel="noopener noreferrer nofollow">
      ${user.nickname!}
      <#if settings.show_level!true>
        <@postTag method="count">
          <#if count gte 1 && count lt 20><#assign level=1></#if>
          <#if count gte 20 && count lt 50><#assign level=2></#if>
          <#if count gte 50 && count lt 100><#assign level=3></#if>
          <#if count gte 100 && count lt 300><#assign level=4></#if>
          <#if count gte 300 && count lt 500><#assign level=5></#if>
          <#if count gte 500><#assign level=6></#if>
          <img class="level" src="${BASE_RES_URL!}/source/img/lv${level}.png" onerror="this.src='${EMPTY_IMG!}'" alt="等级"/>
        </@postTag>
      </#if>
    </a>
    <#if settings.motto??>
      <p class="motto joe_motto">${settings.motto!}</p>
    <#else>
      <#if settings.enable_day_words>
        <img class="motto_day_words" height="14" src="https://v2.jinrishici.com/one.svg?font-size=146&spacing=2&color=grey"/>
      <#else>
        <p class="motto joe_motto">${user.description!}</p>
      </#if>
    </#if>
  </div>
  <div class="count">
    <#--  <@visitTag method="count">
      <div class="item" title="累计访问数 ${count!}">
        <span class="num">${count!"0"}</span>
        <span>访问量</span>
      </div>
    </@visitTag>  -->
    <@tagTag method="count">
      <div class="item" title="累计标签数 ${count!}">
        <span class="num">${count!"0"}</span>
        <span>标签数</span>
      </div>
    </@tagTag>
    <@postTag method="count">
      <div class="item" title="累计文章数 ${count!}">
        <span class="num">${count!"0"}</span>
        <span>文章数</span>
      </div>
    </@postTag>
    <@commentTag method="count">
      <div class="item" title="累计评论数 ${count!}">
        <span class="num">${count!"0"}</span>
        <span>评论量</span>
      </div>
    </@commentTag>
  </div>
  <#if settings.enable_weather==true && settings.weather_key?? && settings.weather_key!=''>
    <div id="he-plugin-simple"></div>
  </#if>
  <#if settings.enable_social>
    <#include "social.ftl">
  </#if>
  <#if settings.enable_strips>
    <canvas id="canvas-strips" width="300" height="340"></canvas>
    <script src="${BASE_RES_URL}/source/effect/bg/strips.js"></script>
  </#if>
</section>