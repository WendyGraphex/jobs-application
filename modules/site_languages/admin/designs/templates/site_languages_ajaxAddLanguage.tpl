{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Add language")}</h3>
        <h3 class="admin-header-small-text">{__("New language")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
                <a href="#" id="Save" class="btn btn-success admin-header-button">
                    <i style="margin-right: 5px;" class="fa fa-save"></i>
                {__('Save')}</a>
                <a style="margin-left: 5px;" href="#" id="Cancel" class="btn btn-danger admin-header-button">
                    <i class="fa fa-times" style="margin-right:5px;"></i>
                {__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Langue')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Ajouter une Langue')}
    </p>
</div>
<div class="New-Languages-body" style="width: 100%; background-color: white; padding: 20px;">
    <div class="row form">
     {foreach $form->languages->getChoices() as $code=>$language}
        <div style="min-width: 150px; width: 15%; max-width: 15%; height: 80px;" class="custom-control custom-checkbox col">
             <div style="width: 100%; margin-left: 20px;">
                 <input type="checkbox" class="Languages Checkbox custom-control-input" id="{$code}" name="languages" {if $form->getLanguages()->in($language->getCode())}checked=""{/if} style="margin-right: 4px;float:left;"/>
                 <label class="custom-control-label" style="font-size: 0.8em;" for="{$code}">{$language->getFormatted()->ucfirst()}</label>
             </div>
        </div>       
     {/foreach}    
</div>
</div>


<script type="text/javascript">
                            
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({ 
                              url : "{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}",                                                    
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {              
                                SiteLanguage: {  
                                   languages : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".Languages.Checkbox:checked").each(function() { params.SiteLanguage.languages.push($(this).attr('id')); });                  
          //console.log(params);   return ;        
          return $.ajax2({ data : params,                              
                           url: "{url_to('languages_ajax',['action'=>'AddLanguage'])}",                            
                           target: "#actions"}); 
        });  
     
</script>

