{messages}
<div class="row" style="margin: 0;">
    <div class="col-sm-6 site-applications-header" style="padding: 0;">
        <h3 style="line-height: 60px; font-size: 25px; font-family: Lato; display: table-cell; vertical-align: middle; color: rgb(101, 109, 120);">{__("New group")}</h3>
    </div>
    <div class="col-sm-6 site-applications-header" style="padding: 0;">
        <div style="padding: 0;">
            <a href="#" id="PermissionsGroup-Save" class="btn btn-success" style="margin-left: 10px; float: right; margin-top: 10px; display:none; border: 0; border-radius: 0;">
                <i class="fa fa-floppy-o" style=" margin-right:10px;"></i>
                {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>
            <a href="#" id="PermissionsGroup-Cancel" class="btn btn-danger" style="float: right; margin-top: 10px; border: 0; border-radius: 0;">
                 <i class="fa fa-times" style="margin-right:10px;"></i>
                {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
        </div>
    </div>
</div>
<div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Droits d'accès")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Groupes Permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Nouveau Groupe')}
    </p>
</div>
<div style="background-color: white; padding: 20px;">
    <style> .ui-dialog { font-size: 62.5%; }</style> 
    {component name="/site_languages/dialogListLanguagesFrontend" selected=(string)$form.group_i18n.lang}   
    <div class="form col-md-6">
        <div class="form-group">

                <div>{$form.group_i18n.lang->getError()}</div>      
                <img class="PermissionsGroupI18n" id="{$form.group_i18n.lang}" name="lang" src="{url("/flags/`$form.group_i18n.lang`.png","picture")}" title="{if !$form.group_i18n.lang->getError()}{format_country($form.group_i18n.lang)}{/if}" />
                <a id="PermissionsGroup-ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a> 
        </div> 
         <div class="form-group">
             <label><span>{__("name")}</span></label>
                <div class="error-form">{$form.group.name->getError()}</div>               
                 <input type="text" size="30" class="PermissionsGroup Fields form-control" name="name" value="{$item->getPermissionGroup()->get('name')}"/>
        </div>     
         <div class="form-group">
             <label><span>{__("value")} {if $form->group_i18n.value->getOption('required')}*{/if} </span></label>
                <div id="error_pages" class="error-form">{$form.group_i18n.value->getError()}</div>
                <input type="text" size="30" class="PermissionsGroupI18n  Fields form-control" name="value" value="{$item->get('value')}"/>    
       </div>  
    </div>  
</div>
<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".PermissionsGroup,.PermissionsGroupI18n").click(function() {  $('#PermissionsGroup-Save').show(); });            
         
     {* =================== L A N G U A G E ================================ *}
         $( "#PermissionsGroup-ChangeLang").click(function() {
            $("#PermissionsGroup-Save").show();
            $("#dialogListLanguages").dialog("open");
         });  
         
         $("#dialogListLanguages").bind('select',function(event){                    
            $(".PermissionsGroupI18n[name=lang]").attr({
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });         
         }); 
     
     
     {* =================== A C T I O N S ================================ *}
     $('#PermissionsGroup-Cancel').click(function(){   
             $(".dialogs").dialog("destroy").remove(); 
             return $.ajax2({ data: { filter: { lang:$("img.PermissionsGroupI18n").attr('id'), token: "{mfForm::getToken('PermissionsGroupFormFilter')}" } },                              
                              url : "{url_to('users_guard_site_ajax',['action'=>'ListPartialPermissionsGroup'])}",                                        
                              target: "#actions"}); 
      });
      
      $('#PermissionsGroup-Save').click(function(){                             
            var  params= {               
                                PermissionGroup: { 
                                   group_i18n : { lang: $(".PermissionsGroupI18n[name=lang]").attr('id')  },
                                   group : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.PermissionsGroupI18n").each(function() { params.PermissionGroup.group_i18n[this.name]=$(this).val(); });
          $("input.PermissionsGroup").each(function() {  params.PermissionGroup.group[this.name]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;
          $(".dialogs").dialog("destroy").remove(); 
          return $.ajax2({ data : params,                                                      
                           url: "{url_to('users_guard_site_ajax',['action'=>'SaveNewPermissionGroupI18n'])}",
                           target: "#actions"}); 
        });  
     
</script>
