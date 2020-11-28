       <div class="fc-view-container" style="">
            <div class="fc-view fc-month-view fc-basic-view" style="">
                <table class="">
                    <thead class="fc-head">
                        <tr>
                            <td class="fc-head-container fc-widget-header">
                                <div class="fc-row fc-widget-header">
                                    <table class="">
                                        <thead>
                                            <tr>
                                                {foreach $formFilter->getCalendar()->getDayNames() as $name}                                               
                                                    <th class="fc-day-header fc-widget-header fc-sun">
                                                        <span>{$name->getI18n()->getText()->ucfirst()}</span>
                                                    </th>
                                                {/foreach}                                             
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </thead>
                    <tbody class="fc-body">
                        <tr>
                            <td class="fc-widget-content">
                                <div class="fc-scroller fc-day-grid-container" style="overflow: hidden; height: 1122px;">
                                    <div class="fc-day-grid fc-unselectable">
                                        {foreach $formFilter->getCalendar()->getDays()->split(7) as $days}                                        
                                        <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 187px;">
                                             <div class="fc-bg">
                                                <table class="">
                                                    <tbody>
                                                        <tr>
                                                        {foreach $days as $day}   
                                                        <td class="fc-day fc-widget-content fc-sun {if !$day->isMonth()}fc-other-month{/if} fc-past {if $day->isToday() || $day->isFuture()}New-Dates{/if} {if $day->isPast()}gris{/if} " data-date="{$day->getDate()}">                                                                
                                                        </td>                                          
                                                        {/foreach}
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>                                                                                                                                        
                                            <div class="fc-content-skeleton">
                                                <table>
                                                    <thead>
                                                        <tr>                                          
                                                        {foreach $days as $day}   
                                                            <td class="fc-day-top fc-sun {if !$day->isMonth()}fc-other-month{/if} fc-past" data-date="{$day->getDate()}">
                                                                <span class="fc-day-number">{$day->getDay()}</span>
                                                            </td> 
                                                        {/foreach}    
                                                        </tr>
                                                    </thead>                                            
                                                    <tbody>
                                                        <tr>
                                                            {foreach $days as $day}   
                                                                <td class="fc-event-container {if $day->isPast()}gris{/if}">
                                                                    {foreach $day->getEvents() as $event}
                                                                         <a href="{$event->getI18n()->getUrl()}" class="fc-day-grid-event fc-h-event fc-event fc-not-start fc-end fc-draggable fc-resizable Edit-Dates" id="">
                                                                        <div class="fc-content"> 
                                                                            <span class="fc-title">{$event->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</span>
                                                                            <div>                                                                          
                                                                           <div> <span class="icon-my_location"></span>{$event->getPlace()->getFormatter()->getCountry()->ucfirst()}</div> 
                                                                           <div>{$event->getPlace()->getFormatter()->getCity()->ucfirst()}</div>
                                                                            </div>
                                                                        </div>
                                                                         
                                                                        <div class="fc-resizer fc-end-resizer"></div>
                                                                    </a>
                                                                    {/foreach}   
                                                                    {* <a class="fc-day-grid-event fc-h-event fc-event fc-not-start fc-end fc-draggable fc-resizable Edit-Dates" id="">
                                                                        <div class="fc-content"> 
                                                                            <span class="fc-title">Long Event</span>
                                                                        </div>
                                                                        <div class="fc-resizer fc-end-resizer"></div>
                                                                    </a> *}                                                                    
                                                                </td>
                                                            {/foreach}
                                                             
                                                        </tr>
                                                        
                                                    </tbody>
                                                </table>                                                    
                                            </div>                                                                                                                                                                                                                
                                          </div>                                        
                                        {/foreach}                                        
                                    </div>
                                </div>                                    
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
