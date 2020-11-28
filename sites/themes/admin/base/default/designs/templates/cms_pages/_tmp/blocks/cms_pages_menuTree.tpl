{stylesheets}
{* actions for tree *}
<style>
    .menu-act{
        float: right;
        margin: 10px;
        border-radius: 0;
    }
    .btn-primary img{
        margin-right: 10px;
    }
</style>
<div class="header_menuTree_top" style="margin-top: 10px; width: 100%; display: inline-block;">
    <a id="Tree-New" class="btn btn-success menu-act" href="#"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('New')}</a>   
    <a id="Tree-Refresh" class="btn btn-info menu-act" href="#"><i style="margin-right: 10px;"class="fas fa-redo"></i>{__('Refresh')}</a>   
    <a id="Tree-Move" class="tree_actions btn btn-warning menu-act" style="display:none; color: white;" href="#"><i style="margin-right:10px; color: white;" class="fas fa-arrows-alt"></i>{__('Move')}</a>   
    <a id="Tree-Delete" class="tree_actions btn btn-danger menu-act" href="#" style="display:none;"><i style="margin-right:10px;" class="fas fa-trash-alt"></i>{__('Delete')}</a>   
    <a id="Tree-View" class="tree_actions_item btn btn-success menu-act" href="#" style="display:none;"><i style="margin-right:10px;" class="fa fa-pencil-alt"></i>{__('Edit')}</a>    
    <a class="Tree-Change btn btn-success menu-act" name="YES" href="#" style="display:none;"><i style="margin-right:10px; color: white;" class="fas fa-check"></i>{__('Change')}</a>     
    <a class="Tree-Change btn btn-danger menu-act" name="NO" href="#" style="display:none;"><i style="margin-right:10px; color: white;" class="fas fa-circle"></i>{__('Change')}</a>     
    <a id="Tree-ChangePage" class="btn btn-primary menu-act" href="#" class="tree_actions" style="display:none;"><img  src="{url('/icons/pages/pages_link.gif','picture')}" alt="{__('Change page')}"/>{__('Change page')}</a>     
    <a id="Tree-Save" class="btn btn-success menu-act" href="#" style="display:none;"><i style="margin-right:10px; color: white;" class="fas fa-save"></i>{__('Save')}</a>    
</div> 
<div id="sidetreecontrol" style="width: 370px; position: absolute; left: calc((100% - 370px) / 2);">
    <a id="collapse" class="btn btn-default" href="#">{__('Collapse all')}</a>|
    <a id="expand" class="btn btn-default" href="#">{__('Expand all')}</a>|
    <a id="toggle" class="btn btn-default" href="#">{__('Toggle')}</a>|
    <a id="Tree-Mode" class="btn btn-default" href="#">{__('Single')}</a>
    <a id="Tree-Select" class="btn btn-default" href="#" style="display:none;">|{__('Select all')}</a> 
