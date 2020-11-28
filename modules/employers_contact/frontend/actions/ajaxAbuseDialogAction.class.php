<?php

require_once __DIR__."/../locales/Forms/EmployerAbuseAdvertI18nForm.class.php";

class employers_contact_ajaxAbuseDialogAction extends mfAction
{

    function execute(mfWebRequest $request)
    {    
         $this->advert_i18n= new EmployerAdvertI18n($request->getPostParameter('EmployerAdvertI18n'));
         $this->form= new EmployerAbuseAdvertI18nForm();
         $this->max_characters=500;
    }

}




