  
    <a href="#" id="Callbacks" class="btn"><i class="fa fa-list" style=" margin-right: 10px"></i>{__('Callbacks')}</a>



<script type="text/javascript">


    
         
        $('#Callbacks').click(function(){                  
                  return $.ajax2({ 
                                   url: "{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",
                                   errorTarget: ".site-errors",
                                   target: "#actions"}); 
         });
             
             

      

</script>

