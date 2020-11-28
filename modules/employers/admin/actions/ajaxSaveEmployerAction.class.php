<?php

require_once __DIR__ . "/../locales/Forms/EmployerUserViewForm.class.php";


class employers_ajaxSaveEmployerAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->item=new EmployerUser($request->getPostParameter('Employer'));
        $this->form = new EmployerUserViewForm($this->getUser(),array());
        $this->item->add($this->form->getDefaults());
        $this->form->bind($request->getPostParameter('Employer'),$request->getFiles('Employer'));
        if ($this->form->isValid()) {
            $this->item->add($this->form->getValues());
            $this->item->setAvatar($this->form->getAvatar());
            $this->item->save();
            $messages->addInfo(__("Employer has been updated."));
           $this->forward('employers','ajaxListPartialEmployer');
            
        } else {
           // echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
            $messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        }

    }

}


