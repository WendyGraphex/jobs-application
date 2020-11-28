 <div class="td_block_wrap td_block_9 td_block_widget td-pb-border-top">
                                                <div class="td-block-title-wrap">
                                                    <h4 class="block-title"><span>{__('Most Popular')}</span></h4>
                                                </div>                                              
                                                 {foreach $pager as $item_i18n}
                                {component name="/customers_blog/articleDisplay" item_i18n=$item_i18n tpl="popular"}            
                            {/foreach}  
                                            </div> 

                                            
                                            