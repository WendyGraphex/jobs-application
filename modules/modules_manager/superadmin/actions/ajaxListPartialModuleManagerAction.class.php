<?php

require_once __DIR__."/../locales/FormFilters/ModuleManagerFormFilter.class.php";

class modules_manager_ajaxListPartialModuleManagerAction extends mfAction {


        
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
        $this->formFilter= new ModuleManagerFormFilter();
        $this->pager=new Pager('moduleManager');        
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();                      
               }               
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    }
    
}    
