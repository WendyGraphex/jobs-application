<?php

require_once __DIR__ . "/../locales/Forms/CustomerViewForm.class.php";


class customers_registration_ajaxSaveCustomerAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        $this->item=new CustomerRegistration($request->getPostParameter('Customer'));
        $this->form = new CustomerViewForm($this->getUser(),array());
        $this->item->add($this->form->getDefaults());
        $this->form->bind($request->getPostParameter('Customer'));
        if ($this->form->isValid()) {
            $this->item->add($this->form->getValues());
            $this->item->save();
            $messages->addInfo(__("Customer has been updated."));
           $this->forward('customers_registration','ajaxListPartialCustomer');
            
        } else {
            echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
            $messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        }

    }

}


