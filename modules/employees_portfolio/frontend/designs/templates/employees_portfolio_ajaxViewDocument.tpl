<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            {alerts class="dialog-errors"}
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                  {foreach $form->getLanguages() as $language}
                <li class="nav-item">            
                    <a class="nav-link {if $language@first}active{/if}"  id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                        {$language->getFormatter()->getText()->ucfirst()}
                        {if $form.i18n[$language@index]->hasError()}<span style="color:red">?</span>{/if}
                    </a>
                </li>        
               {/foreach}               
            </ul>
            <div class="tab-content" style="padding-top: 20px;">
               {foreach $form->getLanguages()->byIndex() as $index=>$language}
                   <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                           
                    <textarea class="persoTextarea Input EmployeePortfolioDocumentI18n" data-lang="{$language->get('code')}" placeholder="{__('Enter your title')}" >{if $document->getI18ns()->getAll()->hasItemByKey($language->get('code'))}{$document->getI18ns()->getAll()->getItemByKey($language->get('code'))}{/if}</textarea>
                </div>   
               {/foreach}                   
            </div>
            <div style="margin-top: 20px;text-align: center;">
                <button type="button" id="EmployeePortfolioDocument-Save-{$document->get('id')}" class="btn btn-success" style="margin: 0 auto;">{__('Save')}</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
          
       $("#EmployeePortfolioDocument-Save-{$document->get('id')}").click(function () {   
           var params = { EmployeePortfolioDocument: '{$document->get('id')}' , EmployeePortfolioDocumentI18n : {  i18n : [ ], token : '{$form->getCSRFToken()}' } };
           $(".EmployeePortfolioDocumentI18n.Input").each(function () { params.EmployeePortfolioDocumentI18n.i18n.push({ lang: $(this).attr('data-lang'), title : $(this).val() }); });
           return $.ajax2({      
                          data : params,
                          url:"{url_to('employees_portfolio_ajax',['action'=>'SaveDocument'])}",    
                           success: function (resp) { 
                               if (resp.errors)
                               {
                                    $('.Input').keyup(function () { 
                                        $(".Input").removeClass('intro');
                                    });
                                    $(".Input").addClass('intro');
                                    return ;
                               }    
                               $("#DialogDocument").modal('hide'); 
                           }
                          
                       });                      
     });     
     
    
</script>                
