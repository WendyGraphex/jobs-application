<div class="row admin-header-container">
    <div class="col-sm">
      <h3>{__('Configurations')}</h3>
      <h3 class="admin-header-small-text">{__('Sale Employer rate commissions')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
          <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div> 
    </div>
</div>
<div class="breadcrumb-title">
    <p>                
        <i class="fa fa-home" style="color: #37bc9b;"></i>              
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sale Employer Commissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sale Rate Commissions')}
    </p>
</div>
{alerts}
{if $item->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">   
         <div class="row">    
             <div class="form-group col-md-1">                                            
                 #
                </div>
                <div class="form-group col-md-1">                                            
                        {__('From')}                  
                </div> 
                 <div class="form-group col-md-1">                        
                     {__('To')}      
                </div> 
                 <div class="form-group col-md-2">                        
                    {__('Fix')}      
                </div> 
                 <div class="form-group col-md-2">                        
                     {__('Rate')}      
                </div> 
           </div>   
         <div id="SaleEmployerCommissionRate-ctn">
         {foreach $form->rates->getSchema() as $index=>$rate}
             <div class="ctn" data-index="{$index}">
                <div class="row">           
                    <div class="form-group col-md-1 Index">                                            
                        {$index+1}
                    </div>
                    <div class="form-group col-md-1">                        
                        <div class="field_with_errors">
                            <input class="SaleEmployerCommissionRate form-control Fields Input" data-index="{$index}" type="text" value="{if $form->hasErrors()}{$form.rates[$index]['from']}{else}{$form->getCommission()->getRates()->byIndex()->getItemByIndex($index)->getFormatter()->getFrom()->getText('#.00')}{/if}" name="from"/>
                        </div>
                    </div> 
                     <div class="form-group col-md-1">                        
                        <div class="field_with_errors">
                            <input class="SaleEmployerCommissionRate form-control Fields Input" data-index="{$index}" type="text" value="{if $form->hasErrors()}{$form.rates[$index]['to']}{else}{$form->getCommission()->getRates()->byIndex()->getItemByIndex($index)->getFormatter()->getTo()->getText('#.00')}{/if}" name="to"/>
                        </div>
                    </div> 
                     <div class="form-group col-md-2">                        
                        <div class="field_with_errors">
                            <input class="SaleEmployerCommissionRate form-control Fields Input" data-index="{$index}" type="text" value="{if $form->hasErrors()}{$form.rates[$index]['fix']}{else}{$form->getCommission()->getRates()->byIndex()->getItemByIndex($index)->getFormatter()->getFix()->getText('#.00')}{/if}" name="fix"/>
                        </div>
                    </div> 
                     <div class="form-group col-md-2">                        
                        <div class="field_with_errors">
                            <input class="SaleEmployerCommissionRate form-control Fields Input" data-index="{$index}" type="text" value="{if $form->hasErrors()}{$form.rates[$index]['rate']}{else}{$form->getCommission()->getRates()->byIndex()->getItemByIndex($index)->getFormatter()->getRate()->getPourcentage()}{/if}" name="rate"/>
                        </div>
                    </div> 
                    <div class="form-group col-md-2">      
                        <a href="javascript:void(0);" class="Add" data-index="{$index}"><i class="fa fa-plus"></i></a>    
                        {if $index !=0}
                            <a href="javascript:void(0);" class="Delete" data-index="{$index}"><i class="fa fa-trash"></i></a>                    
                        {/if}                      
                    </div> 
               </div> 
             </div>
         {/foreach}
         </div>
    </div>        
        
</div>
<script type="text/javascript">              
                   
     $('#Cancel').click(function(){                
             return $.ajax2({  url : "{url_to('sales_ajax',['action'=>'ListPartialEmployerCommission'])}",                                                 
                              target: "#actions"}); 
     });
     
     $(document).off('click',".Add");
     
     $(document).off('click',".Delete");
        
     $(document).on('click',".Add",function () {       
        var count=$(".ctn").length;
        $("#SaleEmployerCommissionRate-ctn").append('<div class="ctn" data-index="'+count+'">'+                                                  
                                                '<div class="row" data-index="'+count+'">'+  
                                                    '<div class="form-group col-md-1 Index">'+ (count+1)+                                                                                               
                                                    '</div>'+
                                                    '<div class="form-group col-md-1">'+                         
                                                                '<div class="field_with_errors">'+ 
                                                                    '<input class="SaleEmployerCommissionRate form-control Fields Input" data-index="'+count+'" type="text" value="{$form->getCommission()->getRates()->getFirst()->getFormatter()->getFrom()->getText('#.00')}" name="from"/>'+ 
                                                                '</div>'+ 
                                                    '</div>'+  
                                                    '<div class="form-group col-md-1">'+                         
                                                       '<div class="field_with_errors">'+ 
                                                           '<input class="SaleEmployerCommissionRate form-control Fields Input" data-index="'+count+'" type="text" value="{$form->getCommission()->getRates()->getFirst()->getFormatter()->getTo()->getText('#.00')}" name="to"/>'+ 
                                                       '</div>'+ 
                                                   '</div>'+  
                                                    '<div class="form-group col-md-2">'+                         
                                                       '<div class="field_with_errors">'+ 
                                                           '<input class="SaleEmployerCommissionRate form-control Fields Input" data-index="'+count+'" type="text" value="{$form->getCommission()->getRates()->getFirst()->getFormatter()->getFix()->getText('#.00')}" name="fix"/>'+ 
                                                       '</div>'+ 
                                                    '</div>'+  
                                                    '<div class="form-group col-md-2">'+                         
                                                       '<div class="field_with_errors">'+ 
                                                           '<input class="SaleEmployerCommissionRate form-control Fields Input" data-index="'+count+'" type="text" value="{$form->getCommission()->getRates()->getFirst()->getFormatter()->getRate()->getPourcentage()}" name="rate"/>'+ 
                                                       '</div>'+ 
                                                   '</div>'+  
                                                   '<div class="form-group col-md-2">'+       
                                                       '<a href="javascript:void(0);" class="Add"><i class="fa fa-plus"></i></a>'+              
                                                       '<a href="javascript:void(0);" class="Delete" data-index="'+count+'"><i class="fa fa-trash"></i></a>'+                                             
                                                   '</div>'+    
                                                '</div>'+
                                            '</div>');
     }); 
     
     $(document).on('click',".Delete",function () {
         $(".ctn[data-index="+$(this).attr('data-index')+"]").remove();
         $(".Index").each(function (id) { $(this).html(id+1); });
     });
     
     $("#Save").click(function () { 
       var params = {   SaleEmployerCommission : '{$item->get('id')}',
                        SaleEmployerCommissionMultipleRate : { rates : [], token :'{$form->getCSRFToken()}' }
                    };
         $(".ctn").each(function (index) {     
              var item = { };
              $(".SaleEmployerCommissionRate[data-index="+index+"]").each(function () { item[$(this).attr('name')]= $(this).val(); });
              params.SaleEmployerCommissionMultipleRate.rates.push(item);
         });
         return $.ajax2({     data : params,
                              url : "{url_to('sales_ajax',['action'=>'SaveMultipleRateForEmployerCommission'])}",                                                 
                              target: "#actions"}); 
     });
</script>
{else}
    {__('Commission is invalid.')}
{/if} 



