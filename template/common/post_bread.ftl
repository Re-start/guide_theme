<div class="joe_container joe_bread">
  <ul class="joe_bread__bread">
    <li class="item">
      <i class="joe-font joe-icon-shouye"></i>&nbsp;
      <a href="${blog_url!}" class="link" title="首页">首页</a>
    </li>
    <#list categories as category>
      <#if category_index==1>
        <li class="line">/</li>
        <li class="item">
          <a class="link" href="${category.fullPath!}" title="${category.name!}">${category.name!"默认分类"}</a>
        </li>
      </#if>
    </#list>
    <li class="line">/</li>
    <li class="item">正文</li>
  </ul>
</div>