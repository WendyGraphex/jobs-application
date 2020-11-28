<?php


class mfValidatorI18nCurrencies extends mfValidatorChoice 
{
   
   protected function configure()
  {
      $this->setOption('currencies',array('USD'));
      $this->setOption('culture',mfContext::getInstance()->getUser()->getCulture());
      $this->setOption('choices', mfCultureInfo::getInstance($this->getOption('culture'))->getCurrencies($this->getOption('currencies')));
      parent::configure();
      $this->setOption('key',true);
  }  
  
  
  function getCurrencies()
  {
      if ($this->currencies===null)
      {
          $this->currencies=new mfArray();
          foreach ($this->getChoices() as $code=>$value)
          {              
             $this->currencies[$code]= mfString::getInstance($value)->ucfirst(); 
          }    
          $this->currencies->asort();
      }    
      return  $this->currencies;
  }
   
}

