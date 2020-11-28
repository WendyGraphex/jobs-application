<?php


class CartFormatter extends mfFormatter {
     
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getSalePriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getSalePriceWithTax());
    }
    
     function getSalePriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getSalePriceWithoutTax());
    }
    
    function getTotalSalePriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalSalePriceWithTax());
    }
    
     function getTotalSalePriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalSalePriceWithoutTax());
    }
    
    function getNumberOfQuotations()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_quotations'));
    }
    
    function getLanguage()
    {
       return new LanguageFormatter($this->getValue()->get('lang'));  
    }
    
    function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
    function getCommissionWithTax()
    {
        return new FloatFormatter($this->getValue()->getCommissionWithTax());
    }
    
     function getCommissionWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getCommissionWithoutTax());
    }
    
     function getGlobalSalePriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getGlobalSalePriceWithTax());
    }
    
     function getGlobalSalePriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getGlobalSalePriceWithoutTax());
    }
    
    function getTaxAmount()
    {
       return new FloatFormatter($this->getValue()->getTaxAmount()); 
    }
    
    
}
