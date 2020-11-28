<input type="text" readonly="" placeholder="{__('Amount')}" id="Amount" value="{$project->getWork()->getFormatter()->getTotalPaidAndAcceptedWithTax()->getAmount()}"/>
<div style="text-align: center;padding: 10px;">
    <button id="SendPayAll" class="btn btn-success">{__('Paid all')}</button>
</div>
<script type="text/javascript">
    
       $("#SendPayAll").click(function() { 
            return $.ajax2({ data : { Project : '{$project->get('id')}'  },
                           url: "{url_to('employees_work_ajax',['action'=>'SaveDialogPayAllForEmployer'])}",                           
                           success : function (resp) {                                                                                                              
                                        $('#ModalAmountRequest').modal('hide');                                                                             
                                        $("#actions").html(resp);   
                                    }
                            }); 
       });
        
        
</script>
