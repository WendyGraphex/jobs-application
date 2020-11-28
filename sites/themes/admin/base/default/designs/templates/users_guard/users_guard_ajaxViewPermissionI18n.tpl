{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Edit permission")}</h3>
        <h3 class="admin-header-small-text">{__("Edit permission")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a href="#" id="Save" class="btn btn-success admin-header-button" style="display:none">
                    <i class="fa fa-save" style="margin-right:5px;"></i>
                   {__('Save')}</a>
            <a style="margin-left: 10px;" href="#" id="Cancel" class="btn btn-danger admin-header-button">
                 <i class="fa fa-times" style="margin-right:5px;"></i>
                 {__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New permission')}
    </p>
</div> 
<div style="background-color: white; padding: 10px;">
    {if $item_i18n->getPermission()->isLoaded()}
        <div class="form col-md-6">
              <div class="form-group">

                <img id="{$item_i18n->get('lang')}" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />           
        </div> 
             <div class="form-group">
                 <div class="error-form">{$form.name->getError()}</div>
                 <label>{__("name")}{if $form->name->getOption('required')}*{/if}</label>
                     <input type="text" class="PermissionI18n Fields form-control" name="name" value="{$item_i18n->getPermission()->get('name')|escape}" size="30"/>
             </div>
             <div class="form-group">
                 <div class="error-form">{$form.title->getError()}</div> 
                 <label>{__("Title")}{if $form->name->getOption('required')}*{/if}</label>
                     <input type="text" class="PermissionI18n Fields form-control" name="title" value="{$item_i18n->get('title')|escape}" size="30"/>
             </div>
              <div class="form-group">
                 <label>{__("Group")}</label>
                     {html_options name="group_id" class="PermissionI18n" options=$form->group_id->getOption('choices') selected=$item_i18n->getPermission()->get('group_id')}
             </div> 
             <div class="form-group">
                 <label>{__("Created at")}</label>
                     <span>{$item_i18n->get('created_at')}</span>
             </div>   
             <div class="form-group">
                 <label>{__("Updated at")}</label>
                     <span>{$item_i18n->get('updated_at')}</span>          
             </div>               
        </div>  
    </fieldset>
    {else}
        <span>{__("This permission is invalid.")}</span>
    {/if} 
</div>
<script type="text/javascript">
    
         $('#Cancel').click(function(){ return $.ajax2({                            
                            url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",                           
                            target: "#actions"
                        }); 
         });
                
            $(".PermissionI18n").click(function() { 
                $("#Save").show();
            });
            
            $('#Save').click(function() { 
                 var params= { PermissionI18n : { 
                                       permission_id : "{$item_i18n->getPermission()->get('id')}",
                                       lang : "{$item_i18n->get('lang')}",
                                       group_id: $(".PermissionI18n[name=group_id] option:selected").val(),
                                       token : '{$form->getCSRFToken()}' 
                                    } }; 
             
                   $("input.PermissionI18n").each(function() {  params.PermissionI18n[this.name]=this.value; });
                   return $.ajax2({ data:params,                                     
                                    url: "{url_to('users_guard_ajax',['action'=>'SavePermissionI18n'])}",                                 
                                    target: "#actions"}); 
                   
            });  
             
      
</script>
