<div class="ModalAtJob modal fade" id="ModalWantAJob" role="dialog">
    <div class="modal-dialog modal-lg modal-dialog-job-style" {*style="width: 50%;left: 35%;top: 20%;"*}>
        <div id="want-a-job-ctn" class="modal-content" style="height: 100%;overflow: auto;overflow-x: hidden;">
            {if $from_callback && $employee_user}
                 {include file="./../employees_ajaxWantAJob.tpl"}
            {/if}
        </div>
    </div>
</div>
<script type="text/javascript">
    {JqueryScriptsReady}  
    
    {if $user->isAuthenticated() && $user->isEmployee()}
        $(".WantAJobBtn").click(function () {        
         return $.ajax2({   url:"{url_to('employees_ajax',['action'=>'WantNewAdvert'])}",                                
                                target: "#want-a-job-ctn",
                                success: function (resp)
                                {
                                    $("#ModalWantAJob").modal('show');   
                                }
                });
        });   
    {else}    
        {if $from_callback && $employee_user}
             $("#ModalWantAJob").modal('show');   
        {/if} 
        $(".WantAJobBtn").click(function () {        
             return $.ajax2({   url:"{url_to('employees_ajax',['action'=>'WantAJob'])}",                                
                                     target: "#want-a-job-ctn",
                                     success: function (resp)
                                        {
                                             $("#ModalWantAJob").modal('show');   
                                        }
                    });
        });      
    {/if}
    
    {/JqueryScriptsReady}
</script>    
