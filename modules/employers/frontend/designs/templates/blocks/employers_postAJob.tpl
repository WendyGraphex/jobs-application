<div class="ModalAtJob modal fade" id="ModalPostAtJob" role="dialog">
    <div class="modal-dialog modal-lg modal-dialog-job-style"{*style="width: 50%;left: 35%;top: 20%;"*}>
        <div id="post-a-job-ctn" class="modal-content" style="height: 100%;overflow: auto;overflow-x: hidden;">               
            {if $from_callback && $employer_user}
                 {include file="./../employers_ajaxPostAJob.tpl"}
            {/if}
        </div>
    </div>
</div>
             
<script type="text/javascript">
    {JqueryScriptsReady}  
    
    {if $user->isAuthenticated() && $user->isEmployerUser()}
      $(".PostAJobBtn").click(function () {        
         return $.ajax2({   url:"{url_to('employers_ajax',['action'=>'PostNewAdvert'])}",                                
                                 target: "#post-a-job-ctn",
                                 success: function (resp)
                                    {
                                        $("#ModalPostAtJob").modal('show');   
                                    }
                });
         
    });   
    {else}    
        {if $from_callback && $employer_user}
              $("#ModalPostAtJob").modal('show');   
        {/if}    
        $(".PostAJobBtn").click(function () {        
             return $.ajax2({   url:"{url_to('employers_ajax',['action'=>'PostAJob'])}",                                
                                     target: "#post-a-job-ctn",
                                     success: function (resp)
                                        {
                                             $("#ModalPostAtJob").modal('show');   
                                        }
                    });

        });
       
    {/if}
    
    {/JqueryScriptsReady}
</script>    
