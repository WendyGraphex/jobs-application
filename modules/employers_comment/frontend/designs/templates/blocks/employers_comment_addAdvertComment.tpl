<div class="comment-form-wrap pt-5">
    <h3 class="mb-5">{__('Leave a comment')}</h3>   
    <div class="p-5 bg-light">                   
        {foreach $form->getLanguages() as $language}
            {if $form->getLanguages()->count() > 1}
                {$language->getFormatter()->getText()->ucfirst()}
            {/if} 
            <div class="form-group">
                <label for="message">{__('Message')}</label>
                {*<textarea name="message" id="message" data-lang="{$language}" cols="30" rows="10" class="EmployerAdvertCommentI18n Input form-control"></textarea>*}
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">            
                        <a class="nav-link active" id="language-en-tab" data-toggle="tab" href="#en" role="tab" aria-controls="en" aria-selected="true">
                            {__('English')}
                        </a>
                    </li> 
                    <li class="nav-item">            
                        <a class="nav-link" id="language-fr-tab" data-toggle="tab" href="#fr" role="tab" aria-controls="fr" aria-selected="true">
                            {__('French')}
                        </a>
                    </li>
                </ul>
                <div class="tab-content" style="padding-top: 10px;">
                    <div class="tab-pane fade show active Languages" id="en" role="tabpanel" aria-labelledby="language-en-tab">                 
                        <div style="position: relative;">
                           <textarea name="message" id="message" data-lang="{$language}" cols="30" rows="10" placeholder="{__('English Comment')}" class="EmployerAdvertCommentI18n Input textAreaGlobalClass"></textarea> 
                            <label id="charNumMessage" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        </div>        
                    </div> 
                        
                    <div class="tab-pane fade show Languages" id="fr" role="tabpanel" aria-labelledby="language-fr-tab">    
                        <div style="position: relative;">
                           <textarea name="message" id="message" data-lang="{$language}" cols="30" rows="10" placeholder="{__('Frensh Comment')}" class="EmployerAdvertCommentI18n Input textAreaGlobalClass"></textarea> 
                            <label id="charNumMessage" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        </div>
                    </div> 
                </div>
            </div>
        {/foreach}  
        <div class="form-group">
            <button id="EmployerAdvertCommentSend"  class="btn py-3 px-4 btn-primary">{__('Post Comment')}</button>
        </div>
    </div>

</div>



<script type="text/javascript">
    {JqueryScriptsReady}
        
    $('#message').keyup(function () {
        $('#charNumMessage').text($(this).val().length >= {$max_characters} ? "{__('you have reached the limit')}" : {$max_characters} - $(this).val().length + "{__(' characters left')}");
    });
        
        
    $("#EmployerAdvertCommentSend").click( function () {                 
                var params = { EmployerAdvertComment: { i18n : [], advert_id : '{$advert_i18n->getAdvert()->get('id')}', advert_lang : '{$advert_i18n->get('lang')}', token : '{mfForm::getToken('EmployerAdvertCommentSendForm')}' } };
                $(".EmployerAdvertCommentI18n.Input").each(function () {                     
                    params.EmployerAdvertComment.i18n.push({ lang: $(this).attr('data-lang'), message : $(this).val() }); 
                });              
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('employers_comment_ajax',['action'=>'SendAdvertComment'])}",                               
                            success : function (resp)
                                {
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".EmployerAdvertComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }                                  
                                }
                     });                                        
            });
    {/JqueryScriptsReady}
</script>        