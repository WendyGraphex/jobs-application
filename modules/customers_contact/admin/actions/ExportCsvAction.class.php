<?php

require_once dirname(__FILE__)."/../locales/FormFilters/CustomerContactFormFilter.class.php";
require_once dirname(__FILE__)."/../locales/Exports/CustomerContactExportCsvFilter.class.php";
 
class customers_contact_ExportCsvAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {            
       
        $filter= new CustomerContactFormFilter($this->getUser(),$request->getGetParameter('filter'));             
       // echo "<pre>"; var_dump($request->getGetParameter('filter')); echo "</pre>"; 
        $filter->bind($request->getGetParameter('filter'));
        if ($filter->isValid() || $request->getGetParameter('filter')==null)
        {                                                
           $csv=new CustomerContactExportCsvFilter($filter,$this->getUser());
           $csv->build();                       
           ob_start();
           ob_end_clean();
           $response=$this->getResponse();
           $response->setHeaderFile($csv->getFilename(),true);
           $response->sendHttpHeaders();
           readfile($csv->getFilename());                                                  
           die();
        }   
        if (!$filter->isValid()) { echo "<!--"; var_dump($filter->getErrorSchema()->getErrorsMessage()); echo "-->"; }
        die("Error filter");
   }

}

