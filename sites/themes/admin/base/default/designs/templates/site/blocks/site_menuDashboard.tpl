<div class="menu-site-dashboard">  
    {messages class="site-dashboard-errors"} 
    {if $menu}
        <div id="help">&nbsp;</div>
        {foreach $menu as $item_0}
             {if $user->hasCredential($item_0->get('credentials'))}
              <ul class="menu-site-dashboard-level0 menu-site-dashboard-level0 ">                  
                  {if $item_0.type==null OR $item_0.type==$site->getType()}
                          <li>
                            <h3>{__($item_0.title)|capitalize}</h3>                          
                            <ul class="menu-site-dashboard-level1 menu-site-dashboard-level1 menu-admin"> 
                             {foreach $item_0->getChildren() as $item}                             
                                {if $user->hasCredential($item->get('credentials'))}
                                      {if $item.type==null OR $item.type==$site->getType()}
                                      <li>                                    
                                          <div class="menu-site-dashboard-item">
                                               <a href="#" id="{$item_0@index}_{$item@index}" class="menu-site-dashboard-items" name="{$item->getRouteAjax()}">
                                                 {if $item.picture}<img height="32px" width="32px" style="margin : 0 auto; display : block;" src='{url($item.picture,"web","admin",$site)}' alt='{__($item.title)|capitalize}'/>{/if}                                         
                                                  <div class="menu-site-dashboard-text">{__($item.title)|capitalize}</div>                                             
                                              </a>
                                              <span style="display:none;" id="{$item_0@index}_{$item@index}">{__($item.help)|default:'&nbsp;'}</span>
                                          </div>
                                       </li>
                                    {/if}
                                 {/if}
                              {/foreach}
                            </ul> 
                          </li>
                      </li>
                  {/if}
              </ul>
              {/if}
        {/foreach}    
    {/if}    
</div>  
<script type="text/javascript">
    
    $(".menu-site-dashboard-items").click(function() {         
           return  $.ajax2({ url: $(this).attr('name'),
                             loading: "#tab-site-dashboard-x-settings-loading", 
                             errorTarget: ".site-dashboard-errors",                           
                             target: "#tab-dashboard-x-settings"
                           });                            
    });
        
</script>  