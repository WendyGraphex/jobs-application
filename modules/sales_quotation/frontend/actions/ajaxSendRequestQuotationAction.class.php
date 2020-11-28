<?php

//require_once __DIR__."/../locales/Forms/EmployeeSendQuoteForm.class.php";

class EmployeeSendRequestQuotationForm extends mfForm {
    
    protected $request=null;
    
    function __construct(EmployerQuotationRequest $request,$defaults = array(), $options = array()) {
        $this->request=$request;
        parent::__construct($defaults, $options);
    }
    
    function getRequest()
    {
        return $this->request;
    }
    
    function configure() {
        $this->setValidators(array(
            'description'=>new mfValidatorString(array('max_length'=>500)),
            'price'=>new mfValidatorI18nNumber(),   
        ));
    }
        
    function getValues()
    {
        $values=parent::getValues();
        $values['employer_user_id']=$this->getRequest()->get('employer_user_id');
        $values['request_id']=$this->getRequest()->get('id');
        $values['employee_advert_id']=$this->getRequest()->get('advert_id');
        $values['employee_advert_lang']=$this->getRequest()->get('lang');
        $values['number_of_quotations']=1;
        return $values;
    }
}
   
class sales_quotation_ajaxSendRequestQuotationAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();
        $item=new EmployerQuotationRequest($request->getPostParameter('EmployerQuotationRequest'),$this->getUser()->getGuardUser());     
        if ($item->isNotLoaded())
           $this->forwardTo401Action();        
        $response=array('action'=>'SendRequestQuotation');       
        $form=new EmployeeSendRequestQuotationForm($item);
        $form->bind($request->getPostParameter('EmployeeQuote'));
        if (!$form->isValid())
        {        
           $response['errors']=$form->getErrorSchema()->getCodes();
           return $response;    
        }      
         $quotation = new SaleEmployeeQuotation(null,$this->getUser()->getGuardUser());                         
         $quotation->add($form->getValues());
         $quotation->create();
         
         $item->set('quotation_id',$quotation)->setQuotedAt()->save();
         
         $this->getEventDispather()->notify(new mfEvent($quotation, 'quotation.created'));   
         
         $engine= new EmployeeSaleQuotationEmailEngine($quotation);
         $engine->sendProposed();
         
         $response['id']=$item->get('id');
         $response['quoted_at']=(string)$item->getFormatter()->getQuotedAt()->getText();
         $response['price']=(string)$quotation->getFormatter()->getPrice()->getAmount();                  
         return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


