<?php

class CurrencyValidator extends mfValidatorChoice
{
   function configure($options=array(),$messages=array()) {
        parent::configure($options, $messages);               
        $this->setOption('choices',ShopCurrencyUtils::getShopCurrencies());      
   }
  
    protected function doIsValid($value)
  {
      $choices = $this->getChoices();
      $item=$this->_inChoices($value, $choices);
      if (!$item)
      {
        throw new mfValidatorError($this, 'invalid', array('value' => $value));
      }
     return $item;
  }
  
   protected function _inChoices($value, array $choices = array())
   { 
    foreach ($choices as $name=>$choice)
    {
      if ($choice->get('id') == (string) $value)
          return $choice;
    }
    return false;
  }
  
  function notInChoices($value)
  {     
      foreach ($this->getChoices() as $choice)
      {
          if ($choice->getSiteCurrency()->get('code')==(string)$value)
              return false;
      }    
      return true;
  }
  
}

class currencyForm extends mfForm {
    
    function configure() {
        $this->setValidator('currency',new CurrencyValidator());
    }
}
 
class shops_currency_selectListCurrencyActionComponent extends mfActionComponent {

    function updateCurrencySession()
    {
        $session_currency=$this->getUser()->getStorage()->read('currency');
        if ($session_currency)
        {    
           if ($this->selected && $session_currency->get('id')!=$this->selected->get('id'))
           {    
              $this->getUser()->getStorage()->write('currency',$this->selected); 
              $this->getEventDispather()->notify(new mfEvent($this->selected, 'currency.change',$this->getUser()->getStorage())); 
           }
        }
        else
        {
            $this->getUser()->getStorage()->write('currency',$this->selected);  
            $this->getEventDispather()->notify(new mfEvent($this->selected, 'currency.change',$this->getUser()->getStorage())); 
        }        
    }
    
    function execute(mfWebRequest $request) {
       
        $this->form=new CurrencyForm();       
        if($request->getPostParameter('currency'))
        {
           $this->form->bind($request->getPostParameter('currency'));
           if ($this->form->isValid())
           {
               $this->selected=$this->form->getValue('currency');
               $this->updateCurrencySession();
           }  
           else
           {
               // No currency known
              if (!$this->getUser()->getStorage()->read('currency'))
              {
                 $this->selected=current($this->form->currency->getOption('choices'));
                 $this->updateCurrencySession(); 
              }    
           }              
        }   
        else 
        {                
            if (($selected=$this->getUser()->getStorage()->read('currency')))
            {
                $this->selected=$selected;
                // Case : selected not country, take first one
                if ($this->form->currency->notInChoices($this->selected->getSiteCurrency()->get('code')))
                {    
                    $this->selected=current($this->form->currency->getOption('choices'));   
                    $this->updateCurrencySession();
                }    
            }   
            else
            {                                
                // Case : only one choice => Take the first one
                if (count($this->form->currency->getOption('choices'))==1)
                {                    
                    $this->selected=current($this->form->currency->getOption('choices'));                                   
                }
                else
                {                                                                                         
                    $this->selected=new ShopCurrency(ShopSettings::load()->get('default_currency'));                                     
                }                   
                $this->updateCurrencySession();
            } 
        }    
        $request->addRequestParameter('shopCurrency', $this->getUser()->getStorage()->read('currency'));
    }
    
}    