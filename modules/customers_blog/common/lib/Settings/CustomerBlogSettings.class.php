<?php

class CustomerBlogSettings extends SiteSettings {
    
     function getDefaults()
    {
        parent::getDefaults();
        
        $this->add(array(   
            
                            'customer_blog_reference_format'=>null,
                            'customer_blog_id_format'=>null,
                            'customer_blog_author'=>'Graphex team'
            ));
        
    }
      
   
    
}
