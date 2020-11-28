<?php

require_once __DIR__ . "/../locales/Forms/EmployeeViewForm.class.php";


class employees_ajaxSaveEmployeeAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->item=new Employee($request->getPostParameter('Employee'));
        $this->form = new EmployeeViewForm($this->getUser(),array());
        $this->item->add($this->form->getDefaults());
        $this->form->bind($request->getPostParameter('Employee'));
        if ($this->form->isValid()) {
            $this->item->add($this->form->getValues());
            $this->item->save();
            $messages->addInfo(__("Employee has been updated."));
           $this->forward('employees','ajaxListPartialEmployee');
            
        } else {
            echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
            $messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        }

    }

}


