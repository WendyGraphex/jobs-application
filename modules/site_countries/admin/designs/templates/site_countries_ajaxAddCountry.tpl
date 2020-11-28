{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Add countries")}</h3>
        <h3 class="admin-header-small-text">{__("Countries Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button" style="display:none;">
                <i class="fa fa-save"></i>
            {__('Save')}</a>
            <a href="#" id="Cancel" class="btn btn-warning admin-header-button" style="margin-left: 10px;">
                <i class="fa fa-times"></i>
            {__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Countries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Add Countries')}
    </p>
</div>
<div class="container-fluid" style="background-color: white; padding: 10px;">
    <div class="row" style="width: 100%; margin: auto;">
     {foreach $form->countries->getChoices() as $code=>$country}
{*         {if $country@index %6==0}<tr>{/if}        *}
        <div class="col-lg-4 col-md-4 col-xs-4 custom-control custom-checkbox">
                <input type="checkbox" class="Countries Checkbox custom-control-input" id="{$code}" name="countries" {if $form->getCountries()->in($country->getCode())}checked=""{/if} style="float:left;margin-right: 4px;"/> 
                <label class="custom-control-label" for="{$code}">
                    <img class="country" src="{url("/flags/`$country->getCode()->lower()`.png","picture")}"/>
                    {$country->getFormatted()}
                </label>
        </div>
{*         {if $country@index %6==6}</tr>{/if}*}
     {/foreach}    
</div>
</div>

<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".Fields,.Countries").click(function() {  $('#Save').show(); });    
                                        
                         
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({ 
                              url : "{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}",                                                    
                              target: "#page-wrapper"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {              
                                SiteCountry: {  
                                   countries : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".Countries.Checkbox:checked").each(function() { params.SiteCountry[$(this).attr('name')].push($(this).attr('id')); });                  
           //   alert("Params="+params.toSource());   return ;        
          return $.ajax2({ data : params,                              
                           url: "{url_to('site_countries_ajax',['action'=>'AddCountry'])}",                            
                           target: "#page-wrapper"}); 
        });  
     
</script>
