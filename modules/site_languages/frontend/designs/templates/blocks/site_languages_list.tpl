{if count($languages) == 1}
    <ul class="nav-item cta mr-md-2 OneLanguage">
        <li>
            <a class="lang active mr-1" href="#">   
                <img class="language_active" title="{format_language($languages->getFirst()->get('code'))|capitalize}" src='{url("/flags/96x96/`$languages->getFirst()->getCode()->upper()`.png","picture")}' alt="{$languages->getFirst()->getFormatter()->getFormatted()->ucfirst()}"/> 
            </a>
        </li>
   </ul>
{elseif count($languages) >1 && count($languages) < 2 }
    <ul class="nav-item cta mr-md-2">
        {foreach $languages as $language}
          <li>
             {if $language->get('code')==$language_active}
                  <a class="lang active mr-1" href="#">   
                   <img class="language_active" title="{format_language($language->get('code'))|capitalize}" src='{url("/flags/96x96/`$language->getCode()->upper()`.png","picture")}' alt="{$language->getFormatter()->getFormatted()->ucfirst()}"/> 
                 </a>
             {else}     
                  <a class="lang mr-1" href="{url_i18n_to($referer,[],$language->get('code'))}">
                     <img class="language_active" title="{$language->getFormatter()->getFormatted()->ucfirst()}" src='{url("/flags/96x96/`$language->getCode()->upper()`.png","picture")}' alt="{$language->getFormatter()->getFormatted()->ucfirst()}"/> 
                  </a> 
             {/if}
          </li>
        {/foreach}
   </ul>
{elseif  count($languages) >= 2 }  
    <ul class="list-unstyled languages list-languages mr-2" style="width: 68px;">
                  <li class="li-lang" id="li-lang-active">
                        <a class="currency active" href="#">   
                          <img class="language_active" title="{$language_active|capitalize}" src='{url("/flags/96x96/`$language_active|upper`.png","picture")}' alt="{__($language_active)}"/> 
                        </a>
                  </li>
             {foreach $languages as $language}
                    {if $language->get('code')==$language_active}
                        <li class="selected li-lang list-lang">   
                            <a class="lang active mr-1" href="#">   
                                <img class="language_active" title="{$language->getFormatter()->getFormatted()->ucfirst()}" src='{url("/flags/96x96/`$language->getCode()->upper()`.png","picture")}' alt="{$language->getFormatter()->getFormatted()->ucfirst()}"/> 
                            </a>
                        </li>  
                   {else} 
                       <li class="li-lang list-lang"> 
                            <a class="lang mr-1" href="{url_i18n_to($referer,[],$language->get('code'))}">
                               <img class="" title="{$language->getFormatter()->getFormatted()->ucfirst()}" src='{url("/flags/96x96/`$language->getCode()->upper()`.png","picture")}' alt="{$language->getFormatter()->getFormatted()->ucfirst()}"/> 
                            </a>
                       </li> 
                   {/if}
             {/foreach}      
         </ul>
{/if}


<script type="text/javascript">
    $(document).ready(function()
     {
            $(".li-lang").mouseout(function(){ $(".list-lang").hide(); });
            $(".li-lang").mouseover(function(){ $(".list-lang").show(); });   
            $(".lang").click(function () { 
                 $(".list-lang").removeClass('selected'); $(this).parent('li').addClass('selected');
                 $("#li-lang-active").html($(this).parent('.list-lang').html());
             });
   }); 
</script>
