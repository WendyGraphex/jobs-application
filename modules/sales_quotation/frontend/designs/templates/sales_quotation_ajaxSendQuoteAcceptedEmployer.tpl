<td class="count"></td>                                                            
<td>
     <div>{$quotation->get('reference')}</div>
</td> 
<td>                                        
    <div>
    {if $quotation->hasEmployerAdvert()}
        <div>{__('Ref.')}{$quotation->getEmployerAdvertI18n()->get('reference')}</div>
        <div>
            {$quotation->getEmployerAdvertI18n()->getFormatter()->getTitle()->ucfirst()}                                             
        </div>                                                                                                                    
    {elseif $quotation->hasEmployeeAdvert()}      
        <div>{__('Ref.')}{$quotation->getEmployeeAdvertI18n()->get('reference')}</div>
        <div>
            {$quotation->getEmployeeAdvertI18n()->getFormatter()->getTitle()->ucfirst()}                                             
        </div>                                       
        <div>{$quotation->getProject()->getFormatter()->getName()->ucfirst()}</div> 
    {/if}    
    </div>
    <div>
         {if $quotation->hasHistory()}
            <a href="javascript:void();" id="SaleEmployeeQuotationHistory-{$quotation->get('id')}"><i class="fa fa-list"></i></a>
            {/if}
        {$quotation->getFormatter()->getDescription()->ucfirst()|escape|truncate:80}
    </div>     
</td>     
 <td>    
    <img height="32px" src="{$quotation->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
     {$quotation->getEmployeeUser()->getFormatter()->getUsername()}
     <label>                                    
        <a href="javascript:void(0);" style="font-size: 16px;color: black;" class="DialogMessage" name="{*$quotation->getEmployeeUser()->getFormatter()->getAdvertTitle()*}" id="{$quotation->getEmployeeUser()->get('id')}"><i class="mdi  mdi-email-outline"></i></a>
    </label>
 </td>
  <td>
    {$quotation->getFormatter()->getPrice()->getAmount()}
</td>
<td id="EmployerQuotationActions-schedule-ctn-{$quotation->get('id')}"> 
      {if $quotation->hasInAt()} 
    <div>{$quotation->getFormatter()->getInAt()->getFormatted()}</div>
     <div>{$quotation->getFormatter()->getNumberOfDays()->getFormattedNumberOfDays()}</div>
   {else}
      {if !$quotation->isAccepted()}
          {if $quotation->isScheduleNeeded()}
          {__('Schedule requested to %s',$quotation->getEmployeeUser()->getFormatter()->getUsername())}
          {else}
            <button type="button" id="EmployerQuotationActions-schedule-btn-{$quotation->get('id')}" data-action="SCHEDULE" class="EmployerQuotationActions btn btn-outline-success btn-sm">{__('Need schedule')}</button>
            {/if}
      {/if}
   {/if}  
</td>
<td>
    {$quotation->get('version')}    
</td>                                  
  <td>
  {$quotation->getFormatter()->getCreatedAt()->getText()}
</td>                              
<td> 
  <div>{__('Waiting answer from %s',$quotation->getEmployeeUser()->getFormatter()->getUsername())}</div>
<div>{__('Quote accepted')}</div>
</td>
<td>
{if $quotation->isAccepted()}           
    {if $quotation->isPaid()}
        {__('Paid')}
    {else}    
        <button type="button" class="btn btn-outline-success btn-sm" id="AddToCart-{$quotation->get('id')}">{__('Add to cart')}</button> 
    {/if}
 {/if}
</td>

<script type="text/javascript">
            
     $("#EmployerQuotationActions-schedule-btn-{$quotation->get('id')}").click(function () {        
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteScheduleEmployer'])}",            
                         target : "#EmployerQuotationActions-schedule-ctn-{$quotation->get('id')}"     
                         
             });
    });
    
   {if $quotation->isAccepted() && !$quotation->isPaid()}       
     $("#AddToCart-{$quotation->get('id')}").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('cart_ajax',['action'=>'AddQuotationToCart'])}",            
                         success : function (resp)  
                                {
                                        if (resp.action !='AddToCart') return ;
                                }
                         
             });
    });
    {/if}

 {if $quotation->hasHistory()}  
    $("#SaleEmployeeQuotationHistory-{$quotation->get('id')}").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('sales_quotation_ajax',['action'=>'DialogHistoryEmployer'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    {/if}


$(".DialogMessage").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('employers_messager_ajax',['action'=>'DialogMessageForQuotation'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });

    $(".count[id={$quotation->get('id')}]").html($(".list[id={$quotation->get('id')}]").index());
</script>


