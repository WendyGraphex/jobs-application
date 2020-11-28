<?php

class EmployeePaymentPriceForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'price'=>new mfValidatorI18nNumber(),
        ));
    }
    
    function getPrice()
    {
        return $this['price']->getValue();
    }
}
class payments_ajaxCreditProcessAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
         if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        try
        {
              $method=new PaymentMethod($request->getRequestParameter('method'));
              if ($method->isNotLoaded())
                  throw new mfException(__('Payment is invalid.'));
              $form= new EmployeePaymentPriceForm();
              $form->bind($request->getPostParameter('EmployeePayment'));
              if (!$form->isValid())
                  throw new mfException(__('Form has errors.'));
              $method->getSettings()->getEngine()->setPrice($form->getPrice())->process();
             
              $response=array('action'=>'CreditProcess',       
                              'global_total'=>$method->getSettings()->getEngine()->getTotalPriceSubAdderWithTax()->getAmount(),
                              'adder'=>$method->getSettings()->getEngine()->getAdder()->getAmount(),
                             );      
        }
        catch (mfException $e)
        {
            $messages->addError($e);           
        }        
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
   
}

