<div class="fc-view-container" style="">
                      <div class="fc-view fc-agendaWeek-view fc-agenda-view" style="">
                          <table class="">
                              <thead class="fc-head">
                                  <tr>
                                      <td class="fc-head-container fc-widget-header">
                                          <div class="fc-row fc-widget-header" style="border-right-width: 1px; margin-right: 16px;">
                                              <table class="">
                                                  <thead>
                                                      <tr>
                                                        {foreach $formFilter->getCalendar()->getDays() as $day}                                               
                                                            <th class="fc-day-header fc-widget-header fc-sun">
                                                                <span>{$day->getName()->getI18n()->getAbbr()} {$day->getFormatted('MM/d')}</span>
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
                                            <div class="fc-day-grid fc-unselectable">
                                                
                                                <div class="fc-row fc-week fc-widget-content" style="border-right-width: 1px; margin-right: 16px;">
                                                  <div class="fc-bg">
                                                      <table class="">
                                                          <tbody>
                                                              <tr>
                                                                  <td class="fc-axis fc-widget-content" style="width: 41px;">
                                                                      <span>all-day</span>
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-sun fc-past" data-date="2016-10-09">
                                                                      
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-mon fc-past" data-date="2016-10-10">
                                                                      
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-tue fc-past" data-date="2016-10-11">
                                                                      
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-wed fc-past" data-date="2016-10-12">
                                                                      
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-thu fc-past" data-date="2016-10-13">
                                                                      
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-fri fc-past" data-date="2016-10-14">
                                                                      
                                                                  </td>
                                                                  <td class="fc-day fc-widget-content fc-sat fc-past" data-date="2016-10-15">
                                                                      
                                                                  </td>
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
                                                                     
                                                                    </td>
                                                                <td></td>
                                                                <td class="fc-event-container" colspan="2">
                                                                    
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        </div>
                                                </div>
                                                
                                            </div>
                                            <hr class="fc-divider fc-widget-header">
                                            {foreach $formFilter->getCalendar()->getDays() as $day}
                                                <div class="fc-scroller fc-time-grid-container" style="overflow: hidden scroll; height: 1076px;">
                                                    <div class="fc-time-grid fc-unselectable">
                                                        <div class="fc-bg">
                                                            <table class="">
                                                                <tbody>
                                                                    <tr>
                                                                         <td class="fc-axis fc-widget-content" style="width: 41px;"></td>  
                                                                        {foreach $formFilter->getCalendar()->getDays() as $_day} 
                                                                        <td class="fc-day fc-widget-content fc-sun fc-past" data-date="{$_day->getDate()}"></td>
                                                                        {/foreach}                                                                              
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="fc-slats">
                                                            <table class="">
                                                                <tbody>
                                                                    {foreach $day->getSchedule() as $time}
                                                                        <tr data-time="{$day->getDate()} {$time->getTimeWithSecond()}">
                                                                            <td class="fc-axis fc-time fc-widget-content" style="width: 41px;"><span>{$time->getHourMinute()}</span></td>
                                                                            <td class="fc-widget-content">
                                                                                
                                                                               <a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable Edit-Dates">
                                                                        <div class="fc-content">
                                                                            <span class="fc-title">Conference</span>
                                                                        </div>
                                                                        <div class="fc-resizer fc-end-resizer"></div>
                                                                    </a> 
                                                                            </td>
                                                                        </tr>
                                                                     {*   <tr data-time="{$day->getDate()} {$time->getTimeWithSecond()}" class="fc-minor">
                                                                            <td class="fc-axis fc-time fc-widget-content" style="width: 41px;"></td>
                                                                            <td class="fc-widget-content"></td>
                                                                        </tr> *}
                                                                    {/foreach}                                                                  
                                                                </tbody>
                                                            </table>
                                                        </div>
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
                                             {/foreach}
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                </div>
            </div>
