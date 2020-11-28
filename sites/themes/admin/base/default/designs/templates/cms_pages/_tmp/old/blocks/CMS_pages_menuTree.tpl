{stylesheets}
{* actions for tree *}
<div>
    <a id="New" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('new')|capitalize}</a>   
    <a id="Refresh" href="#"><img  src="{url('/icons/refresh.png','picture')}" alt="{__('refresh')}"/>{__('refresh')|capitalize}</a>   
    <a id="Move" class="tree_actions" style="display:none;" href="#"><img src="{url('/icons/move.gif','picture')}" alt="{__('move')}"/>{__('move')|capitalize}</a>   
    <a id="Delete" class="tree_actions" href="#" style="display:none;"><img src="{url('/icons/delete.gif','picture')}" alt="{__('delete')}"/>{__('delete')|capitalize}</a>   
    <a id="View" class="tree_actions_item" href="#" style="display:none;"><img  src="{url('/icons/edit.gif','picture')}" alt="{__('edit')}"/>{__('edit')|capitalize}</a>    
    <a class="Change" name="YES" href="#" style="display:none;"><img  src="{url('/icons/YES.gif','picture')}" alt="{__('change')}"/>{__('change')|capitalize}</a>     
    <a class="Change" name="NO" href="#" style="display:none;"><img  src="{url('/icons/NO.gif','picture')}" alt="{__('change')}"/>{__('change')|capitalize}</a>     
    <a id="ChangePage" href="#" class="tree_actions" style="display:none;"><img  src="{url('/icons/pages/pages_link.gif','picture')}" alt="{__('change page')}"/>{__('change page')|capitalize}</a>     
    <a id="Save" href="#" style="display:none;"><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')|capitalize}</a>    
</div> 
<div id="sidetreecontrol">
    <a id="collapse" href="#">{__('collapse all')|capitalize}</a>|
    <a id="expand" href="#">{__('expand all')|capitalize}</a>|
    <a id="toggle" href="#">{__('toggle')|capitalize}</a>|
    <a id="Mode" href="#">{__('single')|capitalize}</a>
    <a id="Select" href="#" style="display:none;">|{__('select all')|capitalize}</a>   
</div>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td width="250px;">
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top;">
            <span>{__('sitemap')}</span>      
            {* {include file="./menuTree/_menu_view_tree.tpl" tree=$tree->getTree()}            *}
            {include file="./tree/_menu_view_tree.tpl" children=$children} 
        </td>
        <td style="vertical-align: top;">
           <div id="node_content"></div>     
        </td>
    </tr>
