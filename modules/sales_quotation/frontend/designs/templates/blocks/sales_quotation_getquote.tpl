{if $item_i18n}
    <div class="modal fade" id="DialogEmployeeQuote" role="dialog">
        {include file="./../sales_quotation_ajaxGetQuoteDialog.tpl"}
    </div>   
      <script type="text/javascript">
    
   {JqueryScriptsReady}  
          
          $("#DialogEmployeeQuote").modal('show');  
          
          $(".ModalGetQuote-close").click(function(){ 
               return $.ajax2({ url :"{url_to('sales_quotation_ajax',['action'=>'RemoveRequest'])}",   
                                success : function () {  $("#DialogEmployeeQuote").modal('hide');   },                              
                            });            
          });
           
   {/JqueryScriptsReady}        
       
</script> 
{else}
    <div class="modal fade" id="DialogEmployeeQuote" role="dialog"></div>   
    <script type="text/javascript">
    
   {JqueryScriptsReady}  
                           
        $(".EmployeeAdvertQuote").click(function () { 

               return $.ajax2({ data : { EmployeeAdvertI18n: $(this).attr('id') },               
                                url :"{url_to('sales_quotation_ajax',['action'=>'GetQuoteDialog'])}",   
                                success : function () {  $("#DialogEmployeeQuote").modal('show'); },
                                target :"#DialogEmployeeQuote"
                            }); 

        });
       
   {/JqueryScriptsReady}        
       
</script> 
{/if}   
 
<div id="myModalMO" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
          <div class="modal-body" style="text-align:center;color: #109310;">
              <i class="mdi mdi-check-circle" style="font-size: 45px;"></i>
                <p style="font-size: 19px;">{__('Your request has been sent to')} 
                  <span style="font-weight: 700;color: #187d28;" id="EmployeeRequestDialog-text"></span>
                </p>
        </div>
      </div>
    </div>
</div>        
                  