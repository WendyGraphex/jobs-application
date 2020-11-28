{if $calendar->isYearMode()}    
    <table>
    {foreach $calendar->getCalendars() as $calendar_1}       
           {if $calendar_1@index % 6 == 0}   
           <tr>
           {/if}
               <td>                            
               {include file="./includes/schedule/_calendar_month.inc" calendar=$calendar_1 mode="year"} 
               </td>
            {if $calendar_1@index % 6 == 5}   
            </tr>
            {/if}                  
    {/foreach}
     </table>  
{elseif $calendar->isDayMode()}   
     {include file="./includes/schedule/_calendar_day.inc"}
{else}    
    {include file="./includes/schedule/_calendar_month.inc"}
{/if} 