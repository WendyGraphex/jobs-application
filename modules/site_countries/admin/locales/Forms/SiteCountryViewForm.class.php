<?php


 class SiteCountryViewForm extends SiteCountryBaseForm {
 

     function configure() {
         parent::configure();
       //  $this->setValidator('company_id', new mfValidatorChoice(array('key'=>true,'required'=>true,'choices'=> SiteCountryCompany::getCompaniesForSelect()->unshift(array(''=>'')))));
     }
}


