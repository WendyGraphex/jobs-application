<div class="table-responsive pt-3">
                            <table class="table table-bordered table-striped">
                                <thead class="">
                                    <tr role="row">
                                        <th> #</th> 
                                        <th>{__('Job')}</th>                
                                        <th>{__('Project')}</th>                                         
                                         <th>{__('Quotation')}</th>   
                                        <th>{__('Start at/Work')}</th>                          
                                        <th>{__('Quoted At')}</th>                                                                                             
                                        <th>{__('Price')}</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $pager as $item}
                                    <tr>
                                        <td>{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>    
                                        <td>
                                            
                                            <div><a href="{$item->getQuotation()->getEmployeeAdvertI18n()->getUrl()}" target="_blank">{$item->getQuotation()->getEmployerAdvertI18n()->get('reference')}</a></div>
                                            <div>{$item->getQuotation()->getEmployeeAdvertI18n()->getFormatter()->getTitle()->ucfirst()}</div>
                                        </td>    
                                        <td>{if $item->getQuotation()->hasProject()}
                                            <div>{__('Ref.')}:{$item->getQuotation()->getProject()->get('reference')}</div>
                                            <div>{$item->getQuotation()->getProject()->getFormatter()->getName()->ucfirst()}</div>
                                            {else}
                                              {__('---')}                                            
                                            {/if}
                                        </td>
                                        <td>{$item->getQuotation()->get('reference')}
                                        </td>
                                        <td>
                                            {if !$item->getQuotation()->hasInAt() && !$item->getQuotation()->hasOutAt()}       
                                                {__('---')}
                                            {/if}
                                            {if $item->getQuotation()->hasInAt()}                                           
                                                {$item->getQuotation()->getFormatter()->getInAt()->getText()}
                                                {if $item->getQuotation()->hasOutAt()} / {/if}
                                            {/if}
                                            {if $item->getQuotation()->hasOutAt()}                                           
                                             {$item->getQuotation()->getFormatter()->getOuAt()->getText()}
                                            {/if}
                                        </td>                                                                            
                                        <td>{$item->getQuotation()->getFormatter()->getCreatedAt()->getText()}</td>
                                        <td>{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</td>
                                    </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
