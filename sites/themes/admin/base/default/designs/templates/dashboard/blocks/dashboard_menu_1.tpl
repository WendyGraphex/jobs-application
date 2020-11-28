<div class="collapse navbar-collapse navbar-ex1-collapse">
{messages class="dashboard-errors"}
    <ul class="nav navbar-nav side-nav">  
           <li class="menu-collapse"><i class="fa fa-bars"></i></li> 
        {if $menu}
            {foreach $menu as $item_0}               
                  {if $user->hasCredential($item_0->get('credentials'))}
                      <li class="{if $item_0->hasChildren()}dropdown{/if}">                           
                          <a  href="javascript:;" class="{if $item_0->hasChildren()}dropdown-toggle{else}items{/if}" title="{$item_0.title}" data-url="{$item_0->getRouteAjax()}" {if $item_0->hasChildren()}data-toggle="dropdown"{/if}>
                            {if $item_0->get('picture')}<img height="19px" width="25px" src='{url($item_0->get('picture'),"web")}' alt='{__($item_0->get('title'))}'/>{/if}                                         
                            {if $item_0->get('icon_awe')}<i class="fa {$item_0->get('icon_awe')}" style="margin-right: 10px;width: 12px;display: inline-block;"></i>{/if}
                            <span class="title-menu">{__($item_0.title)}</span>
                          </a>
                          <ul class="dropdown-menu dropdown-menu-left">        
                               {foreach $item_0->getChildren() as $item_1}                             
                                  {if $user->hasCredential($item_1->get('credentials')) && $item_1->get('enabled')}
                                      <li class="{if $item_1->hasChildren()}dropdownL3 dropdown{/if}" >                                                 
                                             <a href="javascript:;" class="{if $item_1->hasChildren()}dropdown-toggle{else}items{/if}" {if $item_1->get('route_ajax')}data-url="{$item_1->getRouteAjax()}"{/if} data-toggle="collapse" {if $item_1.target}target="{$item_1.target}"{/if}>
                                             {if $item_1.picture}<img style="margin : 0 auto; display : block;" height="32px" width="32px" src='{url($item_1.picture,"web")}' alt='{__($item_1.title)|capitalize}'/>{/if}                                         
                                               {if $item_1->get('icon_awe')}<i class="fa {$item_1->get('icon_awe')}" style="margin-right: 10px;width: 12px;display: inline-block;"></i>{/if}
                                                 <span class="dashboard_menu_item_text">{__($item_1.title)}</span>
                                             </a>                                      
                                             <span style="display:none;" id="{$item_0@index}_{$item_1@index}">{__($item_1.help)|default:'&nbsp;'}</span>                                            
                                  <ul class="dropdown-menu dropdown-menu3 dropdown-menu-left">                                           
                                 {foreach $item_1->getChildren() as $item_2}                                      
                                  {if $user->hasCredential($item_2->get('credentials')) && $item_2->get('enabled')}
                                     <li>                                                 
                                             <a href="javascript:;" data-url="{$item_2->getRouteAjax()}" {if $item_2.target}target="{$item_2.target}"{/if}  title="{$item_1.title}" class="items" name="{$item_0@index}_{$item_1@index}_{$item_2@index}">
                                             {if $item_2.picture}<img style="margin : 0 auto; display : block;" height="32px" width="32px" src='{url($item_2.picture,"web")}' alt='{__($item_2.title)|capitalize}'/>{/if}                                         
                                              {if $item_2->get('icon_awe')}<i class="fa {$item_2->get('icon_awe')}" style="margin-right: 10px;width: 12px;display: inline-block;"></i>{/if}
                                                 <span class="dashboard_menu_item_text">{__($item_2.title)}</span>
                                             </a>                                      
                                             <span style="display:none;" id="{$item_0@index}_{$item_1@index}_{$item_2@index}">{__($item_2.help)|default:'&nbsp;'}</span>
                                  </li>
                                   {/if}
                                {/foreach}              
                                  </ul>
                                  
                                  </li>
                                   {/if}
                                {/foreach}              
                          </ul>
                   </li>   
                  {/if}    
            {/foreach}
           
        {/if} 
    </ul>
</div>
<script type="text/javascript">
    
    $(".items").click(function() {         
         if (!$(this).attr('data-url'))
             return ;
           return  $.ajax2({ url: $(this).attr('data-url'),                             
                             errorTarget: ".dashboard-errors",                           
                             target: "#middle"
                           });                            
    }); 
      $('.menu-collapse').click(function(){
            $("body").toggleClass("slide-close");
        });
        $('.dropdownL3').click(function(){
            $("ul.dropdown-menu3").css('display','none');
            $(this).find("ul.dropdown-menu3").css('display','block');
        });
        $(document).click(function(event) { 
    if(!$(event.target).closest('.dropdownL3 ul').length) {
        if($('.dropdownL3 ul').is(":visible")) {
            $('.dropdownL3 ul').hide()
        }
    }        
})
           
</script>  