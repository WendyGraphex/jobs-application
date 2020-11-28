<?php

// www.project55.net/categories/employer

class partners_ajaxListPartialCategoryEmployerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
               $this->node=new EmployeeWorkCategory('root');                                    
    }
}
