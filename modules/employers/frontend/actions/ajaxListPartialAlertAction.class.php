<?php

require_once __DIR__."/../locales/FormFilters/EmployerUserFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/EmployerUserPager.class.php";

class employers_ajaxListPartialAlertAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->formFilter= new EmployerUserFormFilter();                  
        $this->pager=new EmployerUserPager();
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


