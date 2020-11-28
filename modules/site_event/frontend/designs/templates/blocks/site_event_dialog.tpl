<div class="modal fade" id="DialogEmployerMessage" role="dialog"></div>
<script type="text/javascript">
    
   {JqueryScriptsReady}  

             
      
    $("#BookEvent").click(function () { 
         return $.ajax2({ data:  { SiteEventDialog : $(this).attr('data-event') },
                        url:"{url_to('site_event_ajax',['action'=>'BookEventDialog'])}",     
                        success : function () {  $("#DialogBookEvent").modal('show');  },
                        target: "#DialogBookEvent"
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