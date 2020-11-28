<div class="comment-form-wrap pt-5">
    <h3 class="mb-5">{__('Leave a comment')}</h3>   
    <div class="p-5 bg-light">  
        {if $form->getLanguages()->count() > 1}
             {$language->getFormatter()->getText()->ucfirst()}   
             
             
             
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
                            <textarea name="message" id="message" data-lang="{$language->get('code')}" cols="30" rows="10" placeholder="{__('Your Comment')}" class="EmployeeAdvertCommentI18n Input textAreaGlobalClass"></textarea>           
                            <label id="charNumMessage" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        </div>
                    </div> 
                    {/foreach} 
                </div>
            </div>        
        {/if}        
        <div class="form-group">
            <button id="EmployeeAdvertCommentSend"  class="btn py-3 px-4 btn-primary">{__('Post Comment')}</button>
        </div>
    </div>

</div>



<script type="text/javascript">
    {JqueryScriptsReady}
        
    $('#message').keyup(function () {
        $('#charNumMessage').text($(this).val().length >= {$max_characters} ? "{__('You have reached the limit')}" : {$max_characters} - $(this).val().length + "{__(' characters left')}");
    });
        
    $("#EmployeeAdvertCommentSend").click( function () {                 
                var params = { EmployeeAdvertComment: { i18n : [], advert_id : '{$advert_i18n->getAdvert()->get('id')}', advert_lang : '{$advert_i18n->get('lang')}', token : '{mfForm::getToken('EmployeeAdvertCommentSendForm')}' } };
                $(".EmployeeAdvertCommentI18n.Input").each(function () {                     
                    params.EmployeeAdvertComment.i18n.push({ lang: $(this).attr('data-lang'), message : $(this).val() }); 
                });              
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('employees_comment_ajax',['action'=>'SendAdvertComment'])}",                               
                            success : function (resp)
                                {
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".EmployeeAdvertComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }   
                                    $(".EmployeeAdvertCommentI18n.Input").val("");
                                }
                     });                                        
            }); 
    {/JqueryScriptsReady}
</script>                          