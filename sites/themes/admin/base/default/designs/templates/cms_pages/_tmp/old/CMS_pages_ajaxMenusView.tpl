{stylesheets}
{messages class="error_menu_view"}
 <div>
    <a href="#" id="MenuPage-Save" style="display:none;"><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a>  
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
             <a href="#tab_menu" title="{__('menu')}" name="tab_menu" class="items_view">
                  <img height="32" width="32" src="{url('/icons/sitemap.png','picture')}" alt="{__('menu')|capitalize}"/>                  
                  <span>{__('menu')|capitalize}</span>
             </a>
             <span style="display:none;" id="item_tab_menu">{__("help menu")|default:'&nbsp;'}</span>
         </li>
         <li>
             <a href="#tab_control" title="{__('control')}" name="tab_control" class="items_view">
                  <img height="32" width="32" src="{url('icons/control.png','picture')}" alt="{__('control')|capitalize}"/>                  
                  <span>{__('control')|capitalize}</span>
             </a>
             <span style="display:none;" id="item_tab_control">{__("help control")|default:'&nbsp;'}</span>
         </li>
         <li>
             <a href="#tab_referencement" title="{__('referencement')}" name="tab_referencement" class="items_view">
                  <img height="32" width="32" src="{url('icons/seo.png','picture')}" alt="{__('referencement')|capitalize}"/>                  
                  <span>{__('referencement')|capitalize}</span>
             </a>
             <span style="display:none;" id="item_tab_referencement">{__("help referencement")}</span>
         </li>
         <li>
             <a href="#tab_design" title="{__('design')}" name="tab_design" class="items_view">
                  <img height="32" width="32" src="{url('icons/design.png','picture')}" alt="{__('design')|capitalize}"/>                  
                  <span>{__('design')|capitalize}</span>
             </a>
             <span style="display:none;" id="item_tab_design">{__("help design")}</span>
         </li>
         <li>
             <a href="#tab_content" title="{__('content')}" name="tab_content" class="items_view">
                  <img height="32" width="32" src="{url('icons/content.png','picture')}" alt="{__('content')|capitalize}"/>                  
                  <span>{__('content')|capitalize}</span>
             </a>
             <span style="display:none;" id="item_tab_content">{__("help content")}</span>
         </li>
    </ul>
    {* ====================== M E N U ============================================= *}
    <div id="tab_menu">
        {include file="./includes/MenusView/_menu.tpl"}
    </div>
    {* ====================== C O N T R O L ============================================= *}
    <div id="tab_control">     
        {include file="./includes/MenusView/_control.tpl"}
    </div> 
    {* ====================== R E F E R E N C E M E N T ============================================= *}
    <div id="tab_referencement">        
        {include file="./includes/MenusView/_referencement.tpl"}
    </div>
     {* ====================== D E S I G N ============================================= *}
    <div id="tab_design">        
        {include file="./includes/MenusView/_design.tpl"}
    </div>
    {* ====================== C O N T E N T ============================================= *}
    <div id="tab_content">       
        <textarea rows="15" cols="80" class="editor" name="content">{$menuI18n->getCmsMenu()->getCmsPage()->getCmsI18nPage()->get('content')}</textarea>
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
    $('.items_view').mouseenter(function(){
        $("#help").html($("span#item_"+this.name).html());
    });

    $('.items_view').mouseleave(function(){
        $("#help").html("&nbsp;");
    }); 
    
    {* ========== P I C T U R E ====================================================================== *}
    $('#pictureChange,#pictureAdd').click(function(){ 
              $("#pictureForm").show();
              $(this).hide();
      });
      
      $('#pictureDelete').click(function(){ 
                  if (!confirm('{__("picture will be deleted. Confirm ?")}')) return false; 
                  return $.ajax2({ data : { menuI18n: "{$menuI18n->get('id')}" }, 
                                   url : "{url_to("cms_menus_pages_ajax",['action'=>'DeletePicture'])}",
                                   success : function (response)
                                             {
                                                    if (response.action=='deletePicture'&&response.id=="{$menuI18n->get('id')}")
                                                    {
                                                        $("#pictureAdd").show();
                                                        $("#pictureChange,#pictureFilename,#pictureImg,#pictureDelete,#pictureForm").hide();
                                                    }
                                             }
                  });  
      });  
         
         $("#pictureUpload").click(function () { 
             $("#error_picture").html('');
             return $.ajax2({ data : { menuI18n : { id: "{$menuI18n->get('id')}", token : "{mfForm::getToken('cmsI18nMenuPictureForm')}" } },
                              files: "#pictureFile",
                              errorTarget: ".error_menu_view",
                              url: "{url_to("cms_menus_pages_ajax",['action'=>'SavePicture'])}",
                              loading: "#pictureLoading",
                              complete : function ()
                                         {
                                             $("#pictureFile").val('');    
                                         },
                              success: function (response)
                                       {
                                            if (response.picture)
                                            { 
                                                $("#pictureImg").attr('src',"{$menuI18n->getPicture()->getURLPath()}"+response.picture+"?"+$.now()); 
                                                $("#pictureFilename").html("["+response.picture+"]");
                                                $("#pictureForm,#pictureAdd").hide(); 
                                                $("#pictureChange,#pictureDelete,#pictureFilename,#pictureImg").show();
                                            }
                                            
                                            if (response.errors)
                                            {
                                              $("#error_picture").html(response.errors);
                                            }    
                                       }
                            });
    });
    
 $("#iconUpload").click(function () { 
             $("#error_icon").html('');
             return $.ajax2({ data : { menuI18n : { id: "{$menuI18n->get('id')}", token : "{mfForm::getToken('cmsI18nMenuIconForm')}" } },
                              files: "#iconFile",
                              errorTarget: ".error_menu_view",
                              url: "{url_to("cms_menus_pages_ajax",['action'=>'SaveIcon'])}",
                              loading: "#iconLoading",
                              success: function (response)
                                       {
                                            $("#iconFile").val('');     
                                            if (response.icon)
                                            { 
                                                $("#iconImg").attr('src',"{$menuI18n->getIcon()->getURLPath()}"+response.icon+"?"+$.now()); 
                                                $("#iconFilename").html("["+response.icon+"]");
                                                $("#iconForm,#iconAdd").hide(); 
                                                $("#iconChange,#iconDelete,#iconFilename,#iconImg").show();
                                            }
                                            
                                            if (response.errors)
                                            {
                                              $("#error_icon").html(response.errors);
                                            }   
                                       }
                            });
         });                  
         
         $('#iconDelete').click(function(){ 
                  if (!confirm('{__("icon will be deleted. Confirm ?")}')) return false; 
                  return $.ajax2({ data : { menuI18n: "{$menuI18n->get('id')}" },
                                   url :"{url_to("cms_menus_pages_ajax",['action'=>'DeleteIcon'])}",
                                   success: function(response) {
                                                    if (response.action=='deleteIcon'&&response.id=="{$menuI18n->get('id')}")
                                                    {
                                                        $("#iconAdd").show();
                                                        $("#iconChange,#iconFilename,#iconImg,#iconDelete,#iconForm").hide();
                                                    }                            
                                             }
                  });  
         }); 
         
         $('#iconChange,#iconAdd').click(function(){ 
              $("#iconForm").show();
              $(this).hide();
         });
    {JqueryScriptsReady}  
     
    {* ============== F I E L D S ======================================================= *}
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
    
    $(".pageI18n,.menu,.menuI18n,.page").click(function(){ 
       $("#MenuPage-Save").show();
    });
    
    $(".pageI18n[name='meta_title']").keyup(function () { 
        $("#tree").trigger({ type:'updateNodeUrl', meta_title : $(this).val() });
    });
    
    $("#MenuPage-Save").click(function() { 
         var params={    menuI18nView : {            
                                            menu_id : $(".tree_page.selected").attr('id'),     
                                            lang: $(".cms_pages[name=lang]").attr('id'),
                                            token : "{mfForm::getToken('cmsMenuI18nWithLanguageForm')}"
                                    },
                         MenuPage : 
                              { menu : { },
                                menuI18n : {                                     
                                     target : $(".menuI18n[name='target']").val(),                                               
                                     is_link : $(".menuI18n[name='is_link']:checked").val()?"YES":"NO", 
                                },
                                page : { },
                                pageI18n : {
                                       content: $('textarea.editor[name=content]').html()
                                },                                                        
                                token : "{mfForm::getToken('cmsMenuPageForm')}"
                         }
                     };     
             $(".pageI18n").each(function() { params.MenuPage.pageI18n[this.name]=$(this).val(); }); 
             $(".page").each(function() { params.MenuPage.page[this.name]=$(this).val(); });             
             $(".menu").each(function() { params.MenuPage.menu[this.name]=$(this).val(); }); 
             params.MenuPage.pageI18n.is_cached=$(".pageI18n[name=is_cached]:checked").val()?"YES":"NO";
             params.MenuPage.pageI18n.in_menu=$(".pageI18n[name=in_menu]:checked").val()?"YES":"NO";
          //   alert("Params="+params.toSource()); return ;             
             return $.ajax2({ data: params , 
                    url: "{url_to("cms_menus_pages_ajax",['action'=>'SaveMenuPage'])}",
                    files: ".files",
                    errorTarget :".error_menu_view",
                    target: "#node_content",
                    success: function(response)
                             {
                                 // Communication inter component
                                 $("#tree").trigger({
                                            type:'updateNode',
                                            menu_id: $(".tree_page.selected").attr('id'),
                                            meta_title: $(".pageI18n[name='meta_title']").val(),
                                            url : $(".pageI18n[name='url']").val(), 
                                            name : $(".page[name='name']").val(),
                                            page_id : $(".page[name='name']").attr('id'),
                                            menu_i18n_id: {if $menuI18n->get('id')}{$menuI18n->get('id')}{else}null{/if},
                                            page_i18n_id: $(".pageI18n[name='is_cached']").attr('id')
                                 }); 
                                 
                             }
                });   
         }); 
         
          $('textarea.editor').tinymce({
			// Location of TinyMCE script			
                        script_url : "{url('/js/tiny_mce/3.4.6/tiny_mce.js','web','frontend')}",
                        language : '{$language}',
                        setup : function (ed) {
                                  ed.onKeyPress.add(
                                      function (ed, evt) {
                                          $('#MenuPage-Save').show();                                                
                                      }
                             );
                        },
			// General options
			theme : "advanced",  //,print,save
	                plugins : "pagebreak,style,layer,table,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",
			// Theme options
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,
                        relative_urls : false,
                        remove_script_host : false                    
                       
	   }); 
   {/JqueryScriptsReady}         
</script>
    