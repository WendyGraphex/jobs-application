<?php

require_once __DIR__ . "/../locales/Forms/UserNewForm.class.php";

class users_ajaxNewUserAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        try {
            $this->item = new User(null, 'admin'); // new object
            $this->form = new UserNewForm($this->getUser(), $request->getPostParameter('User'));
            if (!$request->isMethod('POST') || !$request->getPostParameter('User') != null) 
                return ;
            $this->form->bind($request->getPostParameter('User'), $request->getFiles('User'));
            if ($this->form->isValid()) {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist())
                    throw new mfException (__("User already exists"));
                if ($this->form->getValue('password'))
                    $this->item->encryptPassword();
                $this->item->save();
               // $this->item->updateGroups($this->form->getValue('groups'));
                $messages->addInfo(__("User %s (%s) has been saved.", array($this->item, $this->item->get('username'))));
               // $this->getEventDispather()->notify(new mfEvent($this->item, 'user.change', 'new'));
                $this->forward('users', 'ajaxListPartialUser');
            } else {
                $this->item->add($request->getPostParameter('User'));
                $messages->addError(__("Forms has some errors."));
            }
           
        } catch (mfException $e) {
            $messages->addError($e);
        }
    }
}
