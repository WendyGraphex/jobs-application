<?php

require_once __DIR__."/../locales/FormFilters/EmployerProjectDialogFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerProjectDialogPager.class.php";

class employers_project_ajaxListPartialDialogProjectAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->formFilter= new EmployerProjectDialogFormFilter($this->getUser(),$request->getPostParameter('filter'));                  
        $this->pager=new EmployerProjectDialogPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 //  echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
               // $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employer_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
              // echo mfSiteDatabase::getInstance()->getQuery();
               }  
               else
               {
                   var_dump($this->formFilter->getErrorSchema()->getErrorsMessage());
               }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }   
    }
    
   
}


