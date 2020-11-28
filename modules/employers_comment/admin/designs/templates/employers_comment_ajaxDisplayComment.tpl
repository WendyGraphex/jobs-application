{if $comment->isLoaded()} 
   {if $comment->isActive()}     
<h4 style="margin-bottom: 25px;">{__('Publish Comments - published at %s',(string)$comment->getFormatter()->getPublishedAt()->getText())}</h4>
{else}
    <h4 style="margin-bottom: 25px;">{__('Publish Comments')}</h4>
{/if}    
 <div class="form-group">                 
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                     {foreach $comment->getI18ns()->getAll() as $i18n}       
                    <li class="nav-item">            
                        <a class="nav-link active" id="language-{$i18n->get('lang')}-tab" data-toggle="tab" href="#{$i18n->get('lang')}" role="tab" aria-controls="{$i18n->get('code')}" aria-selected="true">
                           {$i18n->getLanguage()->getText()->ucfirst()} 
                        </a>
                    </li> 
                    {/foreach}                  
                </ul>
                <div class="tab-content" style="padding-top: 10px;">
                     {foreach $comment->getI18ns()->getAll() as $i18n}       
                    <div class="tab-pane fade show active Languages" id="{$i18n->get('lang')}" role="tabpanel" aria-labelledby="language-{$i18n->get('lang')}-tab">       
                        <div style="position: relative;">
                            <textarea class="form-control" readonly cols="30" rows="10" >{$i18n->getFormatter()->getMessage()}</textarea>                                    
                        </div>
                    </div> 
                    {/foreach} 
                </div>
            </div>  
              {if !$comment->isActive()}  
                <div style="text-align: center;padding: 20px 0px 0px 0px;">
                    <button id="Publish" class="btn btn-success">{__('Publish')}</button>
                </div>  
{/if}
                
                <script type="text/javascript">
    
   
        {if !$comment->isActive()}      
       $("#Publish").click( function () {                    
                  return $.ajax2({ data : { EmployerComment : '{$comment->get('id')}' },                               
                                  url:"{url_to('employers_comment_ajax',['action'=>'PublishComment'])}", 
                                  success : function (resp) { 
                                      if (resp.action != 'PublishComment') return ;
                                      $(".Comment[name=published_at][id="+resp.id+"]").html(resp.published_at);
                                      $("#ModalComment").modal('hide'); 
                                  }                    
                                 });
          });
          {/if}
</script>
{else}
    {__('Comment is invalid.')}
{/if}    