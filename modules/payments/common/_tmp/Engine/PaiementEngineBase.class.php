<?php

abstract class paymentEngineBase {
    
   
    protected   $cart=null,
                $site=null,
                $payment=null,
                $options=null,
                $request=array(),                             
                $taxe_amount=0,
                $taxe_rate=0,
                $price_with_no_taxe=0,
                $price_with_taxe=0,
                $currency=null,
                $isValid=false,
                $isAuthorized=false,
                $isProcessed=false;
    
    /* 
     * 1- check if authorized
     *  address (zone-country, zone-postcode, zone-state)
     *  customers not authorized - not implemented
     *  amount min/max   
     *  currency
     */
    abstract function process();
    abstract static function getAvailableStatus();
   
    function getSite()
    {
        return $this->site;
    }
        
    function __construct($cart,$payment=null) //,$user,$request=array())
    {            
        if ($cart==null) 
            throw new paymentEngineException(paymentEngineException::ERROR_payment_CART_NOT_EXISTS);  
        $this->cart=$cart;  
        $this->site=$cart->getSite();
        $this->payment=$payment;           
        $this->currency=$cart->getShopCurrency()->getSiteCurrency(); // iso4217    
        $this->configure();        
    }
    
    function getpayment()
    {
        return $this->payment;
    }
    
    function bind($request,$user=null)
    {
       $this->user=$user; // User from browser  
       $this->request=$request;
    }   
    
    protected function configure()
    {
        // load country available
        
        // load currencies available
        
        // => check if payment is authorized
        // Load des textI18n
    }
           
    function isProcessed()
    {
        return $this->isProcessed;
    }
    
    function getCart()
    {
        return $this->cart;
    }
    
    function isAuthorized()
    {
        return $this->isAuthorized;
    }
    
    function isValid()
    {
       return $this->isValid;
    }
    
    function getOptions()
    {      
        return $this->options;
    }
           
    function hasOptions()
    {
        return ($this->options!=null);
    }
    
    function getRequest($default=array())
    {
        return $this->request?$this->request:$default;
    }
    
    function getOption($name,$default=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$default;
    }        
            
    function getOptionsValues()
    {
        return $this->options;
    }        
    
    function getCurrency()
    {
       return $this->currency;
    }         
    
    /* ================= P R I C I N G  ============================ */
    function getPriceWithNoTaxe()
    {
        $this->isProcessed();
        $currency_rate=$this->currency->get('rate',1);
        return $this->price_with_no_taxe * $currency_rate;
    }
    
    function getPriceWithTaxe()
    {
        $this->isProcessed();
        $currency_rate=$this->currency->get('rate',1);                        
        return $this->price_with_taxe * $currency_rate;
    }
    
    function getFormattedPriceWithTaxe()
    {
       return format_currency($this->getPriceWithTaxe(),$this->currency->get('code')); 
    }
    
    function getFormattedPriceWithNoTaxe()
    {
       return format_currency($this->getPriceWithNoTaxe(),$this->currency->get('code'));  
    }
    
    function getTaxeAmount()
    {
        $this->isProcessed();
        $currency_rate=$this->currency->get('rate',1);
        return $this->taxe_amount * $currency_rate;
    }
    
    function getFormattedTaxeAmount()
    {
         return format_currency($this->getTaxeAmount(),$this->currency->get('code'));
    }
    
    function getTaxeRate()
    {
        return $this->taxe_rate;
    }
    
    function hasAdder()
    {
        return ($this->price_with_no_taxe!=0);
    }
    
     /* ====================== L O A D  TEXT ========================= */
    function loadTextI18N($culture=null,$site=null)
    {        
    }
    
    function isFree()
    {
        return ($this->price_with_no_taxe==0);
    }
    
    function toArray($methods=null)
   {
       if ($methods==null)
           $methods=array('TaxeAmount','PriceWithNoTaxe','PriceWithTaxe');
       $values=array();
       foreach ($methods as $name)
       {         
          $method="getFormatted".$name;
          if (method_exists($this, $method))
             $values[$name]=$this->$method();          
       }       
       return $values;
   }  
}

