   <tr class="list" id="{$item->get('id')}" role="row">
                        <td class="count"></td>                                                            
                        <td>
                             {if  $item->getProduct()->hasPicture()}
                           <img   src="{$item->getProduct()->getPicture()->getThumb()->getUrl()}" alt="" />
                           {/if}
                        </td>                  
                        <td>
                           <span>{$item->getProduct()->get('reference')}
                               {$item->getProduct()->get('name')}
                           </span>
                        </td>                                                   
                        <td style="width:300px">
                            <div class="row ">
                            <input   class="form-control Date" name="in_at" style="  height:38px !important; width: 140px"   value="{$event->get('in_at')}">
                            <div class="col-form-label">
                                
                            </div>
                            <input   class="form-control  Date" name="out_at" style="  height:38px !important; width:140px"  value="{$event->get('out_at')}">
                            </div>
                        </td>
                        <td>                            
                            <input class="form-control CartProduct input" name="quantity"  style="  height:38px !important;" placeholder="Quantity" value='{$product->get('quantity')}'> 
                        </td> 
                        <td>
                        </td>                          
                        <td>{*$item->getFormatter()->getSalePriceWithTax()*}
                        </td> 
                        <td>{*$item->getFormatter()->getTotalSalePriceWithTax()*}
                        </td>  
                        <td class="font-i"> 
                             <a href="#" class="list-action text-info  Cancel" id="{$item->get('id')}"><i class="fa fa-window-close"></i></a>                      
                             <a href="#" class="list-action  cart-trash SaveProductItem " id="{$item->get('id')}" name="{*$item->getProduct()->get('reference')} {$item->getProduct()->getI18n()->get('title')}" title="{__('Delete')*}"><i class="fa fa-save"></i></a>                                    
                    
                        </td>
   </tr>