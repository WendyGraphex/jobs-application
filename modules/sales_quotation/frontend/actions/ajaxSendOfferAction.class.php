<?php

class EmployeeAdvertOfferForm extends mfForm {
    
    protected $employee=null;
    
    function __construct(EmployeeUser $employee,$defaults = array(), $options = array()) {
        $this->employee=$employee;
        parent::__construct($defaults, $options);
    }
    
    function getEmployee()
    {
        return  $this->employee;
    }
    
    function configure()
    {
        $this->setValidators(array(
            'description'=>new mfValidatorString(),   
            'price'=>new mfValidatorI18nNumber(),   
        ));      
    }
       
}
 
class sales_quotation_ajaxSendOfferAction extends mfAction {
    

    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();       
        try 
        {    
            $response=array('action'=>'SendOffer');                
            $form = new   EmployeeAdvertOfferForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployeeAdvertOffer'));
            $form->bind($request->getPostParameter('EmployeeAdvertOffer'));
            if (!$form->isValid())
            {
               $response['errors']=$form->getErrorSchema()->getErrorsMessage();
               return $response;  
            }            
            $quotation = new SaleEmployeeQuotation($this->getUser()->getStorage()->read('advert_i18n'),$this->getUser()->getGuardUser());                         
            $quotation->add($form->getValues());
            $quotation->create();
            
            
             $engine= new EmployeeSaleQuotationEmailEngine($quotation);
             $engine->sendProposed();
             
             
             $this->getEventDispather()->notify(new mfEvent($quotation, 'quotation.created'));   
             
            $this->getUser()->getStorage()->remove('advert_i18n');             
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
         
    }
    
   
}


