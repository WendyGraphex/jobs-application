<?php

require_once __DIR__."/../locales/Forms/SiteClientAddForm.class.php";

class site_client_ajaxAddAction extends mfAction
{

    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();
        $this->form=new SiteClientAddForm($request->getPostParameter('SiteClient'));
        $this->item=new SiteClient(null,'frontend');      
        try
        {
            if (!$request->isMethod('POST') || !$request->getPostParameter('SiteClient'))
                return ;
            $this->form->bind($request->getPostParameter('SiteClient'));
            if ($this->form->isValid())
            {
                $this->item->create($this->form->getClients());
                $messages->addInfo(__('Clients has been created.'));
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

