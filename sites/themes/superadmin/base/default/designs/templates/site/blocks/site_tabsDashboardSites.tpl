<div id="tab-dashboard-site-content">              
    {component name="/site/sitesList"}           
</div>

<script type="text/javascript">
    
     function isSiteTabExist(host)
     {
        name=host.replace(/\./g,"-");            
        if ($(".tabs-sites#sites-"+name).length > 0)
        {              
            $("#dashboard-home-tabs").tabs({ active: $('.ui-tabs-nav li#tab-sites-'+name).index() }); //Will activate already existing tab
            return true; 
        }             
        return false;
     }
     
     function addSiteTab(site,url) 
     {     
        if (isSiteTabExist(site))
            return true;          
        var tabs=$("#dashboard-home-tabs").tabs();
        name=site.replace(/\./g,"-") ;
        href=url?url:"#tabs-" + name;  
        tabTemplate = "<li id='tab-sites-"+name+"' class='tabs-sites' aria-controls='sites-panel-"+name+"' name='"+site+"'>"+
                            "<span class='ui-icon ui-icon-close' title='{__('Close')}' role='presentation'>{__('Remove')}</span>"+
                            "<a class='tabs-sites' id='sites-"+name+"' href='"+href+"' name='"+site+"'>"+
                                "<img width='32' height='32' alt='Sites' src='{url('/icons/website.png','picture')}'>"+
                                "<span>"+site+"</span>"+
                           "</a>"+  
                           "<img class='loading' id='tab-site-"+name+"-loading' style='display:none;' height='16px' width='16px' src='{url('/icons/loader.gif','picture')}' alt='loader'/>"+
                      "</li>";                                                   
       // tabs.find( ".ui-tabs-nav" ).append( tabTemplate );
       $("#dashboard-home-tabs-ctn").append( tabTemplate );     
       // if (!url)
      //  tabs.append( "<div class='sites' id='sites-panel-" + name + "'></div>" );  // only used if not ajax        
        tabs.tabs( "refresh" );    
        $("div#sites-panel-"+name).prepend("<div id='sites-panel-dynamic-"+name+"'></div>");
        $("div#sites-panel-"+name).prepend("<div id='sites-panel-static-"+name+"'></div>");       
        $("#dashboard-home-tabs").tabs({ active: $('.ui-tabs-nav li#tab-sites-'+name).index() }); //Will activate tab
        return false;
     }  
     
     {JqueryScriptsReady}  
           
      // close icon: removing the tab on click
     $("#dashboard-home-tabs").tabs().delegate( "span.ui-icon-close", "click", function() {
        var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
        $( "#" + panelId ).remove();
        $("#dashboard-home-tabs").tabs( "refresh" );
     });
         
     $( "#dashboard-home-tabs" ).on("tabsbeforeload", function( event, ui ) {                          
          // No refresh necessary - refresh  dashboard only
          if ($("#sites-panel-dynamic-"+ui.tab.attr('name').replace(/\./g,"-")).html().length > 0)
          {                  
             return $.ajax2({ data: { Site : ui.tab.attr('name') }, 
                               url: ui.tab.find("a.tabs-sites").attr('href'),
                               loading: "#tab-site-"+ui.tab.attr('name').replace(/\./g,"-")+"-loading"
                             });                
          }   
          return $.ajax2({ data: { Site : ui.tab.attr('name') }, 
                    url: ui.tab.find("a.tabs-sites").attr('href'), 
                    loading: "#tab-dashboard-site-loading",                                                         
                    target: "#sites-panel-dynamic-"+ ui.tab.attr('name').replace(/\./g,"-")
                  });                
     } );         
        
     {/JqueryScriptsReady}  
</script>  
