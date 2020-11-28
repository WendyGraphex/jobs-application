<style>
    .submenu li:last-child a{
       border-left: 0px !important;
       top: -28px;
    }
    .submenu li:last-child {
       height: 35px;
    }
</style>
<div class="sidebar-left sidebar-nicescroller position-fixed" id="sidebar" style="overflow-x: hidden; outline: currentcolor none medium;scrollbar-width: none;" tabindex="5000">
{alerts class="dashboard-errors"}
   <ul class="sidebar-menu pl-0">         
        {if $menu}
            {foreach $menu as $name=>$item_0}                     
                  {if $user->hasCredential($item_0->get('credentials'))}
                     <li class="{if $url_selected==$item_0->getRoute()}active selected{/if}">                           
                            <a href="#" class="items items-menu" data-url="{if !$item_0->hasChildren()}{$item_0->getRouteAjax()}{/if}" data-title="{$name}">
                             {if $item_0->get('icon_awe')}<i class="fa {$item_0->get('icon_awe')} icon-sidebar"></i>{/if}{__($item_0->get('title'))}
                             {if $item_0->hasChildren()}
                               <i class="fa fa-angle-right chevron-icon-sidebar"></i>
                             {/if}  
                            </a>      
                            {if $item_0->hasChildren()}
                             <ul class="submenu collapse" id="{$name}">
                             {foreach $item_0->getChildren() as $name_1=>$item_1}    
                                 <li class="">
                                     <a href="#" class="items" data-url="{if !$item_1->hasChildren()}{$item_1->getRouteAjax()}{/if}" data-title="{$name_1}">{__($item_1->get('title'))}</a>
                                 </li>                                  
                             {/foreach}    
                             </ul>
                            {/if}
                     </li>                                          
                  {/if}    
                    
            {/foreach}           
        {/if} 
    </ul>
</div>

<script type="text/javascript">
    
    {JqueryScriptsReady}
    $(".items-menu").click( function(){  $("#"+$(this).attr("data-title")).toggle();  });
        
    $(".items").click(function() {         
         if (!$(this).attr('data-url'))
             return ;
           return  $.ajax2({ url: $(this).attr('data-url'),                             
                           //  errorTarget: ".dashboard-errors",                           
                             target: "#page-wrapper"
                           });                            
    });
        
   // $(".submenu li:last-child a").before("<span style='height: 28px;display: inline-block;position: relative;top: -3px;border-bottom: 1px solid #79818B;border-left: 1px solid #79818B;'></span>");
    $(".submenu li:last-child a").before("<span style='height: 15px;display: inline-block;position: relative;top: -3px;border-bottom: 1px solid #79786E;border-left: 1px solid #79786E;'></span>");  
        
        
        
    {* $('.menu-collapse').click(function(){
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
})  *}
     {/JqueryScriptsReady}      
</script>  
