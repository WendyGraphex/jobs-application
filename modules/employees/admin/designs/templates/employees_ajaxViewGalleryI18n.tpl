{alerts}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View gallery")}</h3>
        <h3 class="admin-header-small-text">{__("Freelancer Galleries Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Freelancers')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Gallery')}
    </p>
</div>
{alerts}        
{if $item_i18n->getGallery()->isLoaded()}    
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3"> 
        <div class="row">
          <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
          </div>                        
        </div>         
      <div class="row">          
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.gallery.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.gallery.name->getError()}</div>{/if}
            <label for="name">{__('Name')}{if $form->gallery.name->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployeeGallery form-control Fields Input" type="text" value="{$item_i18n->getGallery()->get('name')}" name="name" id="name">
            </div>
          </div>   
            <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.gallery.tpl->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.gallery.tpl->getError()}</div>{/if}
            <label for="tpl">{__('Template')}{if $form->gallery.tpl->getOption('required')}*{/if}</label>            
            <div class="field_with_errors">
                <input class="EmployeeGallery form-control Fields Input" type="text" value="{$item_i18n->getGallery()->get('tpl')}" name="tpl" id="tpl">
            </div>
          </div>        
            <div class="form-group col-md-4">
                {if $form->hasErrors()}<div class="alert alert-{if $form.gallery_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.gallery_i18n.title->getError()}</div>{/if}
                <label for="title">{__('Title')}{if $form->gallery_i18n.title->getOption('required')}*{/if}</label>            
                <div class="field_with_errors">
                    <input class="EmployeeGalleryI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title">
                </div>
            </div>          
        </div>                   
    </div>    
     
</div>
<script type="text/javascript">              
   
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ url : "{url_to('employees_ajax',['action'=>'ListPartialGallery'])}",                                                 
                              target: "#actions"}); 
     });
      
       $('#Save').click(function(){                             
            var  params= {  EmployeeGalleryI18n: { 
                                   gallery_i18n : { lang: "{$item_i18n->get('lang')}",gallery_id: "{$item_i18n->get('gallery_id')}"    },
                                   gallery : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeGalleryI18n.Input").each(function() { params.EmployeeGalleryI18n.gallery_i18n[this.name]=$(this).val(); });
          $(".EmployeeGallery.Input").each(function() {  params.EmployeeGalleryI18n.gallery[this.name]=$(this).val();  });  // Get foreign key           
          //    alert("Params="+params.toSource());   return ;       
          return $.ajax2({ data : params,                           
                           url: "{url_to('employees_ajax',['action'=>'SaveGalleryI18n'])}",
                           target: "#actions" }); 
        });  
     
     
</script>
{else}
    {__('Gallery is invalid.')}
{/if}    
