<?php

// www.project55.net/categories

class partners_categoriesAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
        $this->node=new EmployerWorkCategory('root');                                                    
    }
}
