<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Products")}</h3>
        <h3 class="admin-header-small-text">{__("Products Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Products')}        
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View product')}
    </p>
</div>
{alerts}
{if $item_i18n->getProduct()->isLoaded()}      
<div class="tablewhiteback" style="padding: 20px;">    
      <div class="row">
          <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
          </div>          
      </div>
      <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
           <a class="nav-link active" id="referencement-tab" data-toggle="tab" href="#referencement" role="tab" aria-controls="referencement" aria-selected="true">{__('Referencement')} </a>
         </li>
         <li class="nav-item">
           <a class="nav-link " id="control-tab" data-toggle="tab" href="#control" role="tab" aria-controls="control" aria-selected="false">{__('Control')}</a>
         </li>
          <li class="nav-item">
           <a class="nav-link " id="location-tab" data-toggle="tab" href="#location" role="tab" aria-controls="location" aria-selected="false">{__('Location')}</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" id="prices-tab" data-toggle="tab" href="#prices" role="tab" aria-controls="prices" aria-selected="false">{__('Prices')}</a>
         </li>
            <li class="nav-item">
           <a class="nav-link" id="categories-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="false">{__('Categories')} </a>
         </li>
          <li class="nav-item">
           <a class="nav-link" id="picture-tab" data-toggle="tab" href="#picture" role="tab" aria-controls="picture" aria-selected="false">{__('Picture')} </a>
         </li>
         <li class="nav-item">
           <a class="nav-link" id="pictures-tab" data-toggle="tab" href="#pictures" role="tab" aria-controls="pictures" aria-selected="false">{__('Pictures')} </a>
         </li>
          <li class="nav-item">
           <a class="nav-link" id="features-tab" data-toggle="tab" href="#features" role="tab" aria-controls="features" aria-selected="false">{__('Features')} </a>
         </li>
          <li class="nav-item">
           <a class="nav-link" id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="false">{__('Content')} </a>
         </li>
      </ul>
         
      <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade  show active" id="referencement" role="tabpanel" aria-labelledby="referencement-tab">
                <div class="row mt-3">
                    <div class="form col-md-6">                                   
                         <div class="form-group">
                            <label>{__("Url")}{if $form->product_i18n.url->getOption('required')}*{/if}</label>
                            <div>{$form.product_i18n.url->getError()}</div>
                            <input type="text" class="ProductI18n Input form-control" name="url" value="{$item_i18n->get('url')}">
                         </div>                    
                    </div>
                    <div class="form col-md-6">                                   
                         <div class="form-group">
                            <label>{__("Title")}{if $form->product_i18n.title->getOption('required')}*{/if}</label>
                            <div>{$form.product_i18n.title->getError()}</div>
                            <input type="text" class="ProductI18n Input form-control" name="title" value="{$item_i18n->get('title')}">
                         </div>                    
                    </div>
                    <div class="form col-md-6">                                   
                         <div class="form-group">
                            <label>{__("Meta title")}{if $form->product_i18n.meta_title->getOption('required')}*{/if}</label>
                            <div>{$form.product_i18n.meta_title->getError()}</div>
                            <input type="text" class="ProductI18n Input form-control" name="meta_title" value="{$item_i18n->get('meta_title')}">
                         </div>                    
                    </div>
                           <div class="form col-md-6">                                   
                         <div class="form-group">
                            <label>{__("Meta keywords")}{if $form->product_i18n.meta_keywords->getOption('required')}*{/if}</label>
                            <div>{$form.product_i18n.meta_keywords->getError()}</div>
                            <input type="text" class="ProductI18n Input form-control" name="meta_keywords" value="{$item_i18n->get('meta_keywords')}">
                         </div>                    
                    </div>
                     <div class="form col-md-12">                                     
                          <div class="form-group">   
                               <label>{__("Meta description")}{if $form->product_i18n.meta_description->getOption('required')}*{/if}</label>
                                     <div>{$form.product_i18n.meta_description->getError()}</div> 
                                     <textarea cols="80" rows="4" class="ProductI18n Input form-control" name="meta_description">{$item_i18n->get('meta_description')}</textarea>
                                 </div>
                     </div>
                      <div class="form col-md-12">                                     
                          <div class="form-group"> 
                               <label>{__("Description")}{if $form->product_i18n.description->getOption('required')}*{/if}</label>
                                     <div>{$form.product_i18n.description->getError()}</div> 
                                     <textarea cols="80" rows="4" class="ProductI18n Input form-control" name="description">{$item_i18n->get('description')}</textarea>
                                 </div>
                     </div>
                </div>                
          </div>
          <div class="tab-pane fade" id="control" role="tabpanel" aria-labelledby="control-tab">
                <div class="row mt-3">
                    <div class="form col-md-3">                                   
                         <div class="form-group">
                            <label>{__("Reference")}{if $form->product.reference->getOption('required')}*{/if}</label>
                            <div>{$form.product.reference->getError()}</div>
                            <input type="text" class="Product Input form-control" name="reference" value="{$item_i18n->getProduct()->get('reference')}">
                         </div>                    
                    </div>
                       <div class="form col-md-3">                                   
                         <div class="form-group">
                            <label>{__("Started at")}{if $form->product.started_at->getOption('required')}*{/if}</label>
                            <div>{$form.product.started_at->getError()}</div>
                            <input type="text" class="Product Input form-control Date" id="started_at" name="started_at" value="{if $item_i18n->getProduct()->hasStartedAt()}{$item_i18n->getProduct()->getFormatter()->getStartedAt()->getText()}{/if}">
                         </div>                    
                    </div>
                    <div class="form col-md-3">                                   
                         <div class="form-group">
                            <label>{__("Expired at")}{if $form->product.expired_at->getOption('required')}*{/if}</label>
                            <div>{$form.product.expired_at->getError()}</div>
                            <input type="text" class="Product Input form-control Date" id="expired_at" name="expired_at" value="{if $item_i18n->getProduct()->hasExpiredAt()}{$item_i18n->getProduct()->getFormatter()->getExpiredAt()->getText()}{/if}">
                         </div>                    
                    </div>
                   <div class="form col-md-3"> 
                            <label>{__("City")}{if $form->product.city_id->getOption('required')}*{/if}</label>
                            <div>{$form.product.city_id->getError()}</div>
                            {html_options class="Product Select form-control input-lg" style="width:200px" name="city_id" id="select-city" options=$form->product.city_id->getChoices()->toArray() selected=$item_i18n->getProduct()->get('city_id')}                               
                    </div>
               </div>    
          </div>
          
        <div class="tab-pane fade" id="location" role="tabpanel" aria-labelledby="location-tab">            
                <div class="row mt-3">
                    <div class="form col-md-9">                                   
                         {*<div class="form-group custom-control custom-checkbox">
                            <span>{__("Address from supplier ?")}</span>                          
                            <input type="checkbox" class="Product Checkbox" id="check" name="is_supplier_address"  {if $item_i18n->getProduct()->isSupplierAddress()}checked=""{/if}> 
                         </div> *}  
                         
                        <div class="col-auto my-1">
                        <div class="custom-control custom-checkbox mr-sm-2">
                          <input type="checkbox" class="custom-control-input" id="customControlAutosizing" name="is_supplier_address" {if $item_i18n->getProduct()->isSupplierAddress()}checked=""{/if}>
                          <label class="custom-control-label" for="customControlAutosizing">{__("Address from supplier ?")}</label>
                        </div>
                      </div>
                    </div>  
                </div>
               <div id="toShow">
                <div class="row mt-3">
                    <div class="form col-md-12">                                   
                         <div class="form-group">
                             <label>{__("Address1")}{if $form->location.address1->getOption('required')}*{/if}</label>
                            <div>{$form.location.address1->getError()}</div>
                            <input type="text" class="ProductLocation Input form-control" name="address1" value="{$item_i18n->getProduct()->getLocation()->get('address1')}">
                         </div>                    
                    </div>
                </div>               
                <div class="row mt-3">
                    <div class="form col-md-9">                                   
                         <div class="form-group">
                            <label>{__("Address2")}{if $form->location.address2->getOption('required')}*{/if}</label>
                            <div>{$form.location.address2->getError()}</div>
                            <input type="text" class="ProductLocation Input form-control" name="address2" value="{$item_i18n->getProduct()->getLocation()->get('address2')}">
                         </div>                    
                    </div>
                    <div class="form col-md-3">                                   
                         <div class="form-group">
                            <label>{__("Coordinates")}{if $form->location.coordinates->getOption('required')}*{/if} {$item_i18n->getProduct()->getLocation()->getFormatter()->getCoordinates()}</label>
                            <div>{$form.location.coordinates->getError()}</div>
                            <input type="text" class="ProductLocation Input form-control" name="coordinates" value="{$item_i18n->getProduct()->getLocation()->get('coordinates')}">
                         </div>                    
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="form col-md-3">                                   
                         <div class="form-group">
                            <label>{__("Postcode")}{if $form->location.postcode->getOption('required')}*{/if}</label>
                            <div>{$form.location.postcode->getError()}</div>
                            <input type="text" class="ProductLocation Input form-control" name="postcode" value="{$item_i18n->getProduct()->getLocation()->get('postcode')}">
                         </div>                    
                    </div>
                    <div class="form col-md-6">                                   
                         <div class="form-group">
                            <label>{__("City")}{if $form->location.city->getOption('required')}*{/if}</label>
                            <div>{$form.location.city->getError()}</div>
                            <input type="text" class="ProductLocation Input form-control" name="city" value="{$item_i18n->getProduct()->getLocation()->get('city')}">
                         </div>                    
                    </div>
                    <div class="form col-md-3">                                   
                         <div class="form-group">
                            <label>{__("Country")}{if $form->location.country->getOption('required')}*{/if}</label>
                            <div>{$form.location.country->getError()}</div>
                             {select_country name="country" class="ProductLocation form-control Fields Select" options=$form->location.country->getOption('choices') selected=$item_i18n->getProduct()->getLocation()->get('country')}
                         </div>                    
                    </div>
                </div>
               </div>
        </div>
                    
          <div class="tab-pane fade" id="prices" role="tabpanel" aria-labelledby="prices-tab">
            <div class="form-group row mt-3">
                  <div class="form col-md-4">     
                      
                        <label>{__("Quantity")}{if $form->product.quantity->getOption('required')}*{/if}</label>
                        <div>{$form.product.quantity->getError()}</div>
                        <input type="text" class="Product Input form-control" name="quantity" value="{$item_i18n->getProduct()->get('quantity')}"/>
                                                     
                  </div> 
              
                   <div class="form col-md-2">                          
                        <label>{__("Unit")}{if $form->product.price_unit_id->getOption('required')}*{/if}</label>
                        <div>{$form.product.price_unit_id->getError()}</div>
                        {html_options class="Product Select form-control" name="price_unit_id" options=$form->product.price_unit_id->getChoices()->toArray() selected=$item_i18n->getProduct()->get('price_unit_id')}
                                                     
                  </div>
                  <div class="form col-md-3">     
                     
                        <label>{__("Supplier")}{if $form->product.supplier_id->getOption('required')}*{/if}</label>
                        <div>{$form.product.supplier_id->getError()}</div>
                        {html_options class="Product Select form-control" style="width:200px;height:50px" id="select-supplier" name="supplier_id" options=$form->product.supplier_id->getChoices()->toArray() selected=$item_i18n->getProduct()->get('supplier_id')}
                                                     
                  </div>     
                  <div class="form col-md-3">     
                      
                        <label>{__("Tax")}{if $form->product.tax_id->getOption('required')}*{/if}</label>
                        <div>{$form.product.tax_id->getError()}</div>
                        <select class="Product Select form-control" id="Tax" name="tax_id">
                            {foreach $form->product.tax_id->getChoices() as $key=>$tax}
                                <option value="{$key}" data-rate="{$tax->getRate()->output("%01.2f")}" {if $item_i18n->getProduct()->get('tax_id')==$key}selected=""{/if}>{$tax->getRate()->getPourcentage(0)}</option>      
                            {/foreach}    
                        </select>
                                                   
                  </div>    
            </div>
            <div class="form-group row mt-3">
                            <div class="col-md-4">                                                         
                                <label>{__("Sale Price With Tax Min")}{if $form->product.sale_price_with_tax_min->getOption('required')}*{/if}</label>
                                <div>{$form.product.sale_price_with_tax_min->getError()}</div> 
                                <input type="text"  class="TTC Product Input form-control " data-name="sale_price_min" name="sale_price_with_tax_min" value="{$item_i18n->getProduct()->get('sale_price_with_tax_min')}"/>
                            </div>
                            <div class="col-md-4">
                                <label>{__("Sale Price With Tax")}{if $form->product.sale_price_with_tax->getOption('required')}*{/if}</label>
                                <div>{$form.product.sale_price_with_tax->getError()}</div> 
                                <input type="text"  class="TTC Product Input form-control " data-name="sale_price_std" name="sale_price_with_tax" value="{$item_i18n->getProduct()->get('sale_price_with_tax')}"/>
                            </div>
                            <div class="col-md-4">
                                <label>{__("Sale Price With Tax Max")}{if $form->product.sale_price_with_tax_max->getOption('required')}*{/if}</label>
                                <div>{$form.product.sale_price_with_tax_max->getError()}</div> 
                                <input type="text"  class="TTC Product Input form-control " data-name="sale_price_max" name="sale_price_with_tax_max" value="{$item_i18n->getProduct()->get('sale_price_with_tax_max')}"/>
                            </div>
                            
                </div>
             
            
                <div class="form-group row mt-3">                                     
                            <div class="col-md-4">
                                <label>{__("Sale Price Without Tax Min")}{if $form->product.sale_price_without_tax_min->getOption('required')}*{/if}</label>
                                <div>{$form.product.sale_price_without_tax_min->getError()}</div>
                                <input type="text" class="HT Product Input form-control " data-name="sale_price_min" name="sale_price_without_tax_min" value="{$item_i18n->getProduct()->get('sale_price_without_tax_min')}"/>
                            </div>

                            <div class="col-md-4">
                                <label>{__("Sale Price Without Tax")}{if $form->product.sale_price_without_tax->getOption('required')}*{/if}</label>
                                <div>{$form.product.sale_price_without_tax->getError()}</div>
                                <input typs="sale_price" class="HT Product Input form-control" data-name="sale_price_std" name="sale_price_without_tax" value="{$item_i18n->getProduct()->get('sale_price_without_tax')}"/>
                            </div>
                            <div class="col-md-4">
                                <label>{__("Sale Price Without Tax Max")}{if $form->product.sale_price_without_tax_max->getOption('required')}*{/if}</label>
                                <div>{$form.product.sale_price_without_tax_max->getError()}</div>
                                <input type="text" class="HT Product Input form-control"  data-name="sale_price_max" name="sale_price_without_tax_max" value="{$item_i18n->getProduct()->get('sale_price_without_tax_max')}"/>
                            </div>
                </div>
                            
               
          </div>
        <div class="tab-pane fade" id="categories" role="tabpanel" aria-labelledby="categories-tab">
            <div class="row padd-row">
               <div class="col-md-12" style="padding: 0;">
                   <div style="float: right;"> 
                    <a href="#" id="DialogCategories" class="btn btn-success admin-header-button"><i class="fa fa-plus"></i>{__('Add')}</a>       
                 </div>
               </div>
            </div> 
            <div id="Categories-ctn">
                <table id="ProductCategories" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
                     <thead class="bg-info thead-color">
                        <tr class="list-header">    
                            <th>#</th>                                              
                             <th>{__('Category')}</th>                   
                             <th>{__('Actions')}</th>
                        </tr>
                      </thead>   
                        {foreach $item_i18n->getProductCategories() as $product_category}
                            <tr class="ProductCategories-list" id="{$product_category->get('category_id')}">
                                <td>{$product_category@iteration}
                                </td>                                                                        
                                <td>
                                    {if $product_category->getCategory()->hasI18n()}{$product_category->getCategory()->getI18n()}{else}{__('---')}{/if}     
                                </td>                  
                                 <td>                                   
                                     <a href="#" title="{__('Delete')}" class="ProductCategoryDelete" id="{$product_category->get('category_id')}"  name="{if $product_category->getCategory()->hasI18n()}{$product_category->getCategory()->getI18n()}{else}{__('---')}{/if}">
                                          <i class="fa fa-trash-alt icon-font delete-color"></i>
                                     </a>     
                                </td>
                            </tr>
                        {/foreach}
                </table>
            </div>
            <div id="Modal-Categories" class="modal" role="dialog">
                <div class="modal-dialog modal-lg model-cat-product">    
              <div class="modal-content">
                 <div class="px-2"><span class="close" id="Modal-Categories-Close">&times;</span></div>
                  <div id="Modal-Categories-ctn">            
                  </div>
                   <div class="col-md-12" style="padding: 0;">
                        <div class="Addbtn px-2"> 
                           <a href="#" id="AddCategories" class="btn btn-success admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add categories')}</a>                
                        </div>
                   </div>
              </div>
                </div>
           </div>    
   </div>
   <div class="tab-pane fade tab-pic" id="picture" role="tabpanel" aria-labelledby="picture-tab">  
         <div class="row portfolio-grid">
         <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
              <figure class="effect-text-in ModeDisplay">
                 <div id="DropZonePicture" class="dropzone dp-addFile p-1 ModeDisplay"> 
                     <i class="fa fa-plus plus-icon  plus-icon1"></i> 
                     <div class="div-img  h-100">
                        <img id="Picture-img" {if !$item_i18n->getProduct()->hasPicture()}style="display:none"{/if} class="img-dpzone img-product" {if $item_i18n->getProduct()->hasPicture()}src="{$item_i18n->getProduct()->getPicture()->getMedium()->getUrl()}"{/if} alt="image">
                    </div> 
                 </div>
                <figcaption>                             
                </figcaption>                          
              </figure>
              
          </div> 
          <div class="col-2">  
              <a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>
         </div>
       </div>
   </div>                
   <div class="tab-pane fade tab-pic" id="pictures" role="tabpanel" aria-labelledby="pictures-tab">             
        <div class="row portfolio-grid">
            <div class="Pictures col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
              <figure class="effect-text-in">
                 <div id="DropZone" class="dropzone dp-addFile"> 
                     <i class="fa fa-plus plus-icon"></i>
                 </div>
                <figcaption>                             
                </figcaption>                          
              </figure>
            </div>
            {foreach $item_i18n->getPictures() as $picture}                 
                <div class="Pictures col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12" id="{$picture->get('id')}">
                   <figure  class="effect-text-in">
                       <div class="div-img"><img class="img-dpzone img-product" src="{$picture->getPicture()->getMedium()->getUrl()}" alt="image"></div>
                     <figcaption class="text-left">
                         <div class="pr-1">
                             <h6 class="PicturesCount">{$picture@iteration}</h6>
                         </div>
                         <div class="pic-title text-left">
                            <h6 class="picture-title w-100">                                                      
                              <span class="picture-title" id="{$picture->get('id')}">{if $picture->hasI18n()}{$picture->getI18n()}{else}{__('No title')}{/if}</span>
                              <input class="picture-input ProductPictureI18n Input w-100" value="{if $picture->hasI18n()}{$picture->getI18n()}{/if}" name="title" placeholder="{if $picture->hasI18n()}{$picture->getI18n()}{else}{__('No title')}{/if}" style="display:none" id="{$picture->get('id')}" type="text"/>
                           </h6>
                       </div>
                       <div class="conf-icons">
                           <a href="javascript:void(0);" class="list-action ProductPictureCancel ProductPictureActions" id="{$picture->get('id')}" title="{__('Cancel')}" style="display:none"><i class="fa fa-times icon-font"></i></a>
                           <a href="javascript:void(0);" class="list-action ProductPictureSave ProductPictureActions" id="{$picture->get('id')}" title="{__('Save')}" style="display:none"><i class="fa fa-save icon-font"></i></a>
                           <a href="javascript:void(0);" class="list-action ProductPictureChangeIsActive" name="{$picture->get('is_active')}" id="{$picture->get('id')}"><i class="fa fa-circle text-{if $picture->isActive()}success{else}danger{/if}"></i></a>
                           <a href="javascript:void(0);" class="list-action ProductPictureView" id="{$picture->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil-alt icon-font"></i></a>
                           <a href="javascript:void(0);" class="list-action ProductPictureDelete" id="{$picture->get('id')}" name="{if $picture->hasI18n()}{$picture->getI18n()}{else}{__('No title')}{/if}"  title="{__('Delete')}"><i class="fa fa-trash-alt icon-font delete-color"></i></a>
                       </div>
                     </figcaption>
                   </figure>
                 </div>
            {/foreach}            
        </div>        
   </div>
    <div class="tab-pane fade" id="features" role="tabpanel" aria-labelledby="features-tab">
         <div class="row padd-row">
               <div class="col-md-12" style="padding: 0;">
                   <div style="float: right;">
                     <a href="#" id="DialogFeatures" class="btn btn-success admin-header-button"><i class="fa fa-plus"></i>{__('Add')}</a>   
                   </div>
               </div>
         </div>  
         <div id="Features-ctn">               
            <table id="ProductFeatures" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
               <thead class="bg-info thead-color">
                  <tr class="list-header">    
                      <th>#</th>  
                      <th></th>                       
                      <th>{__('Feature')}</th>
                      <th>{__('Value')}</th>
                      <th>{__('Unit')}</th>
                      <th>{__('Actions')}</th>
                  </tr>
               </thead>  
           {foreach $item_i18n->getProductFeatures() as $product_feature}
               <tr class="ProductFeatureProduct list" id="{$product_feature->get('id')}">
                   <td class="count">{$product_feature@iteration}
                   </td>                 
                   <td><i class="fa fa-arrows-alt"></i></td>                   
                   <td>
                       {if $product_feature->getFeature()->hasI18n()}{$product_feature->getFeature()->getI18n()}{else}{__('---')}{/if}     
                   </td>
                   <td>
                      <input type="text" class="ProductFeatures" id="{$product_feature->getFeature()->get('id')}" name="value" value="{$product_feature->get('value')}"/>
                   </td>
                    <td>
                       {if $product_feature->getFeature()->hasUnit()}{if $product_feature->getFeature()->getUnit()->hasI18n()}{$product_feature->getFeature()->getUnit()->getI18n()}{else}{__('---')}{/if}{else}{__('---')}{/if}     
                   </td>
                    <td>                                       
                        <a href="#" title="{__('Delete')}" class="ProductFeatureDelete" id="{$product_feature->get('id')}"  name="{if $product_feature->getFeature()->hasI18n()}{$product_feature->getFeature()->getI18n()}{else}{__('---')}{/if}">
                        <i style="" class="fa fa-trash-alt icon-font delete-color"></i>
                        </a>     
                   </td>
               </tr>
           {/foreach}
              </table>
        </div>
               <div id="Modal-Features" class="modal" role="dialog">
                <div class="modal-dialog modal-lg model-cat-product">    
              <div class="modal-content">
                 <div class="px-2"><span class="close" id="Modal-Features-Close">&times;</span></div>  
                  <div id="Modal-Features-ctn">            
                  </div>
                  <div class="col-md-12" style="padding: 0;">
                        <div class="Addbtn px-2"> 
                           <a href="#" id="AddFeatures" class="btn btn-success admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add features')}</a>                
                        </div>
                   </div>
              </div>
                </div>
          </div>
        </div>
        <div class="tab-pane fade" id="content" role="tabpanel" aria-labelledby="content-tab">
            <br/>
            <div class="form col-md-12">                                     
               <div class="form-group">                               
                  <div>{$form.product_i18n.content->getError()}</div> 
                  <textarea cols="80" rows="10" class="ProductI18n Input form-control" name="content">{$item_i18n->get('content')}</textarea>
               </div>
            </div>
        </div>                            
      </div>         
</div>
{else}
    <span>{__("This product is invalid.")}</span>
{/if}   
<script type="text/javascript">
          function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
          }
    
        var dates = $( ".Date#started_at, .Date#expired_at" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "started_at" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				 dates.not( this ).datepicker( "option", option, date );
         } } );   

         $('#Cancel').click(function(){ 
             return $.ajax2({   data: { filter: { lang: '{$item_i18n->get('lang')}', token: "{mfForm::getToken('ProductFormFilter')}" } },                              
                                url: "{url_to('products_ajax',['action'=>'ListPartialProduct'])}",                    
                                target: "#actions" });
         });
         
             
         $(".Product").click(function() { $("#Save").show(); });
            
         $('#Save').click(function(){                                   
          var  params= {            
                                ProductI18n: {   
                                   product_i18n: { product_id: '{$item_i18n->get('product_id')}' , lang: '{$item_i18n->get('lang')}' },
                                   product : { },
                                   categories : [ ],
                                   features : [ ],
                                   location : { },
                                   token :'{$form->getCSRFToken()}'
                                } };        
          $(".Product.Input").each(function() { params.ProductI18n.product[this.name]=$(this).val();  }); 
          $(".Product.Checkbox:checked").each(function() { params.ProductI18n.product[this.name]=true;  }); 
          $(".Product.Select option:selected").each(function() { params.ProductI18n.product[$(this).parent().attr('name')]=$(this).val();  }); 
          $(".ProductLocation.Input").each(function() { params.ProductI18n.location[this.name]=$(this).val();  }); 
          $(".ProductLocation.Select option:selected").each(function() { params.ProductI18n.location[$(this).parent().attr('name')]=$(this).val();  }); 
          $(".ProductI18n.Input").each(function() { params.ProductI18n.product_i18n[this.name]=$(this).val();  }); 
          $(".ProductCategories-list").each(function() { params.ProductI18n.categories.push($(this).attr('id'));  }); 
          $(".ProductFeatures").each(function () { params.ProductI18n.features.push({ id: $(this).attr('id'), value: $(this).val() }); });
            return $.ajax2({ data : params,                            
                           url: "{url_to('products_ajax',['action'=>'SaveProductI18n'])}",
                           target: "#actions" }); 
                          
         });
             
        $(".ProductFeatureDelete").click(function () { 
          if (!confirm('{__("Feature [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;            
          $(".ProductFeatureProduct[id="+$(this).attr('id')+"]").remove();  
        });
         
        $(".ProductCategoryDelete").click(function () { 
          if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
          $(".ProductCategories-list[id="+$(this).attr('id')+"]").remove();           
        });
                      
       
       $("#DialogCategories").click(function () { 
        var params = { ProductCategory : { lang : '{$item_i18n->get('lang')}', 
                                            selection : [ ], 
                                            token : '{mfForm::getToken('ProductCategoryForm')}' } };      
        $(".ProductCategories-list").each(function() { params.ProductCategory.selection.push($(this).attr('id'));  }); 
        return $.ajax2({      
                         data : params,
                         url:"{url_to('products_ajax',['action'=>'ListPartialDialogCategoryForProduct'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
          
     $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });
   
     //Add Features
     $("#DialogFeatures").click(function () { 
         var params = { filter: { lang: '{$item_i18n->get('lang')}', 
                                            selection : [ ], 
                                            token : "{mfForm::getToken('DialogProductFeatureFormFilter')}" } };
         $(".ProductFeatures").each(function () { params.filter.selection.push($(this).attr('id')); });
             return $.ajax2({  
                         data : params,
                         url:"{url_to('products_ajax',['action'=>'ListPartialDialogFeatureForProduct'])}",                                              
                         success : function () { $("#Modal-Features").show(); },
                         target: "#Modal-Features-ctn"
                       });     
     }); 
     
     $("#Modal-Features-Close").click(function () {  $("#Modal-Features").hide(); });
          
     $("#AddFeatures").click(function () { 
          var values = [];
          $(".ProductFeatures").each(function () { values.push({ id: $(this).attr('id'),value: $(this).val() }); });              
          var params = { AddFeaturesForProduct : {  lang : '{$item_i18n->get('lang')}',selection: $("#DialogFeatureList").data('selection'),token : '{mfForm::getToken('AddFeaturesForViewProductForm')}' } };          
          return $.ajax2({  
                         data : params,
                         url:"{url_to('products_ajax',['action'=>'AddFeaturesForViewProduct'])}",                                              
                         success : function () { 
                                $.each(values, function (id,obj) {                                           
                                            if ($(".ProductFeatures[id="+obj.id+"]").length)
                                                $(".ProductFeatures[id="+obj.id+"]").val(obj.value);                                                
                                        });
                                $("#Modal-Features").hide(); },
                         target: "#Features-ctn"
                       }); 
     }); 
   
     
       $("#AddCategories").click(function () {           
           var params = { AddCategoriesForProduct : {  lang : '{$item_i18n->get('lang')}' ,selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('AddCategoriesForViewProductForm')}' } };                    
           return $.ajax2({  
                         data : params,
                         url:"{url_to('products_ajax',['action'=>'AddCategoriesForViewProduct'])}",                                              
                          success : function () {   $("#Modal-Categories").hide(); },
                          target: "#Categories-ctn"
                       }); 
     }); 
     
          
     $(".ProductI18n.Input[name=title]").keyup(function () { 
            var str = $(this).val().split(''),x = 0;
            
            for (var i = 0; i < str.length; i++) {
              if ((x = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž'.indexOf(str[i])) != -1) {
                  str[i] = "AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz"[x];
               }
            }                 
            $(".ProductI18n.Input[name=url]").val(str.join('').replace(/[^A-Z0-9]+/ig, "-"));
     });
       
       $(".HT").keyup(function () {        
          $(this).val()?$(".TTC[data-name="+$(this).attr('data-name')+"]").val(Number(parseFloat($( this ).val()) *(1 + parseFloat($("#Tax option:selected").attr('data-rate')))).toFixed(2)):$(".TTC[data-name="+$(this).attr('data-name')+"]").val("");
       });      
       
       $(".TTC").keyup(function () {                   
          $(this).val()?$(".HT[data-name="+$(this).attr('data-name')+"]").val(Number(parseFloat($( this ).val()) / (1 + parseFloat($("#Tax option:selected").attr('data-rate')))).toFixed(2)):$(".HT[data-name="+$(this).attr('data-name')+"]").val("");
       });
       
       $("#Tax").change(function () { 
           $(".TTC").each(function () { 
                 $(this).val()?$(".HT[data-name="+$(this).attr('data-name')+"]").val(Number(parseFloat($( this ).val()) / (1 + parseFloat($("#Tax option:selected").attr('data-rate')))).toFixed(2)):$(".HT[data-name="+$(this).attr('data-name')+"]").val("");
            });
       });
       
        $("#ProductFeatures tbody").sortable({
        cursor: 'move',        
        stop: function () {
            $(".count").each(function (id) {  $(this).html(id + 1);  });           
        },      
         helper: function (e, tr) {           
            var helper = tr.clone();
            helper.children().each(function (index) {  $(this).width(tr.children().eq(index).outerWidth(true)); });         
            return helper;
            } 
        });

        if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
          $("#DropZone").dropzone({
            url: "{url_to("products_ajax",['action'=>'UploadPictureProductI18n'])}",
            clickable: false,
            params: { "ProductI18n[product_id]" : '{$item_i18n->get('product_id')}', 
                      "ProductI18n[lang]" : '{$item_i18n->get('lang')}',
                      "UploadPictureProduct[token]" : '{mfForm::getToken('UploadPictureProductForm')}' 
                    },   
            paramName: "UploadPictureProduct[file]",
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPictureProduct[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPictureProduct[number_of_files]',this.files.length);
            },  */                  
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".Pictures:last").after(response); 
            }                  
    }); 
    
    $(".ProductPictureDelete").click(function () { 
          if (!confirm('{__("Picture [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;    
          return $.ajax2({      
                         data : { ProductPicture : $(this).attr('id') },
                         url:"{url_to('products_ajax',['action'=>'DeletePicture'])}",                                              
                         success : function (resp) { 
                             if (resp.action !='DeletePicture') return ;
                             $(".Pictures[id="+resp.id+"]").remove(); 
                             $(".PicturesCount").each( function (id) { $(this).html(id+1); })
                         }                         
                       });            
        });
        
        
        
    $(".ProductPictureChangeIsActive").click(function () {
            return $.ajax2({
                 data: {  ProductPictureChangeIsActive : { id: $(this).attr('id'), value: $(this).attr('name'), token: '{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('products_ajax',['action'=>'ChangeProductPictureIsActive'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeProductPictureIsActive') return ;
                    change('ProductPictureChangeIsActive',resp);
                }
            });
     });
     
    $(".ProductPictureView").click(function () { 
            $(".picture-title[id="+$(this).attr('id')+"]").hide();
            $(".picture-input[id="+$(this).attr('id')+"]").show();
            $(".ProductPictureActions[id="+$(this).attr('id')+"]").show();
            $(this).hide();            
    });
    
     $(".ProductPictureCancel").click(function () { 
            $(".picture-title[id="+$(this).attr('id')+"]").show();
            $(".picture-input[id="+$(this).attr('id')+"]").hide();
            $(".ProductPictureActions[id="+$(this).attr('id')+"]").hide();
            $(".ProductPictureView[id="+$(this).attr('id')+"]").show();                  
    });
    
    $(".ProductPictureSave").click(function () { 
        var params = { ProductPictureI18n : { picture_id: $(this).attr('id'), 
                                              lang :'{$item_i18n->get('lang')}',
                                              token: '{mfForm::getToken('ProductPictureI18nViewForm')}' } };
        $(".ProductPictureI18n.Input[id="+$(this).attr('id')+"]").each(function () { params.ProductPictureI18n[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({
                 data : params,
                url: "{url_to('products_ajax',['action'=>'SaveProductPictureI18n'])}",              
                success: function (resp) {
                      $(".ProductPictureActions[id="+resp.picture_id+"]").hide();
                      $(".ProductPictureView[id="+resp.picture_id+"]").show(); 
                      $(".picture-input[id="+resp.picture_id+"]").attr('placeholder',resp.title).hide();
                      $(".picture-title[id="+resp.picture_id+"]").html(resp.title).show();
                }
            });               
    });
    
    
          if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
                                                 
          $("#DropZonePicture").dropzone({
            url: "{url_to("products_ajax",['action'=>'UploadPictureProduct'])}",
            clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: { "Product[id]" : '{$item_i18n->get('product_id')}',                    
                      "UploadPictureProduct[token]" : '{mfForm::getToken('UploadPictureProductForm')}' 
                    },   
            paramName: "UploadPictureProduct[file]",
            parallelUploads : 1,
         //   maxFiles : 1,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPictureProduct[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPictureProduct[number_of_files]',this.files.length);
            },  */                  
            success : function (file,resp)
            {              
                // console.log("Status="+response.status);
                // if (response.errors || response.status)                 
                ///     return ;                                               
                 $("#DropZonePicture").find('.dz-preview').remove();
                 //$("#DropZonePicture").find('.dz-default').show();
                 $("#Picture-img").attr('src',resp.url).show(); 
            }                  
    }); 
    
    $(".Mode").click(function () {
               if ($(this).attr('name')=='NORMAL')
               {
                   $(this).attr('name','INVERSE');
                   $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                   $(".ModeDisplay").css('background-color','#000');
                   
                   
               }
               else
               {
                    $(this).attr('name','NORMAL');
                   $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                   $(".ModeDisplay").css('background-color','');
                 // $(".dz-message").css('color','#ffff');
               }
          });
          
          $('#select-city').select2();
          $('#select-supplier').select2();
 
          $('input[name=is_supplier_address]').change(function() {
               
                    $('#toShow').toggle(this.checked);
                 
          });
     
          if($('input[name=is_supplier_address]').checked)
          {
             $('#toShow').show();
          }  
          
</script>

