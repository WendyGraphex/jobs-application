<div class="row admin-header-container">
   <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Site')}</h3>
        <h3 class="admin-header-small-text">{__('Page management')}</h3>
   </div>
   <div class="col-sm" style="padding: 0;">
       <div style="float: right;"> 
           <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
       </div> 
   </div>
</div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>                
                <i class="fa fa-home" style="color: #37bc9b;"></i>         
                 <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
                 <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('CMS pages')}          
                <a href="#" id="Pages"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Pages')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View page')} 
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
{if $page_i18n->getPage()->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">
      <div class="row">
            <div class="form-group col-md-6">                                                              
             {component name="/site_languages/selectListLanguagesFrontend" selected=$page_i18n->get('lang')}
            </div>  
      </div>
            <ul class="nav nav-tabs" id="myTab" role="tablist">    
            <li class="nav-item">
           <a class="nav-link active" id="t-control-tab" data-toggle="tab" href="#t-control" role="tab" aria-controls="t-control" aria-selected="true">{__('Control')}</a>
         </li>
           <li class="nav-item">
           <a class="nav-link " id="t-referencement-tab" data-toggle="tab" href="#t-referencement" role="tab" aria-controls="t-referencement" aria-selected="false">{__('Referencement')}</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" id="t-design-tab" data-toggle="tab" href="#t-design" role="tab" aria-controls="t-design" aria-selected="false">{__('Design')}</a>
         </li>                   
           <li class="nav-item">
           <a class="nav-link" id="t-content-tab" data-toggle="tab" href="#t-content" role="tab" aria-controls="t-content" aria-selected="false">{__('Content')} </a>
         </li>
      </ul>
         {* ============== C O N T R O L ========================================= *}
        <div class="tab-content" id="myTabContentViewPage">         
        <div class="tab-pane fade show active" id="t-control" role="tabpanel" aria-labelledby="t-control-tab">  
            <table cellpadding="0" cellspacing="0"> 
                <tr style="height: 60px;">
                   <td>{__('Cache')}:</td>
                   <td><input class="PageI18n Fields form-control" style="width: 0%;" type="checkbox" name="is_cached"  id="{$page_i18n->get('id')}" value="{$page_i18n->get('is_cached')|escape}" {if $page_i18n->get('is_cached')=='YES'}checked='checked'{/if}/></td>
                </tr>
                <tr style="height: 60px;">
                   <td style="width: 150px;">{__('Name')}:{if $form.page.name->getValidator()->getOption('required')}*{/if}</td>
                   <td>
                       <div style="color: red;">{$form.page.name->getError()}</div> 
                       <input class="Page Fields form-control" type="text" name="name" size="10" value="{$page_i18n->getPage()->get('name')|escape}"/>
                   </td>
               </tr>
               <tr style="height: 60px;">
                   <td>{__('Start at')}:{if $form->page_i18n.start_at->getOption('required')}*{/if}</td>
                   <td>
                       <div style="color: red;">{$form.page_i18n.start_at->getError()}</div> 
                   <input id="last_time_from" class="page_i18n form-control" type="text" name="start_at" size="10" value="{if $form->hasErrors()}{$form.page_i18n.start_at}{else}{format_date($page_i18n->get('start_at'),'a')}{/if}"/></td>
               </tr>
               <tr style="height: 60px;">
                   <td>{__('Expired at')}:{if $form->page_i18n.expired_at->getOption('required')}*{/if}</td>
                   <td>
                        <div style="color: red;">{$form.page_i18n.expired_at->getError()}</div> 
                   <input class="PageI18n Fields form-control" id="last_time_to" type="text" name="expired_at" size="10" value="{if $form->hasErrors()}{$form.page_i18n.expired_at}{else}{format_date($page_i18n->get('expired_at'),'a')}{/if}"/></td>
               </tr>              
           </table>
        </div>
         {* ============== R E F E R E N C E M E N T ========================================= *}
         <div class="tab-pane fade" id="t-referencement" role="tabpanel" aria-labelledby="t-referencement-tab">
             <table cellpadding="0" cellspacing="0">
               <tr style="height: 60px;">
                   <td style="width: 150px;">{__('Url')}:{if $form.page_i18n.url->getValidator()->getOption('required')}*{/if}</td>
                   <td>
                       <div style="color: red;">{$form.page_i18n.url->getError()}</div> 
                       <input class="PageI18n Fields form-control" type="text" name="url" value="{$page_i18n->getURL()->getText()}"/>
                   </td>
               </tr>
               <tr style="height: 60px;">
                   <td>{__('Title')}:</td>
                   <td><input class="PageI18n Fields form-control" type="text" name="meta_title" value="{$page_i18n->get('meta_title')}"/></td>
               </tr>
               <tr style="height: 60px;">
                   <td>{__('Description')}:</td>
                   <td><textarea class="PageI18n Fields form-control" name="meta_description" rows="5" cols="40" style="margin-bottom: 20px;">{$page_i18n->get('meta_description')}</textarea></td>
               </tr>
               <tr style="height: 60px;">
                   <td>{__('Keywords')}:</td>
                   <td><textarea class="PageI18n Fields form-control" name="meta_keywords" rows="5" cols="40">{$page_i18n->get('meta_keywords')}</textarea>
                   </td>
               </tr> 
           </table>
         </div>
          {* ============== D E S I G N ========================================= *}
          <div class="tab-pane fade" id="t-design" role="tabpanel" aria-labelledby="t-design-tab">
             <table cellpadding="0" cellspacing="0">
                <tr style="height: 60px;">
                    <td style="width: 150px;">{__('Layout')}:{if $form.page_i18n.layout->getValidator()->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.page_i18n.layout->getError()}</div> 
                        <input class="PageI18n Fields form-control" type="text" name="layout" size="10" value="{$page_i18n->get('layout')|escape}"/>
                    </td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Template')}:{if $form.page_i18n.template->getValidator()->getOption('required')}*{/if}</td>
                    <td>
                       <div style="color: red;">{$form.page_i18n.template->getError()}</div> 
                       <input class="PageI18n Fields form-control" type="text" name="template" size="10" value="{$page_i18n->get('template')|escape}"/>
                    </td>
                </tr>
            </table>
         </div>     
          {* ============== C O N T E N T ========================================= *}
        <div class="tab-pane fade" id="t-content" role="tabpanel" aria-labelledby="t-content-tab">
             <textarea id="Content" name="content" rows="15" cols="80" style="margin-top: 15px;" class="editor PageI18n Fields form-control">{$page_i18n->get('content')}</textarea>
         </div>
         </div>
    </div>  
    {else}
        <span>{__("Page is invalid")}</span>
    {/if}    

<script type="text/javascript">
        $( '#Content' ).ckeditor({
            height: $(window).height(),
        });
       
       
        $("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix');
        $("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left'); 
     

        $(".Fields").click(function() {   $("#Save").show();   });
        
        var dates = $( "#last_time_from, #last_time_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "last_time_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    dates.not( this ).datepicker( "option", option, date );
                            }
                          });
        {* ACTIONS *}
        $('#Cancel').click(function(){ 
                var params={ filter: {  
                                   lang: '{$page_i18n->get('lang')}',                                 
                                   token:'{mfForm::getToken('CmsPageI18nFormFilter')}'
                       } };
                return $.ajax2({ data: params, 
                                 url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}",
                                 target: "#actions"});             
        });
        
        $('#Save').click(function(){          
          var params= { PageI18n : { 
                               page :{ },
                               page_i18n: { 
                                    page_id: '{$page_i18n->getPage()->get('id')}',
                                    lang: '{$page_i18n->get('lang')}'                                   
                                         },
                               token :'{$form->getCSRFToken()}'
                              } };
          $("input.PageI18n,textarea.PageI18n").each(function() { params.PageI18n.page_i18n[$(this).attr('name')]=$(this).val(); });
          $("input.Page").each(function() { params.PageI18n.page[$(this).attr('name')]=$(this).val(); });
         // alert("Params="+params.toSource());   return;
          return $.ajax2({ data : params,
                           url: "{url_to('cms_pages_ajax',['action'=>'SavePageI18n'])}",
                           target: "#actions"}); 
        
        });   
</script>