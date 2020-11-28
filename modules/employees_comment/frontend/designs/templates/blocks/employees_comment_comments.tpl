<div class="comments-onProfile">
    <h4>{__('Comments')}</h4>
    <h3 class="mb-5">{*$pager->getNumberOfComments()->getChoices()*}</h3>
    <ul class="comment-list">
        {*foreach $pager as $item*}
            <li class="comment">
                <div class="vcard bio">
                    {*if $item->getEmployerUser()->hasAvatar()}
                        <img src="{$item->getEmployerUser()->getAvatar()->getThumb()->getUrl()}" class="profile-pict-img" alt="{$item->getEmployerUser()->get('username')}">         
                    {else*}    
                        <img src="/web/pictures/person_1.jpg" alt="Image placeholder">
                    {*/if*}
                </div>
                <div class="comment-body">
                    <h3><strong>{*$item->getEmployerUser()->getFormatter()->getUsername()*}eeee</strong></h3>
                    <div class="meta">{*$item->getFormatter()->getCreatedAt()->getText('D','q')*}cvvvvv</div>
                    {*foreach $item->getI18ns() as $i18n}
                        <p>{$i18n->getFormatter()->getComment()->ucfirst()|escape}</p>                          
                    {/foreach*}                                     
                     <p><a href="#" class="reply">{__('Reply')}</a></p>    
                </div>
            </li>
        {*/foreach*}       
    </ul>
    {*if $pager->count() > 10}
    <div style="cursor: pointer;color: #222;">
        <a href="">{__('See next comment')}</a><i class="mdi mdi-arrow-right"></i>
    </div>
    {/if*}
    {*component name="/employees_comment/addAdvertComment"*}
</div>
<script type="text/javascript">
    
</script>
