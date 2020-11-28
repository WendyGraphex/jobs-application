<?php

require_once __DIR__."/../locales/FormFilters/CustomerEmployeeMessageFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerEmployeeMessagePager.class.php";

class employees_messager_ajaxListPartialMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->formFilter= new CustomerEmployeeMessageFormFilter();                  
        $this->pager=new CustomerEmployeeMessagePager();
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                 //  echo $this->formFilter->getQuery();
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
                $this->pager->setParameter('employee_user_id',$this->getUser()->getGuardUser()->get('id'));
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


