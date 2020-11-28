<div id="dashboard-site-tabs-{$site->getSiteId()}">    
     <ul id="dashboard-site-tabs-ctn-{$site->getSiteId()}">
        {foreach $tabs->getSortedTabs() as $name=>$tab} 
        <li class="site" id="site-{$site->getSiteId()}-{$name}" aria-controls='site-panel-{$site->getSiteId()}-{$name}' name="site-panel-{$site->getSiteId()}-{$name}">            
            <a href="{if $tab.route}{$tab->getRoute()}{else}#tab-{$site->getSiteId()}-{$name}{/if}" id="site-panel-{$site->getSiteId()}-{$name}-link" title="{__($tab.title)}" name="tab-{$site->getSiteId()}-{$name}" class="tab-site">         
                 {if $tab.icon}<i class="fa fa-{$tab.icon}"></i>
                 {elseif $tab.picture}<img height="32" width="32" src="{url($tab.picture,'web')}" alt="{__($tab.title)|capitalize}"/>{/if}
                 <span class="name-tabs">{__($tab.title)|capitalize}</span>    
                 <img id="tab-site-{$site->getSiteId()}-{$name}-loading" class="loading" style="display:none;" style="z-index: 500" height="16px" width="16px" src="{url('/icons/loader.gif','picture')}" alt="loader"/>
            </a>              
            <span style="display:none;" id="item_tab{$name|capitalize}">{__($tab.help)|default:'&nbsp;'}</span>    
        </li>
        {/foreach}
     </ul>
   {foreach $tabs->getComponents() as $name=>$tab}   
       
    {if !$tab.route}        
    <div id="tab-{$site->getSiteId()}-{$name}" name="{if $tab.route}{$tab->getRoute()}{/if}">
       {component name=$tab.component}         
    </div>   
    {/if} 
    {/foreach} 