</table> 
<script type="text/javascript">

    var movedPages=[];

    function update(selected)
    {
        found=false;
        $.each(movedPages,function (i){ 
           if (this.id==selected.id)
           {
               found=true;
               movedPages[i]=selected;
           }    
        });
        if (!found)
            movedPages.push(selected);
    }

    function setPosition(event,ui)
    {
        item=$("#"+$(ui.item).attr('id'));
        if (item.is(":first-child")) 
        {
            selected= { id: $(ui.item).attr('id'),node: item.parent().parent().attr('id'), action : "asFirstChild" };  // TO TEST
        }    
        else
        {
            selected= { id: $(ui.item).attr('id'),node: item.prev().attr('id'), action : "asNextSibling" }; // TO TEST
        }  
        update(selected);
    }

    function start(event,ui)
    {
       if (ui.item.children('.move').length==0)
            ui.item.prepend('<img class="move" src="{url("/icons/move.gif","picture")}" alt="{__("move")}"/>');
    }



            $("#tree").show(); 
            
            $(".tree_page").die(); // Remove last live 
              
        {*    $(".tree_page").live('click',function() {
               $("#node_content").html("");
               if ($("#Mode").hasClass('selections'))
               {    
                   if ($(this).hasClass('selected'))  
                       $(this).parent().children('.move').remove();
                   $(this).toggleClass("selected"); 
                   if ($(".tree_page.selected").length)
                       $(".tree_actions").show();
                   else  
                       $(".tree_actions,.tree_actions_item").hide();
                   if ($(".tree_page.selected").length==1)
                       $(".tree_actions_item").show();
                   else
                      $(".tree_actions_item").hide();  
                   if ($(this).attr('name'))
                        $(".Change,#ChangePage").show();   
               }
               else
               {
                   $(".tree_page").removeClass("selected");
                   $(this).toggleClass("selected"); 
                   $(".move").remove();
                   $(".tree_actions_item,.tree_actions").show(); 
                   if ($(this).attr('name'))
                      $(".Change,#ChangePage").show();   
                   else
                      $(".Change,#ChangePage").hide();
               }  
            }); *}

            $(".tree_page").live('click',function() {
               $("#node_content").html("");          
               if ($("#Mode").hasClass('selections'))
               {    
                   if ($(this).hasClass('selected'))  
                       $(this).parent().children('.move').remove();
                   $(this).toggleClass("selected"); 
                 //  if ($(".tree_page.selected").length)
                  //     $(".tree_actions").show();
                 //  else  
                 //      $(".tree_actions,.tree_actions_item").hide();
               /*    if ($(".tree_page.selected").length==1)
                       $(".tree_actions_item").show();
                   else
                      $(".tree_actions_item").hide();  */                   
               }
               else
               {
                   $(".tree_page").not($(this)).removeClass("selected");                 
                   $(this).toggleClass("selected"); 
                   $(".move").remove(); 
                 /*  $(".tree_actions_item,.tree_actions").show(); */                  
               }  
               // Adapt menu tree in function of action
               if ($(".tree_page.selected").length)
                  $(".tree_actions,.tree_actions_item").show();
               else
                  $(".tree_actions,.tree_actions_item").hide();
               // Change action buttons
               if ($(this).attr('name'))
                  $(".Change").show();   
               else
                  $(".Change").hide();            
               $("#Save").hide();
            });
            // Action Select All or Unselect All
            $('#Select').click(function() {  
              $(this).toggleClass('all');
              if ($(this).hasClass("all"))
              {
                $(".tree_page").addClass("selected"); 
                $(this).html("|{__('deselect all')|capitalize}");
                $(".tree_actions").show(); 
              }   
              else
              {
                 $(this).html("|{__('select all')|capitalize}");
                 $(".tree_actions").hide(); 
                 $(".tree_page").removeClass("selected"); 
              }    
            });

            // Action Module Single or Multiple
            $("#Mode").click(function() { 
                  $(this).toggleClass("selections");
                  $(this).html($(this).hasClass('selections')?"{__('multiple')|capitalize}":"{__('single')|capitalize}");
                  if ($("#Mode").hasClass('selections'))
                  { 
                    $('#Select').show();
                    $('#ChangePage').hide();
                  //  $(".tree_actions_item").hide();
                  }
                  else                  
                  {
                    $(".move").remove();
                    $(".tree_page").removeClass("selected");
                    $('#Select').hide();
                  }  
            });

            $("#Move").click(function() {
                if ($(".tree_page.selected").parent().children('.move').length==0)
                {    
                    $(".tree_page.selected").parent().prepend('<img class="move" src="{url("/icons/move.gif","picture")}" alt="{__("move")}"/>');
                    $('#tree').sortable({
                            items:'li',
                         //   cancel: ".ui-state-disabled",
                            placeholder:'placeholder-tree',                        
                            cursor: 'all-scroll',
                            nested:'ul',     
                            start : function (event,ui) {
                                start(event,ui);
                            },
                            stop: function (event,ui) {
                                 setPosition(event,ui);                             
                            }
                    });

                }
            });

            // Actions
            $("#Delete").click(function() { 
                if ($(".tree_page.selected").length==1)
                {
                    text=$(".tree_page.selected span").html()+"\n";
                    if (!confirm("{__('Page :\u000A\u000A#0#\u000A\u000A will be deleted. Confirm ?')}".format(text))) 
                         return false;
                    return $.ajax2({ data: { menu_id: $(".tree_page.selected").parent().attr('id') },
                               url : "{url_to("cms_menus_pages_ajax",['action'=>'DeletePage'])}",
                               success : function(response) {
                                              if (response.action=='deletePage'&&response.menu_id==$(".tree_page.selected").attr('id'))
                                              {
                                                  // update tree last ...
                                                  $(".tree_page.selected").parent().remove();
                                                  $("#node_content").html("");
                                              }    
                                    }
                     });       
                }    
                else
                {    
                    alert("{__('not implemented')}"); return;
                    var params={ selection : {  } };
                    text="";
                    $(".tree_page.selected").each(function (id) { 
                        params.selection[id]=$(this).attr('name');
                        text+=$("li a[name='"+$(this).attr("name")+"'] span").html()+",\n";
                    });
                    if (!confirm("{__('Pages :\u000A\u000A#0#\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                       return false; 
                  /*  ajax(params,"{url('/module/site/cms/menus/DeletePages9')}",null, function(resp) {
                               $(".tree_page").removeClass('selected');
                               if (resp.action=='deletePages')
                               {    
                               }      
                    });*/ 
                }
                return false;
            });

            $("#Refresh").click(function() {               
               return $.ajax2({ 
                      data : {
                          language :  {
                              lang: $(".cms_pages[name=lang]").attr('id'), 
                              token: "{mfForm::getToken('MenuLanguageForm')}"
                          }
                      },                   
                      url : "{url_to('cms_menus_pages_ajax',['action'=>'RefreshTree'])}",
                      target: "#actions"});
            });
                       
            $("#View").click(function() {
               return $.ajax2({
                     data: { 
                              menuI18nView : {                                  
                                   menu_id:$(".tree_page.selected").attr('id'), 
                                   lang: $(".cms_pages[name=lang]").attr('id'),                                                                 
                                   token : "{mfForm::getToken('cmsMenuI18nWithLanguageForm')}"                              
                           } },
                     url: "{url_to("cms_menus_pages_ajax",['action'=>'View'])}",
                     target: "#node_content"          
               });
            });
           
            $("#ChangePage").click(function() {                           
               $("#Move").hide();
               $(".move").remove();
               return $.ajax2({
                     data: { 
                               cmsMenu : {
                                   id:$(".tree_page.selected").attr('id'), 
                                   lang: $(".cms_pages[name=lang]").attr('id'),                                                            
                                   token : "{mfForm::getToken('cmsMenuWithLanguageForm')}"
                               }
                           },
                     url: "{url_to('cms_menus_pages_ajax',['action'=>'ChangePage'])}",
                     target: "#node_content"          
               });
            });
            
           $("#Save").click(function() {    
                $(this).hide();
                if (movedPages.length==0)
                    return false;
                if (movedPages.length==1)
                {
                    data= movedPages[0];
                    $.extend(data, { token : "{mfForm::getToken('cmsMenuMovePageForm')}" });
                    return $.ajax2({ data : { 
                                           page : data 
                                       },
                                   url: "{url_to("cms_menus_pages_ajax",['action'=>'MovePage'])}",
                                   success:function (resp) { 
                                               //alert("response="+resp.toSource());
                                               if (resp.action=='movePage')
                                               {  
                                                    $(".move").remove();
                                               }
                                   }    
                    });
                }   
                alert("{__('not implemented')}"); return;
                return $.ajax2({
                               data : { pages : movedPages },
                               url: "{url_to("cms_menus_pages_ajax",['action'=>'MovePages5'])}",
                               success: function ()
                                        {
                                            alert("toto");
                                        }
                             });
            });
            
            // Communication inter component
            $("#tree").bind('updateNode',function(event){ 
                
                $(".tree_page.selected").children("span#title").html(event.meta_title?event.meta_title:"{__('no title')}");
                $(".tree_page.selected").attr('name',event.page_i18n_id); // Update id
                $(".tree_page.selected").attr('title',"menu_i18n_id:"+event.menu_i18n_id+"\n"+
                                                      "menu_id:"+event.menu_id+"\n"+
                                                      "URL:"+event.url+"\n"+
                                                      "Name:"+event.name+"\n"+
                                                      "page_i18n_id:"+event.page_i18n_id
                                             );
                // if page exist => state can be changed                                 
                if (event.page_i18n_id)
                     $(".Change").show();    
            }); 
            
            $("#tree").bind('updateNodeUrl',function(event){ 
                $(".tree_page.selected").children("span#title").html(event.meta_title);
            }); 
            
            $("#New").click(function() { 
               return $.ajax2({ data : { node : {  
                                    id : $(".tree_page.selected").attr('id'),
                                    token: "{mfForm::getToken('cmsMenuNew')}"
                                  } },
                      url: "{url_to("cms_menus_pages_ajax",['action'=>'NewNode'])}",
                      success: function (response)
                               {
                                   if (response.action=='newNode')
                                   {
                                       if ($(".tree_page.selected").attr('id'))
                                       {
                                          node=$(".tree_page.selected").parent();
                                          $(".tree_page.selected").removeClass('selected');
                                       }    
                                       else
                                       {
                                           $("#tree_start li").last().removeClass("last");
                                           node=$("#tree_start");
                                       } 
                                       $("#node_content").html("");
                                       $(".tree_actions_item").show();
                                       node.append(('<li id="#0#" class="tree_node last">'+
                                                   '<a href="#" id="#0#" class="tree_page selected"'+
                                                   'title="menu_i18n_id:null&#13menu_id:#0#&#13page_id:null&#13URL:&#13Name:&#13page_i18n_id:">'+
                                                   '<img id="status" src="{url("/icons/pages/pages_inactive.gif","picture")}" alt="{__("page_status_")}"/>'+
                                                   '<span id="title">{__("no title")}</span></a></li>').format(response.id));
                                   }    
                               }
                      });
            });
            
             
            $(".Change").click(function () {
                if ($(".tree_page.selected").length==1)
                {
                    return $.ajax2({
                                   data : { page_i18n : { 
                                             id : $(".tree_page.selected").attr('name'),
                                             value: $(this).attr('name'),
                                             token: "{mfForm::getToken('ChangePageI18nForm')}"
                                          } },
                                   url: "{url_to("cms_menus_pages_ajax",['action'=>'ChangeIsActivePage'])}",
                                   success: function (response)
                                            {
                                                if (response.action=='ChangePage')
                                                {
                                                    $(".tree_page.selected").children("img#status").attr({
                                                       src: '{url("/icons/pages/pages","picture")}'+response.status+'.gif',
                                                       alt: response.alt
                                                    });  
                                                }    
                                            }
                                 });
                }     
                else
                {
                   selection = {  };
                   $(".tree_page.selected").each(function (id) { 
                       if ($(this).attr('name'))
                           selection[id]=$(this).attr('name');
                   }); 
                   
                   return $.ajax2({
                                   data : { page_i18n : { 
                                             selection : selection,
                                             value: $(this).attr('name'),
                                             token: "{mfForm::getToken('ChangePageI18nForm')}"
                                          } },
                                   url: "{url_to("cms_menus_pages_ajax",['action'=>'ChangePages'])}",
                                   success: function (response)
                                            {
                                                if (response.action=='ChangePages')
                                                {
                                                   /* $(".tree_page.selected").children("img#status").attr({
                                                       src: '{url("/icons/pages/pages","picture")}'+response.status+'.gif',
                                                       alt: response.alt
                                                    });  */
                                                }    
                                            }
                                 });
                }
            });
            
            
    {*

            $("#tree").treeview({
                                collapsed: false, //true,
                                animated: "medium",
                                control:"#sidetreecontrol",
                                persist: "cookie",
                                cookieId: "superadmin_treeCMSMenus",
                                cookieOptions: { path: "/superadmin/cms/category/pages" } 
                        });         
    *}  
</script>


