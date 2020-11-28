{if $form->hasCategory()}        
     <section class="ftco-section bg-light sectionCategories sectionMarginTop">
    <div id="page-ctn" class="container">  
        {component name="/employers/breadcrumb" node=$form->getCategory()}                          
        {*if $node_i18n->getCategory()->hasPicture()}                 
            <div class="categoriePicture">
               <img src="{$node_i18n->getCategory()->getPicture()->getUrl()}"/>
           </div>    
            {/if}
        {if $node_i18n->hasContent()}     
           <div class="row categorieTextTop">
               <div>{$node_i18n->get('content')}</div>
           </div>
       {/if*}
        {component name="/employers/subcategories" node=$form->getCategory()}
        <div id="page-wrapper">  
        {component name="/employers/categories" node=$form->getCategory()}
        </diV>
    </div>                
</section>


{else}
    <section class="ftco-section bg-light sectionMarginTop">
        <div id="page-wrapper" class="container">   
        {component name="/employers/adverts"}
        </div>                
    </section>
{/if}

 