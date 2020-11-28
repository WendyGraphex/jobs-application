<?php

require_once __DIR__."/../locales/Forms/EmployeeGalleryViewForm.class.php";
 
 
class employees_ajaxViewGalleryI18nAction extends mfAction {

     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();             
        $this->item_i18n=new EmployeeGalleryI18n($request->getPostParameter('EmployeeGalleryI18n'));              
        $this->form= new EmployeeGalleryViewForm( );          
         
    }

}