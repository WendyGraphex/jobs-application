         <figure class="effect-text-in">
           {* <div class="div-img"><img class="img-dpzone img-product" src="{$picture->getPicture()->getMedium()->getUrl()}" alt="image"></div> *}
          <figcaption>                                 
            <div  class="conf-icons">                
                  <a href="javascript:void(0);" class="list-action" id="PictureDelete-{$product->get('id')}" title="{__('Delete')}"><i class="fa fa-trash-alt icon-font delete-color"></i></a>
            </div>
          </figcaption>
        </figure>

  
<script type="text/javascript">
          
      $("#PictureDelete-{$product->get('id')}").click(function () { 
          if (!confirm('{__("Picture [#0#] will be deleted. Confirm ?")}'.format("{$product_i18n}"))) return false;    
          return $.ajax2({      
                         data : { Product : '{$product->get('id')}' },
                         url:"{url_to('products_ajax',['action'=>'DeleteProductPicture'])}",                                              
                         success : function () { 
                            $(".XPictures[id={$product->get('id')}]").remove();                             
                         }                         
                       });            
        });
        
     
</script>          