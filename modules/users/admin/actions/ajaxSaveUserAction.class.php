<?php

require_once __DIR__."/../locales/Forms/UserForm.class.php";

class users_ajaxSaveUserAction extends mfAction {

    function execute(mfWebRequest $request) {                  
        $messages = mfMessages::getInstance();
        try {
            $this->form = new UserForm($this->getUser()->getCountry());
            $this->user=new User($request->getPostParameter('User'),'admin');           
            $this->form->bind($request->getPostParameter('User'));
            if ($this->form->isValid()) {
                $this->user->add($this->form->getValues());
                if ($this->user->isExist())
                   throw new mfException(__("User already exists."));               
                $this->user->save();
                $messages->addInfo(__("User [%s] has been updated.",(string)$this->user));
                $this->forward('users','ajaxListPartialUser');
            }
            else
            {
                 $messages->addError(__("Form has some errors."));
                 $this->user->add($request->getPostParameter('User')); // Repopulate                 
            }    
        } 
        catch (mfException $e)
        {
           $messages->addError($e);
        }             
    }
}
