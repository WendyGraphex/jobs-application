{if $project->isLoaded()}
<input type="text" id="ProjectStartAtDate" placeholder="{__('Enter started date')}" value="{if $project->hasStartAt()}{$project->getFormatter()->getStartAt()->getText()}{/if}"/>
<div style="margin-top: 10px;text-align: center;">
    <button id="Modify" class="btn btn-success">{__('Modify')}</button>
</div>
 
<script type="text/javascript">
   
     
        $( "#ProjectStartAtDate" ).datepicker({ minDate: 0 {if $project->hasEndAt()},maxDate: '{$project->getFormatter()->getEndAt()->getText()}'{/if} });
        
        $("#ProjectStartAtDate").click(function(){
            $("#ProjectStartAtDate").removeClass('intro');
        });
         
        $("#Modify").click(function(){  
            $("#ProjectStartAtDate").removeClass('intro');
            return $.ajax2({ data : { Project : '{$project->get('id')}'  , ProjectDate: {  start_at : $("#ProjectStartAtDate").val(), token : '{$form->getCSRFToken()}' } },
                           url: "{url_to('projects_ajax',['action'=>'ModifyStartAtDialogForEmployee'])}",   
                           success : function (resp) { 
                                if (resp.errors)
                                {
                                    $("#ProjectStartAtDate").addClass('intro');
                                    return ;
                                }   
                                $("#ModalDateDialog").modal('hide'); 
                                $(".ColumnStartAt[id={$project->get('id')}]").html(resp.start_at);
                            }
                        });
        });   
</script> 

{/if}