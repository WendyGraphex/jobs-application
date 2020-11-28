{messages class="site-smsbox-callback-errors"}
<h3>{__("SMS box callback test")}</h3>
<div>        
    <a href="javascript:void(0);" id="SmsBoxCallback-Cancel" class="btn" ><i class="fa fa-times" style="margin-right: 10px;"></i>{__('Cancel')}</a>
</div>

<script type="text/javascript">

   
    $('#SmsBoxCallback-Cancel').click(function(){ 
        return $.ajax2({ url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",
                        errorTarget: ".site-smsbox-callback-errors",
                        target: "#actions" 
                }); 
    });
  
</script>

