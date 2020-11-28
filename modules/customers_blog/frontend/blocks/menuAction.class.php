<?php

class customers_blog_menuActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->node=new CustomerBlogActivityMenu($this->getParameter('node','root'));                 
        $this->tpl=$this->getParameter('tpl','default');
        
      //  echo "<pre>"; var_dump($this->node->getChildren());
    } 
    
    
}