<div class="comment-form-wrap pt-5">
    <h3 class="mb-5">{__('Leave a comment')}</h3>
    <div class="p-5 bg-light">                                               
        <div style="position: relative;">
            <textarea id="message" placeholder="{__('Message')}" name="message" class="EmployeeComment Input textAreaGlobalClass" style="height: 135px !important;position: relative;"></textarea>
            <label id="charNumMessage" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
        </div>
        <div class="form-group">
            <button id="EmployeeCommentSend"  class="btn py-3 px-4 btn-primary">{__('Post Comment')}</button>
        </div>
    </div>
</div>



<script type="text/javascript">
    {JqueryScriptsReady}


    $('#message').keyup(function () {
        $('#charNumMessage').text($(this).val().length >= {$max_characters} ? "{__('You have reached the limit')}" : {$max_characters} - $(this).val().length + "{__(' characters left')}");
    });



    $("#EmployeeCommentSend").click( function () {                 
                var params = { EmployeeComment: { token : '{mfForm::getToken('EmployeeCommentSendForm')}' } };
                $(".EmployeeComment.Input").each(function () { params.EmployeeComment[$(this).attr('name')]=$(this).val(); });              
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('employees_comment_ajax',['action'=>'SendComment'])}",                               
                            success : function (resp)
                                {
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".EmployeeComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }                                  
                                }
                     });                                        
            });
    {/JqueryScriptsReady}
</script>                        