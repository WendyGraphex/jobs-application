 <div>{__('Day')} {$calendar->getDate()}</div>   
 <table>        
 {foreach $calendar->getHours() as $time}
    <tr>        
        <td>{$time->getHour()}{__('H')}
        </td>       
    </tr>    
    {/foreach}   
</table>    