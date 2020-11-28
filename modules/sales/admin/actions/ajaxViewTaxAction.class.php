<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleTaxViewForm.class.php";
 
 
class sales_ajaxViewTaxAction extends mfAction {

     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();             
        $this->form = new SaleTaxViewForm();   
        $this->item=new SaleTax($request->getPostParameter('SaleTax'));
         
    }

}