{if $employee}   
<div>
    <button type="button" id="AddReview-btn" class="btn btn-primary">{__('Add review for %s',$employee->get('username'))}</button>
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
                            data : { EmployeeReview : { employee_user_id : '{$employee->get('username')}', advert_i18n_id : '{$advert_i18n->get('id')}' , token : '{mfForm::getToken('AddEmployeeNotationForm')}' } },
                            url :"{url_to('employees_notation_ajax',['action'=>'AddEmployeeNotation'])}",
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