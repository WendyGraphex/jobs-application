<?php

require_once __DIR__."/../locales/Forms/GroupForm.class.php";

class users_guard_ajaxSaveGroupAction extends mfAction {

    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();

        try {
            $this->form = new GroupForm();
            $this->group=new Group($request->getPostParameter('Group'),'admin');
            $this->form->bind($request->getPostParameter('Group'));
            if ($this->form->isValid()) {

                $this->group->add($this->form->getValues());
                $this->group->save();
                $messages->addInfo(__("Group [%s] has been saved",$this->group->get('name')));
                $this->forward('users_guard','ajaxListPartialGroup');
            }
            else
            {
               $messages->addError(__("Form has some errors."));
            }    
        }       
        catch (mfException $e)
        {
           $messages->addError($e);
        }             
    }
}
