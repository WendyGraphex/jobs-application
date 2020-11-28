<?php

 
class payments_ajaxListTextI18nAction extends mfAction {
    
     const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {          
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);   
        $this->forwardIf(!$site,"sites","Admin");
        $class="payment".ucfirst(strtolower($request->getRequestParameter('payment')))."TextI18n";
        if (!class_exists($class))
            $this->forward404();       
        $messages = mfMessages::getInstance();             
        $this->payment=strtolower($request->getRequestParameter('payment'));
        try
        {
            $this->formFilter= new paymentsTextI18nFormFilterBase($class,$site);
            $this->pager=new Pager($class);    
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {    
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setPage($request->getGetParameter('page'));            
                $this->pager->executeSite($site);
            }
            else
            {
              $messages->addErrors(array_merge($this->formFilter->getErrorSchema()->getGlobalErrors(),
                                               $this->formFilter->getErrorSchema()->getErrors()));  
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }          
    }

}