</div>
<script type="text/javascript">
     {JqueryScriptsReady}          
        
        $("#dashboard-site-tabs-{$site->getSiteId()}").data('ajax_off',false);
        
        function isSiteTabFieldExistAndOpen(site,tab,id)
        {       
          // alert("site="+site+" tab="+tab+" id="+id);
          if ($("#tab-site-"+site+"-field-"+tab+"-"+id).length > 0)
          {    
             $("#site-panel-"+site+"-dashboard-site-"+tab+"-static").tabs({ active : $("#tab-site-static-site-panel-"+site+"-dashboard-site-"+tab+"-ctn li#tab-site-"+site+"-field-"+tab+"-"+id).index() });
             return true;
          }         
          return false;
        }
     
        function isExistSiteTabField(site,tab,id)
        {                      
          return  ($("#tab-site-"+site+"-field-"+tab+"-"+id).length > 0);         
        }
        
        function openSiteTab(site,tab,ajax_off)
        {
              $("#dashboard-site-tabs-"+site).data('ajax_off',ajax_off);
              $("#dashboard-site-tabs-"+site).tabs({ active: $("#dashboard-site-tabs-"+site+" li#site-"+site+"-dashboard-site-"+tab).index()  });
        }
        
        function openSiteTabField(site,tab,id)
        {
          //  $("#site-panel-"+site+"-dashboard-site-"+tab+"-static").tabs({ active : $("#tab-site-static-site-panel-"+site+"-dashboard-site-customers-meeting-ctn li#tab-site-"+site+"-field-"+tab+"-"+id).index() }); 
            $("#site-panel-"+site+"-dashboard-site-"+tab+"-static").tabs({ active : $("#tab-site-static-site-panel-"+site+"-dashboard-site-"+tab+"-ctn li#tab-site-"+site+"-field-"+tab+"-"+id).index() }); 
        }
                  
         function addSiteTabField(site,tab,id,title)
         {
            // alert("site="+site+" tab="+tab);
             if (isSiteTabFieldExistAndOpen(site,tab,id))
                return true;      
             name="tab-site-panel-" + site +"-dashboard-site-"+tab+"-"+id; 
             href="#"+name; 
             tab_id="site-panel-"+site+"-dashboard-site-"+tab+"-static";
             tabTemplate = "<li id='tab-site-"+site+"-field-"+tab+"-"+id+"' name='"+tab_id+"'>"+
                            "<span class='ui-icon ui-icon-close close-site' title='{__('Close')}' role='presentation'>{__('Remove')}</span>"+
                            "<a href='"+href+"'>"+
                               // "<img width='32' height='32' alt='Sites' src='{url('/icons/website.png','picture')}'>"+
                                "<span>"+title+"</span>"+
                           "</a>"+                            
                      "</li>";  
              panelTemplate="<div id='"+name+"'>"+                          
                            "</div>";
              //ul: id->  tab-site-static-site-panel-www-ecosol-net-dashboard-site-customers-meeting-ctn
              //div: id -> site-panel-www-ecosol-net-dashboard-site-customers-meeting-static
              $("#tab-site-static-site-panel-"+site+"-dashboard-site-"+tab+"-ctn").append( tabTemplate ); 
              // tab-site-panel-www-ecosol-net-dashboard-site-customers-meeting-base
              $("#tab-site-panel-"+site+"-dashboard-site-"+tab+"-base").after( panelTemplate ); 
              $("#site-panel-"+site+"-dashboard-site-"+tab+"-static").tabs( "refresh" ); 
              name="tab-site-"+site+"-field-"+tab+"-"+id;
              $("#site-panel-"+site+"-dashboard-site-"+tab+"-static").tabs({ active: $('.ui-tabs-nav li#tab-site-'+site+'-field-'+tab+'-'+id).index() }); //Will activate already existing tab
              //alert("idx="+$('.ui-tabs-nav li#'+name).index());
              return false;
         }
             
     
         $( "#dashboard-site-tabs-{$site->getSiteId()}" ).on( "tabsbeforeload", function( event, ui ) {                                        
             if ($("#"+ui.tab.attr('name')+"-static").length==0)
             {    
                  //   alert('ui='+ui.tab.attr('name'));
                $("#"+ui.tab.attr('name')).append("<div id='"+ui.tab.attr('name')+"-static' class='tab-sites-test' style=''>"+
                                                      "<ul id='tab-site-static-"+ui.tab.attr('name')+"-ctn'>"+
                                                        "<li id='base'>"+
                                                            "<a href='#tab-"+ui.tab.attr('name')+"-base'>"+
                                                                "<img title='{__('tab')}' height='16px' width='16px' src='{url('/icons/info-btn.jpg','picture')}'/>"+
                                                            "</a>"+
                                                        "</li>"+
                                                      "</ul>"+
                                                      "<div id='tab-"+ui.tab.attr('name')+"-base'>"+   
                                                      "</div>"+                                                    
                                                  "</div>"+
                                                  "" //<div id='"+ui.tab.attr('name')+"-dynamic'></div>"
                                                );
                $("#"+ui.tab.attr('name')+"-static").tabs();
             }   
             if ($("#dashboard-site-tabs-{$site->getSiteId()}").data('ajax_off'))
             {
                 $("#dashboard-site-tabs-{$site->getSiteId()}").data('ajax_off',false);
                 return false;
             } 
             return $.ajax2({  url: $("#"+ui.tab.attr('name')+"-link").attr('href') ,                             
                               target : "#tab-"+ui.tab.attr('name')+"-base",
                               loading: "#tab-"+ui.tab.attr('id')+"-loading",   //"#tab-site-{$site->getSiteId()}"                              
                            });            
          });         
           
          $("#dashboard-site-tabs-{$site->getSiteId()}").tabs();
          
          // Manage close btn
          // tab-site-panel-www-ecosol-net-dashboard-site-customers-meeting-New => Remove panel
          //
          $("#dashboard-site-tabs-{$site->getSiteId()}").tabs().delegate( "span.ui-icon-close.close-site", "click", function() {          
                var tabName=$( this ).closest( "li" ).attr('name');               
                $( this ).closest( "li" ).remove().attr( "aria-controls" );    
                $("#"+$( this ).closest( "li" ).attr( "aria-controls" )).remove(); // remove panel
                $("#"+tabName).tabs("refresh");        
          });
          
     {/JqueryScriptsReady}  
</script>  