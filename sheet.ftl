<!DOCTYPE html>
<html lang="zh-CN">
  <#import "template/macro/header.ftl" as headInfo>
  <@headInfo.head title="${sheet.title}" type="sheet"/>
  <#import "template/macro/tail.ftl" as tailInfo>
  <body>
    <div id="Joe">
      <#include "template/common/navbar.ftl">
      <div class="joe_container joe_main_container page-sheet">
        <div class="joe_main">
          <div class="joe_detail">
            <h1 class="joe_detail__title txt-shadow" data-sheetid="${sheet.id}">${sheet.title}</h1>
            <div class="joe_detail__count">
              <div class="joe_detail__count-information">
                <img width="35" height="35" class="avatar lazyload" src="${settings.lazyload_avatar!}" data-src="${user.avatar!}" alt="${user.nickname!}">
                <div class="meta">
                  <div class="author">
                      <a class="link" href="${blog_url}/s/about" title="${user.nickname!}">${user.nickname!}</a>
                  </div>
                  <div class="item">
                    <span class="text">${sheet.createTime?string('yyyy-MM-dd')}</span>
                    <span class="line">/</span>
                    <span class="text">${sheet.commentCount} 评论</span>
                    <span class="line">/</span>
                    <span class="text" >${sheet.visits} 阅读</span>    
                    <span class="line">/</span>
                    <span class="text" >${sheet.wordCount!0} 字</span>
                    <#if settings.check_baidu_collect!false>
                      <span class="line">/</span>
                      <span class="text" id="joe_baidu_record">正在检测是否收录...</span>
                    </#if>
                  </div>
                </div>
              </div>
              <time class="joe_detail__count-created" datetime="${sheet.createTime?string('MM/dd')}">${sheet.createTime?string('MM/dd')}</time>
            </div>
            <#--  <#if sheet.thumbnail?? && sheet.thumbnail!=''>
              <img class="lazyload" data-src="${sheet.thumbnail}" src="${BASE_RES_URL!}/source/img/lazyload.gif" alt="封面"/>
            </#if>  -->
            <article class="joe_detail__article animated fadeIn${settings.enable_code_line_number?string(' line-numbers', '')}">
              ${sheet.formatContent!}
            </article>
            <#--  <#import "template/common/post_copyright.ftl" as pc>  -->
            <#--  <@pc.post_copyright post_url="${sheet.fullPath}"/>  -->
          </div>
          <#if settings.enable_clean_mode!=true>
            <div class="joe_comment">
              <#if sheet.disallowComment=true>
                <div class="joe_comment__close">
                  <svg class="joe_comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                    <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                  </svg>
                  <span>博主关闭了当前页面的评论</span>
                </div>
              <#else>
                <#include "template/macro/comment.ftl">
                <@comment target=sheet type="sheet"/>
              </#if>
            </div>
          </#if>
        </div>
        <#include "template/common/aside.ftl">
      </div>
      <#include "template/common/footer.ftl">
    </div>
    <@tailInfo.tail type="sheet"/>
  </body>
</html>