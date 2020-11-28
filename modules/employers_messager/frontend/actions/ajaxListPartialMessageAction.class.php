<?php

require_once __DIR__."/../locales/FormFilters/CustomerEmployerMessageFormFilter.class.php";
require_once __DIR__."/../locales/Pagers/CustomerEmployerMessagePager.class.php";

class employers_messager_ajaxListPartialMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->formFilter= new CustomerEmployerMessageFormFilter();                  
        $this->pager=new CustomerEmployerMessagePager();
       // echo $this->getUser()->getGuardUser()->get('id');
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);     
                $this->pager->setParameter('lang',$this->getUser()->getLanguage());
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


