 <div class="ModalHistory modal-dialog modal-lg" style="width: 50%;">
    <div class="modal-content">
      <div class="modal-header">         
        <button type="button" class="ModalHistory-close close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
          <div class="">
              {if $quotation->isLoaded()}
                  <h3>{__('History')}</h3>
                <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped">
                        <thead class="">
                            <tr role="row">
                                <th> #</th>                                                                                                       
                                <th style="width: 100px">{__('Message')}</th> 
                                <th>{__('Sent by')}</th> 
                                <th>{__('Price')}</th> 
                                <th>{__('Start at/Work')}</th>                           
                                <th>{__('Quoted At')}</th>                                                        
                                <th>{__('State')}</th>                                                        
                            </tr>
                        </thead>
                        <tbody>
                        {foreach $quotation->getHistory() as $item}
                         <tr class="list" role="row">
                                <td>{$item@iteration}</td>                                                                                          
                                <td>                                                                            
                                    <div>                                      
                                        {$item->getFormatter()->getDescription()->ucfirst()|escape|truncate:80}
                                    </div>     
                                </td>     
                                 <td>    
                                   {if $item->isSenderEmployer()}
                                        <img height="32px" src="{$quotation->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
                                        {$quotation->getEmployerUser()->getFormatter()->getUsername()}
                                     {else}
                                          <img height="32px" src="{$quotation->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
                                          {$quotation->getEmployeeUser()->getFormatter()->getUsername()}
                                     {/if} 
                                 </td>
                                  <td>
                                    {$item->getFormatter()->getPrice()->getAmount()}
                                </td>
                                <td> 
                                      {if $item->hasInAt()} 
                                    <div>{$item->getFormatter()->getInAt()->getFormatted()}</div>
                                     <div>{$item->getFormatter()->getNumberOfDays()->getFormattedNumberOfDays()}</div>
                                   {else}
                                      {if !$item->isAccepted()}
                                          {if $item->isScheduleNeeded()}
                                          {__('Schedule requested to %s',$quotation->getEmployeeUser()->getFormatter()->getUsername())}                                        
                                            {/if}
                                      {/if}
                                   {/if}  
                                </td>                                                                
                                  <td>
                                  {$item->getFormatter()->getCreatedAt()->getText()}
                                </td>                              
                                <td> 
                                    
                                     {if $item->isAccepted()}
                                        <strong>{__('Accepted')}</strong>                                        
                                    {elseif $item->isRefused()}
                                        <div><strong>{__('Refused')}</strong></div>
                                        {if $item->isEmployeeRefused()}
                                             <div>{__('Refused by %s',(string)$quotation->getEmployeeUser()->getFormatter()->getUsername())}</div>  
                                        {/if}
                                    {/if}  
                                    
                                    
                                    {if !$item->isAccepted() && !$item->isRefused()}
                                        <div>
                                            {if $item->isEmployeeRefused()}
                                                 <div>{__('Refused by %s',(string)$quotation->getEmployeeUser()->getFormatter()->getUsername())}</div>                     
                                            {elseif $item->isEmployeeAccepted() && !$item->isEmployerAccepted()}
                                                <div>{__('Accepted by %s',(string)$quotation->getEmployeeUser()->getFormatter()->getUsername())}</div>                                                                                                                      
                                            {elseif $item->isEmployeeProposed()}
                                                <div>{__('Quote proposed by %s',(string)$quotation->getEmployeeUser()->getFormatter()->getUsername())}</div>
                                            {elseif $item->isEmployeeNegociated()}
                                                <div>{__('Negociation required by %s',(string)$quotation->getEmployerUser()->getFormatter()->getUsername())}</div>
                                            {else}    
                                                <div>{__('Waiting answer from %s',(string)$quotation->getEmployeeUser()->getFormatter()->getUsername())}</div>
                                            {/if}                                                                                                                

                                            {if $item->isEmployerAccepted()}                                                                                                                                                             
                                                 <div>{__('Quote accepted')}</div>   
                                            {elseif $item->isEmployerRefused()}
                                                 <div>{__('Quote refused')}</div> 
                                            {elseif $item->isEmployerNegociated()}  
                                                <div>{__('Negociation requested')}</div> 
                                        </div>
                                        {else}                                       
                                           
                                        {/if}
                                                {/if}
                                             </td>
                                     </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    {else}
                        {__('Quotation is invalid.')}
                    {/if}    
                  </div>
          
    </div>
  </div>
</div>
