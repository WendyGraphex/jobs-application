{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New group")}</h3>
        <h3 class="admin-header-small-text">{__("Gestion Groups")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button">
                <i class="fa fa-save" style=" margin-right:10px;"></i>
            {__('Save')}</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button">
                <i style="margin-right: 5px;" class="fa fa-times" style="margin-right:10px;"></i>
            {__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Droits d'accès")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Groups")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Nouveau Groups")}
    </p>
</div> 
<div class="form New-Groups-body" style="background-color: white; padding: 10px;">
    <div class="form-group">
            <div class="error-form">{$form.group_i18n.lang->getError()}</div>      
            <img class="GroupI18n" id="{$form.group_i18n.lang}" name="lang" src="{url("/flags/`$form.group_i18n.lang`.png","picture")}" title="{if !$form.group_i18n.lang->getError()}{format_country($form.group_i18n.lang)}{/if}" />
            {component name="/site_languages/dialogListLanguagesAdmin" selected=(string)$form.group_i18n.lang}
    </div>  
    <div class="form-group" style="max-width: 500px;">
         <label><span>{__("Name")}</span>{if $form->group.name->getOption('required')}*{/if} </label>
            <div id="error_pages" class="error-form">{$form.group.name->getError()}</div>
            <input type="text" size="40" class="Group Fields form-control" name="name" value="{$item_i18n->getGroup()->get('name')}"/>               
    </div>  
    <div class="form-group" style="max-width: 500px;">
         <label><span>{__("Title")}</span>{if $form->group_i18n.title->getOption('required')}*{/if} </label>
            <div id="error_pages" class="error-form">{$form.group_i18n.title->getError()}</div>
            <input type="text" size="40" class="GroupI18n Fields form-control" name="title" value="{$item_i18n->get('title')}"/>                     
    </div>      
</div> 
   
  
<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".Fields").click(function() {  $('#Save').show(); });    
    
     $(".Fields").change(function() {  $('#Save').show(); });   
         
          
     {* =================== L A N G U A G E ================================ *}
         $( "#ChangeLang").click(function() {
            $("#Save").show();
            $("#dialogListLanguages").dialog("open");
         });  
         
         $("#dialogListLanguages").bind('select',function(event){                    
            $(".GroupI18n[name=lang]").attr({
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });         
         }); 
     
     
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){   
             $(".dialogs").dialog("destroy").remove(); 
             return $.ajax2({ data: { filter: { lang:$(".GroupI18n[name=lang]").attr('id'), token: "{mfForm::getToken('GroupsFormFilter')}" } },                              
                              url : "{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}",                                                    
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {              
                                Group: { 
                                   group_i18n : { lang: $(".GroupI18n[name=lang]").attr('id')  },
                                   group : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.GroupI18n").each(function() { params.Group.group_i18n[this.name]=$(this).val(); });
          $("input.Group").each(function() {  params.Group.group[this.name]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;
          $(".dialogs").dialog("destroy").remove(); 
          return $.ajax2({ data : params,                           
                           url: "{url_to('users_guard_ajax',['action'=>'SaveNewGroupI18n'])}",                            
                           target: "#actions"}); 
        });  
     
</script>