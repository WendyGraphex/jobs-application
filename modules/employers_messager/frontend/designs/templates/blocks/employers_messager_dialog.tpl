<div class="modal fade" id="DialogEmployerMessage" role="dialog"></div>
<script type="text/javascript">
    
   {JqueryScriptsReady}  

             
      
    $(".SendMessage").click(function () {        
         return $.ajax2({ data:  { EmployerMessageDialog : $(this).attr('data-employer') },
                        url:"{url_to('employers_messager_ajax',['action'=>'SendMessageToEmployerDialog'])}",     
                        success : function () {  $("#DialogEmployerMessage").modal('show');  },
                        target: "#DialogEmployerMessage"
                }); 
     });
     
   {/JqueryScriptsReady}        
       
</script>   

<div id="myModalContactUser" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="text-align:center;color: #109310;">
            <i class="mdi mdi-check-circle" style="font-size: 45px;"></i><p style="font-size: 19px;">{__('Your Message has been sent')}
                <span style="font-weight: 700;color: #187d28;" class="EmployerRequestDialog-text"></span>
            </p>
        </div>
      </div>
    </div>
</div>