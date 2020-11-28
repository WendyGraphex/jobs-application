<div class="fc-view-container" style="">
    <div class="fc-view fc-agendaDay-view fc-agenda-view" style="">
        <table class="">
            <thead class="fc-head">
                <tr>
                    <td class="fc-head-container fc-widget-header">
                        <div class="fc-row fc-widget-header" style="border-right-width: 1px; margin-right: 16px;">
                            <table class="">
                                <thead>
                                    <tr>
                                        <th class="fc-axis fc-widget-header" style="width: 41px;"></th>
                                        <th class="fc-day-header fc-widget-header fc-wed fc-past"
                                            data-date="{$formFilter->getDate()}"><span> {$formFilter->getDate()->getName()->getI18n()} </span></th>
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
                        <div class="fc-day-grid fc-unselectable">
                            <div class="fc-row fc-week fc-widget-content"
                                style="border-right-width: 1px; margin-right: 16px;">
                                <div class="fc-bg">
                                    <table class="">
                                        <tbody>
                                            <tr>
                                                <td class="fc-axis fc-widget-content" style="width: 41px;">
                                                    <span>all-day</span></td>
                                                <td class="fc-day fc-widget-content fc-wed fc-past Edit-Dates"
                                                    data-date="{$formFilter->getDate()}"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="fc-content-skeleton">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="fc-axis" style="width: 41px;"></td>
                                                <td class="fc-event-container">
                                                    <a class="fc-day-grid-event fc-h-event fc-event fc-not-start fc-end fc-draggable fc-resizable">
                                                        <div class="fc-content"> <span
                                                                class="fc-title">Conference</span></div>
                                                        <div class="fc-resizer fc-end-resizer"></div>
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <hr class="fc-divider fc-widget-header">
                        <div class="fc-scroller fc-time-grid-container" style="overflow: hidden scroll; height: 839px;">
                            <div class="fc-time-grid fc-unselectable">
                                <div class="fc-bg">
                                    <table class="">
                                        <tbody>
                                            
                                            <tr>
                                                <td class="fc-axis fc-widget-content" style="width: 41px;"></td>
                                                <td class="fc-day fc-widget-content fc-wed fc-past"
                                                    data-date="{$formFilter->getDate()}"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="fc-slats">
                                    <table class="">
                                        <tbody>
                                            
                                            {foreach $formFilter->getCalendar()->getHours() as $hour} 
                                             
                                            
                                            <tr data-time="{$hour->getHourMinute()}">
                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px;">
                                                    <span>{$hour->getHourMinute()}</span>
                                                </td>
                                                <td class="fc-widget-content"></td>
                                            </tr>
                                            {* <tr data-time="{$hour->getHourMinute()}" class="fc-minor">
                                                <td class="xfc-axis xfc-time xfc-widget-content" style="width: 41px;"></td>
                                                <td class="cfc-widget-content"></td>  
                                            </tr> *}
                                            {/foreach}
                                           
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <hr class="fc-divider fc-widget-header" style="display:none">
                                <div class="fc-content-skeleton">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>