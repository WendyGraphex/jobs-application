<div class="table-responsive pt-3">
                            <table class="table table-bordered table-striped">
                                <thead class="">
                                    <tr role="row">
                                        <th> #</th> 
                                        <th>{__('Event')}</th>                
                                        <th>{__('Quantity')}</th>                                                                                                                                                                       
                                        <th>{__('Price')}</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $pager as $item}
                                    <tr>
                                        <td>{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>    
                                        <td>
                                           
                                        </td>    
                                        <td> 
                                        </td>
                                        <td> 
                                        </td>
                                        <td>
                                             
                                        </td>                                                                            
                                        <td>{$item->getQuotation()->getFormatter()->getCreatedAt()->getText()}</td>
                                        <td>{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</td>
                                    </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>

