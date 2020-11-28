<?php

require_once __DIR__."/../locales/Forms/EmployerGalleryViewForm.class.php";
 
 
class employers_ajaxViewGalleryI18nAction extends mfAction {

     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();             
        $this->item_i18n=new EmployerGalleryI18n($request->getPostParameter('EmployerGalleryI18n'));              
        $this->form= new EmployerGalleryViewForm( );          
         
    }

}