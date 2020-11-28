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
        <div>
            <img height="32px" src="{$quotation->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
            {$quotation->getEmployerUser()->getFormatter()->getUsername()}
            <label>                                    
                <a href="javascript:void(0);" id="DialogMessage-{$quotation->get('id')}" style="font-size: 16px;color: black;"><i class="mdi  mdi-email-outline"></i></a>
            </label>
        </div>
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
        <div class="classMarginBottom">{__('Waiting answer from %s',(string)$quotation->getEmployerUser()->getFormatter()->getUsername())}</div>
      <div>{__('Quote proposed')}</div>
    </td>
    <td>
        
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
  
  
   $("#DialogMessage-{$quotation->get('id')}").click(function () {       
        return $.ajax2({ data : { EmployeeUser : { id: '{$quotation->getEmployerUser()->get('id')}', subject: '{$quotation->getFormatter()->getAdvertTitle()}', token :'{mfForm::getToken('')}' } },
                         url :"{url_to('employees_messager_ajax',['action'=>'DialogMessage'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    
  $("#DialogMessage-{$quotation->get('id')}").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : '{$quotation->get('id')}' },
                         url :"{url_to('employees_messager_ajax',['action'=>'DialogMessageForQuotation'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
</script>    
{/if}