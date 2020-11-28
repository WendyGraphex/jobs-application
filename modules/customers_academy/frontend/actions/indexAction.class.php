<?php


class customers_academy_indexAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {                    
           $this->node=new CustomerCourseCategory('root');   

//echo "<pre>"; var_dump($this->node);           
    }

}
