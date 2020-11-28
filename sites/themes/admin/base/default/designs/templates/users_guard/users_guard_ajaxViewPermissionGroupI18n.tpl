{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View permissions group")}</h3>
        <h3 class="admin-header-small-text">{__("Gestion Permissions")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="PermissionsGroup-Save" class="btn btn-success admin-header-button" style="display:none">
                 <i class="fa fa-save" style=" margin-right:5px;"></i>{__('save')}</a>
            <a href="#" id="PermissionsGroup-Cancel" class="btn btn-danger admin-header-button">
                 <i class="fa fa-times" style="margin-right:5px;"></i>{__('cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Droits d'accès")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Groupes Permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Permission Groups')}
    </p>
</div>
<div style="background-color: white; padding: 10px;">
    <div class="form-group">
        <label>{__('id')}</label>
        {if $item->isLoaded()} 
            <span>{$item->get('id')}</span>  
        {else}
            <span>{__('New')}</span>  
        {/if} 
    </div>
    <div class="form-group">
        <td></td>
        <td><img id="{$item->get('lang')}" name="lang" src="{url("/flags/`$item->get('lang')`.png","picture")}" title="{format_country($item->get('lang'))}" />       
        </td>
    </div>
     <div class="form-group">
        <label><span>{__("name")}</span>
        </label>
      <div id="PermissionsGroup-error_name" class="error-form">{$form.group.name->getError()}</div>  
      <input style="max-width: 500px;" type="text" class="PermissionsGroup Fields form-control" name="name" size="48" value="{$item->getPermissionGroup()->get('name')}"/> 
       
    </div>          
    <div class="form-group">
         <label><span>{__("value")}</span>{if $form->group_i18n.value->getOption('required')}*{/if}</label>
        
            <div id="PermissionsGroup-error_value" class="error-form">{$form.group_i18n.value->getError()}</div>
            <input style="max-width: 500px;" type="text" size="40" class="PermissionsGroupI18n Fields form-control" name="value" value="{$item->get('value')}"/>    
             
        
    </div>   
</div>

<script type="text/javascript">
    
      
     {* =================== F I E L D S ================================ *}
     $(".PermissionsGroup,.PermissionsGroupI18n").click(function() {  $('#PermissionsGroup-Save').show(); });    
         
     {* =================== A C T I O N S ================================ *}
     $('#PermissionsGroup-Cancel').click(function(){                           
             return $.ajax2({ data: { filter: { lang:"{$item->get('lang')}", token: "{mfForm::getToken('PermissionsGroupFormFilter')}" } },                              
                              url : "{url_to('users_guard_site_ajax',['action'=>'ListPartialPermissionsGroup'])}",                                             
                              target: "#actions" }); 
      });
      
      $('#PermissionsGroup-Save').click(function(){                             
            var  params= {            
                                PermissionGroupI18n: { 
                                   group_i18n : { lang: "{$item->get('lang')}",group_id: "{$item->get('group_id')}"    },
                                   group : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.PermissionsGroupI18n").each(function() { params.PermissionGroupI18n.group_i18n[this.name]=$(this).val(); });
          $("input.PermissionsGroup").each(function() {  params.PermissionGroupI18n.group[this.name]=$(this).val();  });  // Get foreign key  
          //    alert("Params="+params.toSource());   return ;       
          return $.ajax2({ data : params,                             
                           url: "{url_to('users_guard_site_ajax',['action'=>'SavePermissionGroupI18n'])}",
                           target: "#actions" }); 
        });  
     
</script>