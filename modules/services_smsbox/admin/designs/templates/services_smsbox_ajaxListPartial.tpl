{messages class="site-errors"}
<h3>{__("SMS box")|capitalize}</h3>
<div>    



</div>


<script type="text/javascript">


    
         
        $('#Settings').click(function(){                  
                  return $.ajax2({ 
                                   url: "{url_to('services_smsbox_ajax',['action'=>'Settings'])}",
                                   errorTarget: ".site-errors",
                                   target: "#actions"}); 
         });
             
             

      

</script>
