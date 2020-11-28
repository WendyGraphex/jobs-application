<?php

require_once __DIR__."/../locales/Forms/SiteLanguageAddForm.class.php";

class site_languages_ajaxAddLanguageAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteLanguageAddForm($request->getPostParameter('SiteLanguage'));
        $this->item=new Language(null,'frontend');      
        try
        {
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteLanguage'))
                return ;
            $this->form->bind($request->getPostParameter('SiteLanguage'));
            if ($this->form->isValid())
            {
                $this->item->create($this->form->getLanguages());
                $messages->addInfo(__('Language has been created.'));
                $this->forward($this->getModuleName(),'ajaxListPartialLanguage');
            }   
            else
            {
               $this->item->add($this->form->getDefaults()) ;
               $messages->addError(__('Form has some errors.'));
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

