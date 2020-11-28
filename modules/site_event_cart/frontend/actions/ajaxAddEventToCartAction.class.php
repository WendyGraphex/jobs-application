<?php

class AddEventToCartForm extends mfForm {
    
     
    
    function configure()
    {
        $this->setValidators(array(
            'event'=>new mfValidatorInteger(),
            'quantity'=>new mfValidatorInteger(array('min'=>1),array('required'=>__('Quantity is required')))
        ));       
        if ($this->getEvent()->isLoaded())
        {
            $this->quantity->setOption('max',$this->getEvent()->get('available_quantity'));
        }            
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));    
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;                  
        if ($this->getEvent()->isNotLoaded())
        {          
            throw new mfValidatorErrorSchema($validator,array('event'=>new mfValidatorError($this->event,'invalid')));
        }    
        return $values;
    }
    
    function getEvent()
    {      
        return $this->_event=$this->_event===null?new SiteEvent($this->getDefault('event')):$this->_event;
    }
    
    function getQuantity()
    {
        return $this['quantity']->getValue();
    }
} 


class site_event_cart_ajaxAddEventToCartAction extends mfAction {
 

    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
       
          try 
      {         
          $response=new mfArray(array('action'=>'AddEventToCart'));
          $form = new AddEventToCartForm($request->getPostParameter('AddEventToCart'));
          $form->bind($request->getPostParameter('AddEventToCart'));
          if ($form->isValid())
          {
                if (!$cart=$this->getUser()->getStorage()->read('event_cart'))                    
                      $cart = SiteEventCart::create($this->getUser(),$request);                  
                  $cart->getCartEvents()->addEvent($form->getEvent(),$form->getQuantity());
                  $cart->getEngine()->process();                                    
                  
                $response['number_of_events']=$cart->getCartEvents()->getTotalQuantity();
                $response['id']=$form->getQuotation()->get('id');
                $response['state_text']=__('In cart');
          } 
          else
          {
              $response->set('errors',$form->getErrorSchema()->getErrorsMessage());
          }                       
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response->toArray();
    }
    
}
