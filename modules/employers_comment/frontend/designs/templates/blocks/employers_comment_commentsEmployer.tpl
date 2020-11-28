<div class="comments-onProfile">
    <h4>{__('Comments')}</h4>
    <h3 class="mb-5">{$pager->getNumberOfComments()->getChoices()}</h3>
    <ul class="comment-list">
        {foreach $pager as $item}
            <li class="comment">
                <div class="vcard bio">
                    {if $item->getEmployeeUser()->hasAvatar()}
                        <img src="{$item->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}" class="profile-pict-img" alt="{$item->getEmployeeUser()->get('username')}">         
                    {else}    
                        <img src="/web/pictures/person_1.jpg" alt="Image placeholder">
                    {/if}
                </div>
                <div class="comment-body">
                    <h3><strong>{$item->getEmployeeUser()->getFormatter()->getUsername()}</strong></h3>          
                    <div class="meta">{$item->getFormatter()->getCreatedAt()->getText('D','q')}</div>
                    {foreach $item->getI18ns() as $i18n}
                        <p>{$i18n->getFormatter()->getComment()->ucfirst()|escape}</p>
                        {* <p><a href="javascript:void(0);" id="reply-btn" class="reply">{__('Reply')}</a></p>*}
                        {/foreach}  
                </div>
            </li>
        {/foreach}       
    </ul>
     {if $pager->count() > 10}
    <div style="cursor: pointer;color: #222;">
        <a href="">{__('See next comment')}</a><i class="mdi mdi-arrow-right"></i>
    </div>
    {/if}

    
</div>
<script type="text/javascript">
  
</script>

