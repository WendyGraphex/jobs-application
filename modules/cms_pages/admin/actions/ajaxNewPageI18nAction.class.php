<?php

require_once dirname(__FILE__)."/../locales/Forms/Page/CmsPageI18nNewForm.class.php";

class cms_pages_ajaxNewPageI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {       
        $messages = mfMessages::getInstance();                    
        try
        {
            $form=new LanguageFrontendForm($this->getUser()->getLanguage());
            $form->bind($request->getPostParameter('CmsPageI18n'));
            if (!$form->isValid())
            {
                $messages->addError(__("language is not valid."));
                $request->addRequestParameter('lang',$this->getUser()->getLanguage());
                $this->forward($this->getModuleName(),'ajaxPagesListPartial');  
            }  
            $this->page_i18n = new CmsPageI18n(array('lang'=>(string)$form['lang']));               
            $this->form=new CmsPageI18nNewForm((string)$form['lang']);            
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }

    }
}

