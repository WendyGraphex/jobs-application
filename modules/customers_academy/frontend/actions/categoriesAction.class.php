<?php

// www.project55.net/academy/categories

class customers_academy_categoriesAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
        $this->node=new CustomerCourseCategory('root');                                                    
    }
}
