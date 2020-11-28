<?php

require_once __DIR__."/../locales/FormFilters/PermissionsFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/PermissionsPager.class.php";

class users_guard_ajaxListPartialPermissionAction   extends mfAction {
    
      
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();                        
        try
        {
                $this->user=$this->getUser();
                $this->formFilter= new PermissionsFormFilter($request->getRequestParameter('lang',$request->getPostParameter('lang',$this->getUser()->getCountry())),$this->user);                  
                $this->pager=new PermissionsPager();
                $this->formFilter->bind($request->getPostParameter('filter'));
                if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
                {   
                    $this->pager->setQuery($this->formFilter->getQuery());
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                    $this->pager->setParameter('lang',(string)$this->formFilter['lang']);       
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
