<?php

//require_once __DIR__."/../locales/FormFilters/EmployeeAdvertFormFilter.class.php";
//require_once __DIR__."/../locales/Pagers/EmployeeAdvertPager.class.php";

class customers_academy_student_ajaxListPartialBillingAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isStudentUser())             
           $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
      /*  $this->user=$this->getUser();
        $this->formFilter= new EmployeeAdvertFormFilter($this->getUser());                  
        $this->pager=new EmployeeAdvertPager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
               // $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();   
              //  echo mfSiteDatabase::getInstance()->getQuery();
               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }      */
    }
    
   
}


