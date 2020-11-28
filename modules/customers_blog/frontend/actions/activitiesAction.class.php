<?php

// www.project55.net/blog/activities

class customers_blog_activitiesAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
        $this->node=new CustomerBlogActivityMenu(array('name'=>'top'));           
       // $this->node=new CustomerBlogActivityMenu('top');           
    }
}
