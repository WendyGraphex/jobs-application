<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
              <h2>{__('My Company Page')}</h2>         
          </div>
          <div class="d-flex">
               <i class="mdi mdi-home text-muted hover-cursor"></i>            
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>    
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My company page')}</p>
            <p class="text-muted mb-0 hover-cursor">&nbsp;-&nbsp;</p>
            <p class="text-primary mb-0 hover-cursor"><a href="{$form->getCompany()->getUrl()}">{$form->getCompany()->getFormatter()->getName()->ucfirst()}</a></p> 
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employer-myComapnyPage"}
    </div>
</div>
{alerts}  

<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
        </div>
    </div>
</div>     
       
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
          <div class="card-body">             
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                {foreach $form->getLanguages() as $language}
                <li class="nav-item">            
                  <a class="nav-link {if $language@first}active{/if}"  id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                      {$language->getFormatter()->getText()->ucfirst()}
                      {if $form.contents[$language@index]->hasError()}<span style="color:red">?</span>{/if}
                  </a>
                </li>        
                {/foreach}                
            </ul>
            <div class="tab-content">
                {foreach $form->getLanguages()->byIndex() as $index=>$language}
                <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                      <div class="row mt-3">                       
                         <div class="form col-md-12">                                   
                           <div class="form-group">                          
                                   <label>{__("Title")}{if $form->contents[$index].meta_title->getOption('required')}*{/if}</label>
                                   <div>{$form.contents[$index].meta_title->getError()}</div>
                                   <input type="text" class="EmployerContentI18n Input form-control" data-lang="{$language->get('code')}" name="meta_title" value="{if $form->hasErrors()}{$form.contents[$index].meta_title|escape}{else}{$form->getCompany()->getContents()->getItemByKey($index)->get('meta_title')|escape}{/if}">
                           </div>                    
                         </div>  
                       </div>
                       <div class="row mt-3">                       
                         <div class="form col-md-12">                                   
                           <div class="form-group">                          
                                   <label>{__("Short description")}{if $form->contents[$index].meta_description->getOption('required')}*{/if}</label>
                                   <div>{$form.contents[$index].meta_description->getError()}</div>
                                   <textarea cols="40" rows="5" class="EmployerContentI18n Input form-control" data-lang="{$language->get('code')}" name="meta_description">{if $form->hasErrors()}{$form.contents[$index].meta_description|escape}{else}{$form->getCompany()->getContents()->getItemByKey($index)->get('meta_description')|escape}{/if}</textarea>
                           </div>                    
                         </div>  
                       </div>
                      <div class="row mt-3">                       
                         <div class="form col-md-12">                                   
                           <div class="form-group">                          
                                   <label>{__("Description")}{if $form->contents[$index].description->getOption('required')}*{/if}</label>
                                   <div>{$form.contents[$index].description->getError()}</div>
                                   <textarea cols="40" rows="10" class="EmployerContentI18n Textarea Input form-control" data-lang="{$language->get('code')}" name="description">{if $form->hasErrors()}{$form.contents[$index].description|escape}{else}{$form->getCompany()->getContents()->getItemByKey($index)->get('description')|escape}{/if}</textarea>
                           </div>                    
                         </div>  
                       </div>                  
                </div> 
                {/foreach}
          </div>
    </div>
</div>

 <script type="text/javascript">
       $( '.Textarea' ).ckeditor();
       
          $("#Save").click(function () { 
        var params = {   MyCompanyContent :  {  contents : [ ],token : '{$form->getCSRFToken()}' } };
        $(".Languages").each(function () { 
              var i18n = { lang : $(this).attr('id') };
              $(".EmployerContentI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
              params.MyCompanyContent.contents.push(i18n);
        });           
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('employers_ajax',['action'=>'MyCompanyContent'])}",           
            target: "#page-wrapper"
        });
    
      });
       
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                           target: "#page-wrapper"}); 
        });
</script> 
            