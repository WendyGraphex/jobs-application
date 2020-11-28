 <div>{__('Week')} {$calendar->getDate()->getWeekNumber()}</div>   
<table>    
    <tr> 
        <td>{* hours *}</td>
        {foreach $calendar->getWeekDaysName() as $name}
            <td>{__($name)|capitalize}</td>
        {/foreach}
    </tr>
    <tr>              
        <td>{* hours *}</td>
            {foreach $calendar->getDays() as $day}
                {if $day}            
                <td>
                    <span>{$day->getDay()}</span>
                </td>
                {else}
                    <td style="{if $mode!='year'}width:50px;height:50px;border:1px solid;{/if}"></td>
                {/if}    
                {if $day@index % 7==6}            
                    </tr><tr> 
                {/if}
            {/foreach}       
    </tr> 
    {foreach $calendar->getHours() as $time}
    <tr>        
        <td>{$time->getHour()}{__('H')}
        </td>
        {foreach $calendar->getDays() as $day}
        <td>{$time->getHour()}{__('H')}
        </td>
        {/foreach}
    </tr>    
    {/foreach}    
</table>