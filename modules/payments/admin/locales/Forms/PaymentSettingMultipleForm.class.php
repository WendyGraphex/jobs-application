<?php

class PaymentSettingForm extends mfForm {
    
    function configure()
    {
        $this->setValidators(array(
            'amount_maximum'=>new mfValidatorI18nNumber(),
            'amount_minimum'=>new mfValidatorI18nNumber(),
            'adder'=>new mfValidatorI18nNumber(),
            'adder_rate'=>new mfValidatorI18nPourcentage(),
            'tax_rate'=>new mfValidatorI18nPourcentage(),
        ));
    }
}

class PaymentSettingMultipleForm extends mfForm {
     
    protected $settings=null,$components=null,$payments=null;
             
        function configure()
        {            
            $this->loaded=false;
            foreach ($this->getPayments() as $payment)
            {    
                $this->createEmbedFormForEach('methods', 'PaymentSettingForm', $this->getPayments()->count());    
            }
            $this->getSettings(); // preload ????
        }
          
      function getPayments()
      {
          return $this->payments=$this->payments===null?PaymentMethod::getAllByPosition()->byIndex():$this->payments;
      }
      
      function getSettings()
      {
         if ($this->settings===null)
         {             
              $this->settings=new PaymentMethodSettingsCollection();
              $settings=PaymentMethodSettings::getAll()->byMethod();            
              foreach ($this->getPayments() as $index=>$method)
              {                               
                    if ($settings->hasItemByKey($method->get('id')))                                
                        $this->settings[$index]=$settings->getItemByKey($method->get('id'));               
                    else                     
                       $this->settings[$index]=new PaymentMethodSettings();                               
              }               
        }
        if ($this->isValid() && $this->loaded==false)
        {
            $this->loaded=true;
            foreach ($this->getPayments() as $index=>$method)
            {    
                 $this->settings[$index]->set('method_id',$method);
                 $this->settings[$index]->add($this['methods'][$index]->getValue());
            }
        }   
         return $this->settings;
      }
      
      
    
}

