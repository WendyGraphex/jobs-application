<div id="ModalBookEvent" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="ModalBookEvent-ctn" class="modal-body" style="padding-top: 0px;">
               
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    {JqueryScriptsReady}     
            
    $(".BookEvent").click(function() {        
        return $.ajax2({    data : { SiteEvent : $(this).attr('id') },                    
                            url: "{url_to('site_event_cart_ajax',['action'=>'SelectQuantityToCart'])}",
                            success : function (resp)
                            {                              
                                $("#ModalBookEvent").modal('show');
                            },
                            target :'#ModalBookEvent-ctn'
                    });
    });
        
   {/JqueryScriptsReady}
</script>
  
