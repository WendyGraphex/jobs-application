{messages class="error-node-view"}

{if $node_i18n && $node_i18n->getCmsMenu()->isLoaded()}
 <div>
     <a href="#" id="Save" class="btn btn-success" style="float: right; border-radius: 0; margin-right: 10px;"><i style="margin-right:10px; color: white;" class="fas fa-save"></i>{__('Save')}</a>  
     <div style="clear: both;"></div>
 </div>  
<style type="text/css">
/* Vertical Tabs */
.ui-tabs-vertical { width: 55em; }
.ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
.ui-tabs-vertical .ui-tabs-nav li a { display:block; }
.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-selected { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
.ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
</style>
<div id="help">&nbsp;</div>
<div id="tabs">
    <ul>
        <li>
             <a href="#tab-menu" title="{__('Menu')}" name="tab-menu" class="items-view">
                  <img height="32" width="32" src="{url('/icons/sitemap.png','picture')}" alt="{__('Menu')}"/>                  
                  <span>{__('Menu')}</span>
             </a>
             <span style="display:none;" id="item-tab-menu">{__("help menu")|default:'&nbsp;'}</span>
         </li>
         <li>
             <a href="#tab-control" title="{__('Control')}" name="tab-control" class="items_view">
                  <img height="32" width="32" src="{url('icons/control.png','picture')}" alt="{__('Control')}"/>                  
                  <span>{__('Control')}</span>
             </a>
             <span style="display:none;" id="item-tab-control">{__("help control")|default:'&nbsp;'}</span>
         </li>
         <li>
             <a href="#tab-referencement" title="{__('Referencement')}" name="tab-referencement" class="items_view">
                  <img height="32" width="32" src="{url('icons/seo.png','picture')}" alt="{__('Referencement')}"/>                  
                  <span>{__('Referencement')}</span>
             </a>
             <span style="display:none;" id="item-tab-referencement">{__("help referencement")}</span>
         </li>
         <li>
             <a href="#tab-design" title="{__('Design')}" name="tab-design" class="items-view">
                  <img height="32" width="32" src="{url('icons/design.png','picture')}" alt="{__('Design')}"/>                  
                  <span>{__('Design')}</span>
             </a>
             <span style="display:none;" id="item-tab-design">{__("help design")}</span>
         </li>
         <li>
             <a href="#tab-content" title="{__('Content')}" name="tab-content" class="items-view">
                  <img height="32" width="32" src="{url('icons/content.png','picture')}" alt="{__('Content')}"/>                  
                  <span>{__('Content')}</span>
             </a>
             <span style="display:none;" id="item-tab-content">{__("help content")}</span>
         </li>
    </ul>
    {* ====================== M E N U ============================================= *}
    <div id="tab-menu">
        {include file="./includes/Node/_menu.tpl"} 
    </div>
    {* ====================== C O N T R O L ============================================= *}
    <div id="tab-control">     
         {include file="./includes/Node/_control.tpl"}  
    </div> 
    {* ====================== R E F E R E N C E M E N T ============================================= *}
    <div id="tab-referencement">        
        {include file="./includes/Node/_referencement.tpl"} 
    </div>
     {* ====================== D E S I G N ============================================= *}
    <div id="tab-design">        
       {include file="./includes/Node/_design.tpl"} 
    </div>
    {* ====================== C O N T E N T ============================================= *}
    <div id="tab-content">       
        <textarea rows="15" cols="80" class="editor PageI18n Input form-control" name="content">{$node_i18n->getPageI18n()->get('content')}</textarea>
    </div>
</div>    
<script type="text/javascript"> 
     
 {* =========== T A B S ===================================== *}  

    $("#tabs").tabs({   spinner: "{__("loading")}...",
                        ajaxOptions: { 
                                        type: "POST",
                                        data: { 
                                                
                                              },
                                        statusCode: {
                                                401: function() { $(".errors").messagesManager('error',$.ajax2Settings('getMessage','401')); },
                                                403: function() { document.location=window.location.pathname; }, // Redirection to Login 
                                                404: function() { $(".errors").messagesManager('error',$.ajax2Settings('getMessage','404').format(this.url)); }
                                            }
                                     }                                           
    }).addClass('ui-tabs-vertical ui-helper-clearfix');

    $("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left'); 

    // Help messages
    $('.items-view').mouseenter(function(){
        $("#help").html($("span#item-"+this.name).html());
    });

    $('.items-view').mouseleave(function(){
        $("#help").html("&nbsp;");
    }); 
    
     {* =========== A C T I O N S ===================================== *}  
     
    $("#Save").click(function() { 
         var params={    CmsMenuNode : {
                                    menu: { },
                                    menu_i18n : {
                                             menu_id : $(".tree_page.selected").attr('id'),     
                                             lang: $("#SelectListLanguages option:selected").attr('id')   
                                    },
                                    page : { },
                                    page_i18n : { },
                                    token : "{mfForm::getToken('CmsMenuPageNodeForm')}"
                         }
                     };     
             $(".PageI18n.Input").each(function() { params.CmsMenuNode.page_i18n[$(this).attr('name')]=$(this).val(); }); 
             $(".Page.Input").each(function() { params.CmsMenuNode.page[$(this).attr('name')]=$(this).val(); });             
             $(".Menu.Input").each(function() { params.CmsMenuNode.menu[$(this).attr('name')]=$(this).val(); });  
             $(".MenuI18n.Select option:selected").each(function() { params.CmsMenuNode.menu_i18n[$(this).parent().attr('name')]=$(this).val(); }); 
             $(".MenuI18n.Checkbox").each(function() { params.CmsMenuNode.menu_i18n[$(this).attr('name')]=$(this).prop('checked')?'YES':'NO'; });  
             $(".PageI18n.Checkbox").each(function() { params.CmsMenuNode.page_i18n[$(this).attr('name')]=$(this).prop('checked')?'YES':'NO'; });              
           //  alert("Params="+params.toSource()); return ;             
             return $.ajax2({ data: params , 
                    url: "{url_to("cms_pages_menu_ajax",['action'=>'SaveNode'])}",
                    files: ".files",
                    errorTarget :".error-node-view",
                    target: "#node_content",
                    success: function(response)
                             {
                                 // Communication inter component
                                 $("#tree").trigger({
                                            type:'updateNode',
                                            menu_id: $(".tree_page.selected").attr('id'),
                                            meta_title: $(".PageI18n[name=meta_title]").val(),
                                            url : $(".PageI18n[name=url]").val(), 
                                            name : $(".Page[name=name]").val(),
                                            page_id : $(".Page[name=name]").attr('id'),
                                            menu_i18n_id: {if $node_i18n->get('id')}{$node_i18n->get('id')}{else}null{/if},
                                            page_i18n_id: $(".PageI18n[name=is_cached]").attr('id')
                                 }); 
                                 
                             }
                });   
         }); 
         
    $(".PageI18n[name=meta_title]").keyup(function () { 
        $("#tree").trigger({ type:'updateNodeUrl', meta_title : $(this).val() });
    });         
</script>    
{else}
    {__('Node is invalid.')}    
{/if}    