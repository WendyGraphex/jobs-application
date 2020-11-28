<?php

require_once __DIR__."/../locales/Forms/EmployeeSearchFilterParameters.class.php";

 
class employees_popularAdvertsAction extends mfAction {
    
    
    function execute(mfWebRequest $request) { 
          
        $search = new EmployeeSearchFilterParameters();
        $search->setSortby('most_popular');     
           
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts');
    }
}
