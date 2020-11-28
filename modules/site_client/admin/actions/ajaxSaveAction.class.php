<?php

require_once __DIR__."/../locales/Forms/SiteClientForm.class.php";

class site_client_ajaxSaveAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteClientForm($request->getPostParameter('SiteClient'));
        $this->item=new SiteClient($request->getPostParameter('SiteClient'),'frontend');      
        try
        {
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteClient'))
                return ;
            $this->form->bind($request->getPostParameter('SiteClient'));
            if ($this->form->isValid())
            {
                $this->item->add($this->form->getValues()) ;
                $this->item->save();
                $this->item->getSite()->removeFrontendHostCache();
                
                $messages->addInfo(__('Client has been updated.'));
                $this->forward($this->getModuleName(),'ajaxListPartial');
            }   
            else
            {
               $this->item->add($this->form->getDefaults()) ;
               $messages->addError(__('Form has some errors.'));
            //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}

