{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View campaign")}</h3>
        <h3 class="admin-header-small-text">{__("Gestion des pays")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
        {if $item->isLoaded()}
            <a href="#" id="Save" class="btn btn-success admin-header-button" style="display:none">
                <i class="fa fa-save" style="margin-right:5px;"></i>
            {__('Save')}</a>
            <a style="margin-left: 10px;" href="#" id="Cancel" class="btn btn-danger admin-header-button">
                <i class="fa fa-times" style="margin-right:5px;"></i>
            {__('Cancel')}</a>
        {/if}
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Pays')}
         <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View campaign')}
    </p>
</div>
<div style="background-color: white; padding: 10px;">
    {if $item->isLoaded()}
    <div class="form"> 
        <div class="form-group">
               <div {if $form.name->hasError()}class="alert alert-danger"{/if}>{$form.name->getError()}</div>
               <label>{__('Name')}<span class="obligation">{if $form->name->getOption('required')}*{/if}</span></label>
               <input class="form-ctr Country Input Fields" name="name" placeholder="{__('Name')}" value="{$item->get('name')}"/>
        </div>    
         <div class="form-group">
               <div {if $form.company_id->hasError()}class="alert alert-danger"{/if}>{$form.company_id->getError()}</div>
               <label>{__('Company')}<span class="obligation">{if $form->company_id->getOption('required')}*{/if}</span></label>
              {html_options class="Country Select Fields" name="company_id" options=$form->company_id->getChoices()->toArray() selected=$item->get('company_id')}
        </div>
    </div>
    {else}
        {__('Country is invalid.')}
    {/if}
</div>
<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".Fields").click(function() {  $('#Save').show(); });    
    
     $(".Fields").change(function() {  $('#Save').show(); });                                       
                         
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({ 
                              url : "{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}",                                                    
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {              
                                SiteCountry: {     
                                   id :'{$item->get('id')}',
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".Country.Input").each(function() { params.SiteCountry[$(this).attr('name')]=$(this).val(); });          
          $(".Country.Select option:selected").each(function() { params.SiteCountry[$(this).parent().attr('name')]=$(this).val(); });   
           //   alert("Params="+params.toSource());   return ;        
          return $.ajax2({ data : params,                              
                           url: "{url_to('site_countries_ajax',['action'=>'SaveCountry'])}",                            
                           target: "#actions"}); 
        });  
     
</script>
