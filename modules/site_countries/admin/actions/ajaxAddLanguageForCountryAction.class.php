<?php

require_once __DIR__."/../locales/Forms/SiteLanguageForCountryAddForm.class.php";

class site_countries_ajaxAddLanguageForCountryAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->item=new SiteCountry($request->getPostParameter('SiteCountry'));
        if ($this->item->isNotLoaded())
            return ;
        $this->form=new SiteLanguageForCountryAddForm($this->item,$request->getPostParameter('SiteCountryLanguage'));         
        try
        {
           if (!$request->isMethod('POST') || !$request->getPostParameter('SiteCountryLanguage'))
                return ;
            $this->form->bind($request->getPostParameter('SiteCountryLanguage'));
            if ($this->form->isValid())
            {
                //echo "<pre>"; var_dump($this->form->getLanguages());
                $this->item->addLanguages($this->form->getLanguages());
                $messages->addInfo(__('Languages have been created.'));
                $this->forward($this->getModuleName(),'ajaxListPartialCountry');
            }   
            else
            {
               $this->item->add($this->form->getDefaults()) ;
               $messages->addError(__('Form has some errors.'));
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }   
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

