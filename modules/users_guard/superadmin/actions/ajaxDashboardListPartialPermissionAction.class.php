<?php

require_once __DIR__."/../locales/FormFilters/PermissionsSuperAdminFormFilter.class.php";

class users_guard_ajaxDashboardListPartialPermissionAction  extends mfAction {
    
      
     function execute(mfWebRequest $request) {         
        $messages = mfMessages::getInstance();
        $this->formFilter= new PermissionsSuperAdminFormFilter();
        $this->pager=new Pager('Permission');        
        try
        {
                $this->formFilter->bind($request->getPostParameter('filter'));
                if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
                {    
                    $this->pager->setQuery($this->formFilter->getQuery());
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                    $this->pager->setPage($this->request->getGetParameter('page'));
                    $this->pager->execute(); 
                }                 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }               
    }
}
