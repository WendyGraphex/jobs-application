{if $employer}
<div>
    <button type="button" id="AddReview-btn" class="btn btn-primary">{__('Add review for %s',$employer->get('username'))}</button>
</div>

{*---------------------------Begin--------------------------*}
<div class="modal fade" id="ModalAddReview" role="dialog">
    <div class="modal-dialog modal-lg modalPositionGlobal">
        <div class="modal-content" style="text-align: center;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="modal-review-ctn" class="modal-body" style="padding-top: 0px;">               
            </div>
        </div>
    </div>
</div>
{*-----------------------------End--------------------------*}
<script type="text/javascript">
   {JqueryScriptsReady} 
          
    $("#AddReview-btn").click(function () {                           
                return $.ajax2({ 
                            data : { EmployerReview : { employer_user_id : '{$employer->get('username')}', advert_i18n_id : '{$advert_i18n->get('id')}' , token : '{mfForm::getToken('AddEmployerNotationForm')}' } },
                            url :"{url_to('employees_notation_ajax',['action'=>'AddEmployerNotation'])}",
                            target : '#modal-review-ctn',
                            success : function (resp)
                                {
                                    $('#ModalAddReview').appendTo("body").modal('show');                                   
                                }
                     });                                        
            });    
    
    {/JqueryScriptsReady}
</script>
{/if}
