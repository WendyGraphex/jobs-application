<?php

require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

 
class employers_popularAdvertsAction extends mfAction {
    
    
    function execute(mfWebRequest $request) { 
          
        $search = new EmployerSearchFilterParameters();
        $search->setSortby('most_popular');     
           
        $request->addRequestParameter('search', $search);
        $this->forward($this->getModuleName(), 'adverts');
    }
}
