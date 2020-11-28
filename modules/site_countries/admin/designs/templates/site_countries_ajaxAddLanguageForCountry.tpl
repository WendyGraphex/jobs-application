{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Languages for country [%s]",$item->getCode()->getFormatted()->ucfirst())}</h3>
    </div>
  
{if $item->isLoaded()}
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button">
                <i class="fas fa-save" style="margin-right:10px;"></i>
            {__('Save')}</a>
            <a href="#" id="Cancel" class="btn btn-warning admin-header-button" style="margin-left: 10px;">
                <i class="fa fa-times" style="margin-right:10px;"></i>
            {__('Cancel')}</a>
        </div>
    </div>  
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Countries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Countrie Languages')}
    </p>
</div>
<div container-fluid style="background-color: white; padding: 10px;">
    <div class="row" style="width: 100%; margin: auto;">
         {foreach $form->languages->getChoices() as $language}
             <div class="custom-control custom-checkbox languages col-lg col-md col-xs" >
                    <input type="checkbox" class="Languages Checkbox custom-control-input" id="{$language->get('id')}" name="languages" {if $form->getLanguages()->in($language->get('id'))}checked=""{/if} style="margin-right: 4px;float:left;"/>
                    <label class="custom-control-label" for="{$language->get('id')}">{$language->getFormatter()->getFormatted()->ucfirst()}</label>
            </div>       
         {/foreach}    
    </div>
</div>
<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".Languages").click(function() {  $('#Save').show(); });    
    
                                
                         
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({ 
                              url : "{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}",                                                    
                              target: "#page-wrapper"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      SiteCountry:  '{$item->get('id')}',        
                                SiteCountryLanguage: {     
                                   languages : [ ],                                   
                                   token :'{$form->getCSRFToken()}' 
                                } };         
         $(".Languages.Checkbox:checked").each(function() { params.SiteCountryLanguage[$(this).attr('name')].push($(this).attr('id')); });                  
           //   alert("Params="+params.toSource());   return ;        
          return $.ajax2({ data : params,                              
                           url: "{url_to('site_countries_ajax',['action'=>'AddLanguageForCountry'])}",                            
                           target: "#page-wrapper"}); 
        });  
     
</script>

{else}
    <div class="breadcrumb-title">
        <p>
            <i class="fa fa-home" style="color: #37bc9b;"></i>
            <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Countries')}
        </p>
    </div>
    <div class="col-sm" style="padding: 0;">
    {__('Country is invalid.')}
    </div>
</div>
{/if}