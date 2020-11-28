 <td class="count" id="{$quotation->get('id')}"></td>                                                            
    <td> {$quotation->get('reference')}
    </td> 
    <td>
        {if $quotation->hasEmployerAdvert()}
            <div>{__('Ref.')}{$quotation->getEmployerAdvertI18n()->get('reference')}
               {$quotation->getEmployerAdvertI18n()->getFormatter()->getTitle()->ucfirst()}                                             
            </div>                                                                                                                    
        {elseif $quotation->hasEmployeeAdvert()}      
            <div>{__('Ref.')}{$quotation->getEmployeeAdvertI18n()->get('reference')}
                 {$quotation->getEmployeeAdvertI18n()->getFormatter()->getTitle()->ucfirst()}

            </div>                                       
            <div>{$quotation->getProject()->getFormatter()->getName()->ucfirst()}</div> 
        {/if}
         <div>
            {if $quotation->hasHistory()}
            <a href="javascript:void();" id="SaleEmployeeQuotationHistory-{$quotation->get('id')}"><i class="fa fa-list"></i></a>
            {/if}
            {$quotation->getFormatter()->getDescription()->ucfirst()|escape|truncate:80}
        </div> 
    </td>                               
    <td>
        <img height="32px" src="{$quotation->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
        {$quotation->getEmployerUser()->getFormatter()->getUsername()}
        <label>                                    
            <a href="javascript:void(0);" style="font-size: 16px;color: black;" class="DialogMessage DialogMessage-{$quotation->getEmployerUser()->get('id')}"><i class="mdi  mdi-email-outline"></i></a>
        </label>
    </td>                                                           
      <td>
        {$quotation->getFormatter()->getPrice()->getAmount()}
    </td>
    <td>
         {if $quotation->hasInAt()} 
        <div>{$quotation->getFormatter()->getInAt()->getFormatted()}</div>
        <div>{$quotation->getFormatter()->getNumberOfDays()->getFormattedNumberOfDays()}</div>
       {else}
           {__('---')}
       {/if}  
    </td>
    <td>
        {$quotation->get('version')}
    </td>                                
      <td>
      {$quotation->getFormatter()->getCreatedAt()->getText()}
    </td>
    <td>                                                                       
      {if $quotation->isAccepted()}
    <strong>{__('Accepted')}</strong>
{elseif $quotation->isEmployeeAccepted()}
     <div>{__('Accepted by %s',(string)$quotation->getEmployerUser()->getFormatter()->getUsername())}</div>  
{/if}  

    </td>
    <td>
       {if $quotation->isAccepted() && !$quotation->isPaid()}  
         {__('Waiting for payment')}
       {/if}  
    </td>

{if $quotation->hasHistory()}    
<script type="text/javascript">
               
    $("#SaleEmployeeQuotationHistory-{$quotation->get('id')}").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('sales_quotation_ajax',['action'=>'DialogHistoryEmployee'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });       
    
    $(".count[id={$quotation->get('id')}]").html($(".list[id={$quotation->get('id')}]").index());
    
  
  $(".DialogMessage").click(function () {      
      alert("aaaaaaaaaaa");
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('employees_messager_ajax',['action'=>'DialogMessageForQuotation'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    
    $(".History").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'DialogHistoryEmployee'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    
    $(".DialogMessage").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('employees_messager_ajax',['action'=>'DialogMessageForQuotation'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
</script>    
{/if}    


