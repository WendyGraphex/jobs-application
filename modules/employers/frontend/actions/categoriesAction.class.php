<?php

// www.project55.net/employer/categories

class employers_categoriesAction extends mfAction {
    
    function execute(mfWebRequest $request) {   
          $this->node=new EmployerWorkCategory('root');       
    }
}
