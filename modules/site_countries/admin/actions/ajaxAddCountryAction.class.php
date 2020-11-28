<?php

require_once __DIR__."/../locales/Forms/SiteCountryAddForm.class.php";

class site_countries_ajaxAddCountryAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteCountryAddForm($request->getPostParameter('SiteCountry'));
        $this->item=new SiteCountry();      
        try
        {
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteCountry'))
                return ;
            $this->form->bind($request->getPostParameter('SiteCountry'));
            if ($this->form->isValid())
            {
                $this->item->create($this->form->getCountries());
                $messages->addInfo(__('Country has been created.'));
                $this->forward($this->getModuleName(),'ajaxListPartialCountry');
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

