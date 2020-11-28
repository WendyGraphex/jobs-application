<?php

// www.project55.net/categories/employee


class partners_ajaxListPartialCategoryEmployeeAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                               
               
             $this->node=new EmployeeWorkCategory('root');                  
    }
}
