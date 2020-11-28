<?php

require_once __DIR__."/../locales/FormFilters/EmployeeWorkPaymentRequestForProjectFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeeWorkPaymentRequestForProjectPager.class.php";


class projects_ajaxListPartialRequestForProjectAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();   
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;       
        $this->formFilter= new EmployeeWorkPaymentRequestForProjectFormFilter();                  
        $this->pager=new EmployeeWorkPaymentRequestForProjectPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {          
                 
                  //  echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
              //  $this->pager->setParameter('lang',$this->getUser()->getLanguage());
             //   $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setParameter('quotation_id',$this->project->getQuotation()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
                  //echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }   
    }
    
    
}
