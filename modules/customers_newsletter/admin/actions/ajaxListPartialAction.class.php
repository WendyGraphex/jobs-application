<?php

require_once __DIR__."/../locales/FormFilters/CustomerNewsletterFormFilter.class.php";

class customers_newsletter_ajaxListPartialAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {   
      
        $messages = mfMessages::getInstance();
        $this->formFilter= new CustomerNewsletterFormFilter();
        $this->pager=new Pager('CustomerNewsletter');  
        try
        {
                $this->formFilter->bind($request->getPostParameter('filter'));
                if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
                {
                    $this->pager->setQuery($this->formFilter->getQuery());
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                    $this->pager->setPage($this->request->getGetParameter('page'));
                    $this->pager->execute();  
                }
                else
                {
                    $messages->addErrors($this->formFilter->getErrorSchema()->getErrors());
                }  
                
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    }

}

