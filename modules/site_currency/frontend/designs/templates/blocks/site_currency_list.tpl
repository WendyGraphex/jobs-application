{if $currencies->count() > 1}
         <ul class="list-unstyled list-currencies text-center">              
             <li  class="li-currency">
                <a class="active" data-currency="{$currency_active->getCode()->getValue()}" id="currency-active" title="{$currency_active->getCode()->getText()->ucfirst()}" href="#">   
                  {$currency_active->getCode()->getSymbol()}
                </a>
             </li>
             {foreach $currencies as $currency}
                 {if $currency->get('code')==$currency_active->get('code')}
                    <li class="selected list-currency li-currency">
                            <a id="{$currency->getCode()->getValue()}" class="currency currencies" title="{$currency->getCode()->getText()->ucfirst()}" href="#">   
                              {$currency->getCode()->getSymbol()}
                            </a>
                    </li>  
                 {else}
                     <li class="list-currency li-currency">
                            <a class="currency currencies" id="{$currency->getCode()->getValue()}" title="{$currency->getCode()->getText()->ucfirst()}" href="#">   
                              {$currency->getCode()->getSymbol()}
                            </a>
                    </li>
                 {/if}   
             {/foreach}      
         </ul>
{elseif $currencies->count() == 1}
    <ul class="list-unstyled currencies list-currencies "> 
         <li>
            <a class="active" title="{$currencies->getFirst()->getCode()->getText()->ucfirst()}" href="#">
                   {$currencies->getFirst()->getCode()->getSymbol()}
            </a>   
         </li>
    </ul>
{/if}    
       
<script type="text/javascript">
    $(document).ready(function()
     {            
    
      $(".li-currency").mouseout(function(){ $(".list-currency").hide(); });
      $(".li-currency").mouseover(function(){ $(".list-currency").show(); });
      $(".currencies").click(function () {  
          $(".list-currency").removeClass('selected'); $(this).parent('li').addClass('selected');
          return $.ajax2({ data : { Currency : $(this).attr('id') },                           
                           url: "{url_to('site_currency_ajax',['action'=>'ChangeCurrency'])}",
                           success : function (resp)
                                {     
                                    $("#currency-active").attr({ "data-currency": resp.code, "title": resp.title }).html(resp.symbol);
                                    $("#currency-active").trigger('change');
                                }
                        }); 
      });
      
   }); 
</script>