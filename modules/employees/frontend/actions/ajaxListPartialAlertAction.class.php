<?php

require_once __DIR__."/../locales/FormFilters/EmployeeFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployeePager.class.php";

class employees_ajaxListPartialAlertAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->formFilter= new EmployeeFormFilter();                  
        $this->pager=new EmployeePager();
        try
        {
//               $this->formFilter->bind($request->getPostParameter('filter'));
//               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
//               {    
//                $this->pager->setQuery($this->formFilter->getQuery()); 
//                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
//                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
//                $this->pager->setParameter('company_id',$this->getUser()->getGuardUser()->getCompany()->get('id'));
//                $this->pager->setPage($request->getGetParameter('page'));
//                $this->pager->execute();              
//               }                                    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }
    
   
}


