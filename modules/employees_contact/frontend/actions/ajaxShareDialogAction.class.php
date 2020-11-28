<?php

 
class employees_contact_ajaxShareDialogAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
         $this->advert_i18n= new EmployeeAdvertI18n($request->getPostParameter('EmployeeAdvertI18n'));
    }

}




