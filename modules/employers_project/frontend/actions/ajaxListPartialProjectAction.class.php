<?php

require_once __DIR__."/../locales/FormFilters/EmployerProjectFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerProjectPager.class.php";

class employers_project_ajaxListPartialProjectAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->formFilter= new EmployerProjectFormFilter($this->getUser());                  
        $this->pager=new EmployerProjectPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
               // $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
              //  echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      
    }
    
   
}


