<?php

class customers_newsletter_ajaxListPartialAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
     
    function preExecute() {
        $this->getResponse()->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');       
    }
    
    function execute(mfWebRequest $request) {   
      
        $messages = mfMessages::getInstance();
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
        if (!$site) {
            $messages->addInfo(__("thanks to select a site"));
            $this->forward("sites","Admin");
        }          
        $this->formFilter= new NewsletterFormFilter();
        $this->pager=new Pager('Newsletter');  
        try
        {
                $this->formFilter->bind($request->getPostParameter('filter'));
                if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
                {
                    $this->pager->setQuery($this->formFilter->getQuery());
                    $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                    $this->pager->setPage($this->request->getGetParameter('page'));
                    $this->pager->executeSite($site);  
                }
                else
                {
                    //var_dump($this->formFilter['range']['updated_at']->getError());
                    $messages->addErrors($this->formFilter->getErrorSchema()->getErrors());
                   
                }  
                
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    //   var_dump($this->pager);
      
     // return mfView::NONE;       
    }

}

