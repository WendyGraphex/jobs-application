<?php

class SiteEventOrderPaymentPriceForm extends mfForm {
    
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
class payments_ajaxProcessEventDebitAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {        
         if (!$this->getUser()->isEventUser())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance(); 
        try
        {
              $method=new PaymentMethod($request->getRequestParameter('method'));
              if ($method->isNotLoaded())
                  throw new mfException(__('Payment is invalid.'));
              $form= new SiteEventOrderPaymentPriceForm();
              $form->bind($request->getPostParameter('SiteEventOrder'));
              if (!$form->isValid())
                  throw new mfException(__('Form has errors.'));
              $method->getSettings()->getEngine()->setPrice($form->getPrice())->process();
              
              $response=array('action'=>'ProcessEventDebit',       
                              'general_total'=>$method->getSettings()->getEngine()->getTotaWithTax()->getAmount(),
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

