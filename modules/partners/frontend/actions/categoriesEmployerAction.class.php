<?php

// www.project55.net/categories/employer

class partners_categoriesEmployerAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
        $this->node=new EmployerWorkCategory('root');                                                    
    }
}