</div>
<table cellpadding="0" cellspacing="0" style="margin-top: 50px;">
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
            <span>{__('Sitemap')}</span>                 
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
            selected= { id: $(ui.item).attr('id'),node: item.parent().parent().attr('id'), action : "asFirstChild" };  
        }    
        else
        {
            selected= { id: $(ui.item).attr('id'),node: item.prev().attr('id'), action : "asNextSibling" }; 
        }  
        update(selected);
    }

    function start(event,ui)
    {
       if (ui.item.children('.move').length==0)
            ui.item.prepend('<img class="move" src="{url("/icons/move.gif","picture")}" alt="{__("Move")}"/>');
    }
    
    $("#Tree-Save").data('action','noaction');
     
    $("#tree").show();                                  

    $(".tree_page").on('click',function() {
        $("#node_content").html("");                 
        if ($("#Tree-Mode").hasClass('selections'))
        {    
            if ($(this).hasClass('selected'))  
                $(this).parent().children('.move').remove();
            $(this).toggleClass("selected");                                   
        }
        else
        {
            $(".tree_page").not($(this)).removeClass("selected");                 
            $(this).toggleClass("selected"); 
            $(".move").remove();                             
        }  
        // Adapt menu tree in function of action
        if ($(".tree_page.selected").length)
           $(".tree_actions,.tree_actions_item").show();
        else
           $(".tree_actions,.tree_actions_item").hide();
        // Change action buttons
        if ($(this).attr('name'))
           $(".Tree-Change").show();   
        else
           $(".Tree-Change").hide();          
       // $("#Tree-Save").hide(); 
   });
            // Action Select All or Unselect All
    $('#Tree-Select').click(function() {  
              $(this).toggleClass('all');
              if ($(this).hasClass("all"))
              {
                $(".tree_page").addClass("selected"); 
                $(this).html("|{__('Deselect all')}");
                $(".tree_actions").show(); 
              }   
              else
              {
                 $(this).html("|{__('Select all')}");
                 $(".tree_actions").hide(); 
                 $(".tree_page").removeClass("selected"); 
              }    
   });

            // Action Module Single or Multiple
    $("#Tree-Mode").click(function() { 
                  $(this).toggleClass("selections");
                  $(this).html($(this).hasClass('selections')?"{__('Multiple')}":"{__('Single')}");
                  if ($("#Tree-Mode").hasClass('selections'))
                  { 
                    $('#Tree-Select').show();
                    $('#Tree-ChangePage').hide();                 
                  }
                  else                  
                  {
                    $(".move").remove();
                    $(".tree_page").removeClass("selected");
                    $('#Tree-Select').hide();
                  }  
    });

    $("#Tree-Move").click(function() {
                $("#Tree-Save").show();
                $("#Tree-Move").hide();
                if ($(".tree_page.selected").parent().children('.move').length==0)
                {    
                    $("#Tree-Save").data('action','Move');
                    $(".tree_page.selected").parent().prepend('<img class="move" src="{url("/icons/move.gif","picture")}" alt="{__("Move")}"/>');
                    $('#tree ul').sortable({
                            connectWith:'#tree ul',   
                           // placeholder: "ui-state-highlight",
                            placeholder:'placeholder-tree',                        
                          //  cursor: 'all-scroll',
                          //  nested:'ul',  
                          //  handle: '.handle',
                          //  tolerance : 'intersect',
                            start : function (event,ui) {
                                start(event,ui);
                            },
                            stop: function (event,ui) {
                                 setPosition(event,ui);                             
                            }
                    });
                  //  $('#tree').disableSelection();
                }
   });

            // Actions
    $("#Tree-Delete").click(function() { 
                if ($(".tree_page.selected").length==1)
                {
                    text=$(".tree_page.selected span").html()+"\n";
                    if (!confirm("{__('Page :\u000A\u000A#0#\u000A\u000A will be deleted. Confirm ?')}".format(text))) 
                         return false;
                    return $.ajax2({ data: { CmsMenu: $(".tree_page.selected").parent().attr('id') },
                               url : "{url_to("cms_pages_menu_ajax",['action'=>'DeleteNode'])}",
                               success : function(response) {
                                              if (response.action=='DeleteNode' && response.id==$(".tree_page.selected").attr('id'))
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
                    alert("{__('Not implemented')}"); return;
                    var params={ selection : {  } };
                    text="";
                    $(".tree_page.selected").each(function (id) { 
                        params.selection[id]=$(this).attr('name');
                        text+=$("li a[name='"+$(this).attr("name")+"'] span").html()+",\n";
                    });
                    if (!confirm("{__('Pages :\u000A\u000A#0#\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                       return false;                  
                }
                return false;
   });

    $("#Tree-Refresh").click(function() {               
       return $.ajax2({ 
              data : {
                  language :  {
                      lang: $("#SelectListLanguages option:selected").attr('id'),
                      token: "{mfForm::getToken('MenuLanguageForm')}"
                  }
              },                   
              url : "{url_to('cms_pages_menu_ajax',['action'=>'RefreshTree'])}",
              target: "#actions"});
    });
                       
    $("#Tree-View").click(function() {
       return $.ajax2({
             data: { 
                      CmsMenuI18n : {                                  
                           menu_id:$(".tree_page.selected").attr('id'), 
                           lang: $("#SelectListLanguages option:selected").attr('id'),
                           token: "{mfForm::getToken('CmsMenuNodeForm')}"
                   } },
             url: "{url_to("cms_pages_menu_ajax",['action'=>'ViewNode'])}",
             target: "#node_content"          
       });
    });
           
            $("#Tree-ChangePage").click(function() {                           
               $("#Tree-Move").hide();
               $(".move").remove();
               return $.ajax2({
                     data: { 
                               cmsMenu : {
                                   id:$(".tree_page.selected").attr('id'), 
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                                                    
                                   token : "{mfForm::getToken('cmsMenuWithLanguageForm')}"
                               }
                           },
                     url: "{url_to('cms_pages_menu_ajax',['action'=>'ChangePage'])}",
                     target: "#node_content"          
               });
            });
            
           $("#Tree-Save").click(function() {    
                $(this).hide();
                if (movedPages.length==0)
                    return false;
                if (movedPages.length==1)
                {
                    data= movedPages[0];
                    $.extend(data, { token : "{mfForm::getToken('CmsMenuMoveNodeForm')}" });
                    return $.ajax2({ data : { 
                                           page : data 
                                       },
                                   url: "{url_to("cms_pages_menu_ajax",['action'=>'MoveNode'])}",
                                   success:function (resp) { 
                                               //alert("response="+resp.toSource());
                                               if (resp.action=='MoveNode')
                                               {  
                                                    $(".move").remove();
                                               }
                                   }    
                    });
                }                  
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
                     $(".Tree-Change").show();    
            }); 
            
            $("#tree").bind('updateNodeUrl',function(event){ 
                $(".tree_page.selected").children("span#title").html(event.meta_title);
            }); 

    $("#Tree-New").click(function() { 
       return $.ajax2({ data : { Node : $(".tree_page.selected").attr('id') },
              url: "{url_to("cms_pages_menu_ajax",['action'=>'NewNode'])}",
              success: function (response)
                       {
                           if (response.action=='NewNode')
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
                                           '<span id="title">{__("No title")}</span></a></li>').format(response.id));
                           }    
                       }
              });
    });
            
             
            $(".Tree-Change").click(function () {
                if ($(".tree_page.selected").length==1)
                {
                    return $.ajax2({
                                   data : { PageI18n : { 
                                             id : $(".tree_page.selected").attr('name'),
                                             value: $(this).attr('name'),
                                             token: "{mfForm::getToken('ChangeForm')}"
                                          } },
                                   url: "{url_to("cms_pages_menu_ajax",['action'=>'ChangeIsActiveNode'])}",
                                   success: function (response)
                                            {
                                                if (response.action=='ChangeNode')
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
                                   url: "{url_to("cms_pages_menu_ajax",['action'=>'ChangePages'])}",
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
            
     {JqueryScriptsReady}
          $("#tree").treeview({
                                collapsed: false, 
                                animated: "medium",
                                control:"#sidetreecontrol",
                             //   persist: "cookie",
                             //   cookieId: "tree_cms_menus",
                            //   cookieOptions: { path: "/admin/" } 
                        });  
       
     {/JqueryScriptsReady}
    
</script>


{* http://a.shinynew.me/post/4641524290/jquery-ui-nested-sortables *}