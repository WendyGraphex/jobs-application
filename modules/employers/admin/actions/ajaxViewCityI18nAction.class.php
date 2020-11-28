<?php


require_once __DIR__."/../locales/Forms/EmployerCityGalleryViewForm.class.php";

class employers_ajaxViewCityI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();  
        $this->user=$this->getUser();       
        $this->item_i18n=new EmployerCityGalleryI18n($request->getPostParameter('EmployerCityGalleryI18n'));              
        $this->form= new EmployerCityGalleryViewForm( );                                      
    }
}
