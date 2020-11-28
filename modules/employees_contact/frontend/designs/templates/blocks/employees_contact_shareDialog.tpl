 <div id="DialogShareAdvert" class="modal fade" role="dialog">
</div>

<script type="text/javascript">
    
   {JqueryScriptsReady}  
       
     $(".ShareAdvertContact").click(function () {        
         return $.ajax2({ data:  { EmployeeAdvertI18n : { url : $(this).attr('data-url') , lang : $(this).attr('data-lang') } },
                        url:"{url_to('employees_contact_ajax',['action'=>'ShareDialog'])}",     
                        success : function () { $("#DialogShareAdvert").modal('show'); },
                        target: "#DialogShareAdvert"
                }); 
     });
  
       
   {/JqueryScriptsReady}        
       
</script> 
<div class="modal fade myModalEmailShare" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="text-align:center;color: #109310;">
            <i class="mdi mdi-check-circle" style="font-size: 45px;"></i><p style="font-size: 19px;">{__('Your Message has been sent')}
                <span style="font-weight: 700;color: #187d28;" class="EmployeeRequestDialog-text"></span>
            </p>
        </div>
      </div>
    </div>
</div>