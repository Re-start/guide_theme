
<#macro series>
<section class="joe_aside__item newest">
    <div class="joe_aside__item-title">
        <i class="joe-font joe-icon-line-quillpenyumaobi"></i>
        <span class="text">相关推荐</span>
    </div>
    <div class="joe_aside__item-contain">
        <ul class="list">       
            <#list seriesItems as seriesItem>
            <li class="item">
                <a class="link" href="${seriesItem.url!}" title="${seriesItem.title!}">${seriesItem.title!}</a>
                <i class="joe-font joe-icon-link"></i>
            </li>
            </#list>
        </ul>
    </div>
</section>
</#macro>