{if $form->hasCategory()}        
    <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
        <div id="page-ctn" class="container">  
            {component name="/employees/breadcrumb" node=$form->getCategory()}                          
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
            {component name="/employees/subcategories" node=$form->getCategory()}
            <div id="page-wrapper">  
                {component name="/employees/categories" node=$form->getCategory()}
            </diV>
        </div>                
    </section>


{else}
    <section class="ftco-section bg-light sectionMarginTop">
        <div id="page-wrapper" class="container">           
            {component name="/employees/adverts"}
        </div>                
    </section>
{/if}

