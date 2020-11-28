{if $project->isLoaded()}
<input type="text" id="ProjectEndAtDate" placeholder="{__('Enter end date')}" value="{if $project->hasEndAt()}{$project->getFormatter()->getEndAt()->getText()}{/if}"/>
<div style="margin-top: 10px;text-align: center;">
    <button id="Modify" class="btn btn-success">{__('Modify')}</button>
</div>
 
<script type="text/javascript">
   
     
        $( "#ProjectEndAtDate" ).datepicker({ minDate: {if $project->hasStartAt()}'{$project->getFormatter()->getStartAt()->getText()}'{else}0{/if} });
        
        $("#ProjectEndAtDate").click(function(){
            $("#ProjectEndAtDate").removeClass('intro');
        });
        
        $("#Modify").click(function(){    
            $("#ProjectEndAtDate").removeClass('intro');
          return $.ajax2({ data : { Project : '{$project->get('id')}' , ProjectDate: {  end_at : $("#ProjectEndAtDate").val(), token : '{$form->getCSRFToken()}' } },
                           url: "{url_to('projects_ajax',['action'=>'ModifyEndAtDialogForEmployee'])}",   
                           success : function (resp) { 
                                if (resp.errors)
                                {
                                    $("#ProjectEndAtDate").addClass('intro');
                                    return ;
                                }    
                                $("#ModalDateDialog").modal('hide');  
                                $(".ColumnEndAt[id={$project->get('id')}]").html(resp.end_at);
                            }
                        });
        });    
</script> 

{/if}