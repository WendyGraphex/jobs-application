<?php

require_once __DIR__."/../locales/Forms/SiteCountryViewForm.class.php";

class site_countries_ajaxSaveCountryAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteCountryViewForm($request->getPostParameter('SiteCountry'));
        $this->item=new SiteCountry($request->getPostParameter('SiteCountry'));
        try
        {
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteCountry') || $this->item->isNotLoaded())
                return ;
            $this->form->bind($request->getPostParameter('SiteCountry'));
            if ($this->form->isValid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException(__('Country already exists.'));    
                $this->item->save();
                $messages->addInfo(__('Country has been saved.'));
                $this->forward($this->getModuleName(),'ajaxListPartialCountry');
            }   
            else
            {
               $this->item->add($this->form->getDefaults()) ;
               $messages->addError(__('Form has some errors.'));
              // var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

