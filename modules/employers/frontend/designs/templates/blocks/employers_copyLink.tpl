<div class="modal fade" id="DialogContact" role="dialog">
    <div class="ModalContactUser modal-dialog modal-lg" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div style="text-align: center;">
                    <h2 class="sharing-title">Share This Advert</h2>
                    <div class="sharing-description">
                        <p style="font-size: 18px;">Spread the word about this Advert on Graphex</p>
                    </div>
                    <ul class="shareTo-social-network">
                        <li>
                            <img src="/web/pictures/facebook.png"/>
                            <label>Facebook</label>
                        </li>
                        <li>
                            <img src="/web/pictures/linkdin.png"/>
                            <label>LinkedIn</label>
                        </li>
                        <li>
                            <img src="/web/pictures/twitter.png"/>
                            <label>Twitter</label>
                        </li>
                        <li>
                            <img src="/web/pictures/whatssap.png"/>
                            <label>Whatsapp</label>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
   {JqueryScriptsReady}  
       
    $('#MessageModalDialog').keyup(function () {                         
        $('#charNumDialog').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
    
    $(".shareAdEmpl").click(function () {
        $("#DialogContact").modal('show'); 
    });
       
   {/JqueryScriptsReady}        
       
</script>   