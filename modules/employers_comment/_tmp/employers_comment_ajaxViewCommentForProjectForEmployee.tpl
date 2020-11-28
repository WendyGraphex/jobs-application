<div class="comment-form-wrap pt-5">
    <h3 class="mb-5">{__('Leave a comment')}</h3>   
{if $project->isLoaded()}
    <div class="p-5 bg-light">  
        {if $form->getLanguages()->count() == 1}
            <div class="form-group">                    
               {foreach $form->getLanguages() as $language}       
                    <div class="tab-pane fade show active Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">       
                        <div style="position: relative;">
                            <textarea name="message" id="message" data-lang="{$language->get('code')}" cols="30" rows="10" placeholder="{__('Your Comment')}" class="ProjectEmployeeCommentI18n Input textAreaGlobalClass"></textarea>           
                            <label id="charNumMessage" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        </div>
                    </div> 
                    {/foreach} 
            </div> 
        {else}                 
            <div class="form-group">                 
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                     {foreach $form->getLanguages() as $language}       
                    <li class="nav-item">            
                        <a class="nav-link active" id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                           {$language->getFormatter()->getText()->ucfirst()}   
                        </a>
                    </li> 
                    {/foreach}                  
                </ul>
                <div class="tab-content" style="padding-top: 10px;">
                     {foreach $form->getLanguages() as $language}       
                    <div class="tab-pane fade show active Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">       
                        <div style="position: relative;">
                            <textarea name="message" id="message" data-lang="{$language->get('code')}" cols="30" rows="10" placeholder="{__('Your Comment')}" class="ProjectEmployeeCommentI18n Input textAreaGlobalClass"></textarea>           
                            <label id="charNumMessage" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        </div>
                    </div> 
                    {/foreach} 
                </div>
            </div>        
        {/if}        
        <div class="form-group">
            <button id="ProjectEmployeeCommentSend"  class="btn py-3 px-4 btn-primary">{__('Post your comment')}</button>
        </div>
    </div>

</div>

<script type="text/javascript">
        
    $('#message').keyup(function () {
        $('#charNumMessage').text($(this).val().length >= {$form->i18n[0].message->getOption('max_length',500)} ? "{__('You have reached the limit')}" : {$form->i18n[0].message->getOption('max_length',500)} - $(this).val().length + "{__(' characters left')}");
    });
    
    
    {if $project->getWork()->getQuotation()->hasEmployeeAdvert()}
        $("#ProjectEmployeeCommentSend").click( function () {     
                if ($("#ProjectEmployeeCommentSend").hasClass('isBusy')) return ;
                $("#ProjectEmployeeCommentSend").addClass('isBusy');         
                var params = { Project: '{$project->get('id')}', ProjectEmployeeComment: { i18n : [], token : '{$form->getCSRFToken()}' } };
                $(".ProjectEmployeeCommentI18n.Input").each(function () {                     
                    params.ProjectEmployeeComment.i18n.push({ lang: $(this).attr('data-lang'), message : $(this).val() }); 
                });              
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('employers_comment_ajax',['action'=>'SendProjectEmployeeComment'])}",                               
                            success : function (resp)
                                {
                                    $("#ProjectEmployeeCommentSend").removeClass('isBusy');
                                    if (resp.action !='ProjectEmployeeComment') return ;                                  
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".ProjectEmployeeComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }   
                                    $("#ModalAddCommentReview").modal('hide');
                                   // $(".ProjectEmployeeCommentI18n.Input").val("");
                                }
                     });                                        
            }); 
     {else}
         $("#ProjectEmployeeCommentSend").click( function () {     
                if ($("#ProjectEmployeeCommentSend").hasClass('isBusy')) return ;
                $("#ProjectEmployeeCommentSend").addClass('isBusy');         
                var params = { Project: '{$project->get('id')}', ProjectEmployeeComment: { i18n : [], token : '{$form->getCSRFToken()}' } };
                $(".ProjectEmployeeCommentI18n.Input").each(function () {                     
                    params.ProjectEmployeeComment.i18n.push({ lang: $(this).attr('data-lang'), message : $(this).val() }); 
                });              
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('employees_comment_ajax',['action'=>'SendProjectEmployeeComment'])}",                               
                            success : function (resp)
                                {
                                    $("#ProjectEmployeeCommentSend").removeClass('isBusy');
                                    if (resp.action !='ProjectEmployeeComment') return ;                                  
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".ProjectEmployeeComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }   
                                    $("#ModalAddCommentReview").modal('hide');
                                   // $(".ProjectEmployeeCommentI18n.Input").val("");
                                }
                     });                                        
            }); 
    {/if}
</script>      
{else}
    {__('Project is invalid')}
{/if}    
