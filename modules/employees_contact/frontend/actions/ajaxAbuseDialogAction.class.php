<?php

require_once __DIR__."/../locales/Forms/EmployeeAbuseAdvertI18nForm.class.php";
 
class employees_contact_ajaxAbuseDialogAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
         $this->advert_i18n= new EmployeeAdvertI18n($request->getPostParameter('EmployeeAdvertI18n'));
         $this->form= new EmployeeAbuseAdvertI18nForm();
         $this->max_characters=500;
    }

}




