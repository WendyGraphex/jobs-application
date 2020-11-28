 <div id="DialogAbuseAdvert" class="modal fade" role="dialog">
</div>

<script type="text/javascript">
    
   {JqueryScriptsReady}  
       
     $(".AbuseAdvertContact").click(function () {        
         return $.ajax2({ data:  { EmployerAdvertI18n : { url : $(this).attr('data-url') , lang : $(this).attr('data-lang') } },
                        url:"{url_to('employers_contact_ajax',['action'=>'AbuseDialog'])}",     
                        success : function () { $("#DialogAbuseAdvert").modal('show'); },
                        target: "#DialogAbuseAdvert"
                }); 
     });
  
       
   {/JqueryScriptsReady}        
       
</script>   

<div class="modal fade myModalEmailAbuse" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="text-align:center;color: #109310;">
            <i class="mdi mdi-check-circle" style="font-size: 45px;"></i><p style="font-size: 19px;">{__('Your message has been sent to administrator.')}               
            </p>
        </div>
      </div>
    </div>
</div>