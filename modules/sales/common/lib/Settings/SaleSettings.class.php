<?php

class SaleSettings extends SiteSettings {
    
    
    function getDefaults()
    {
        parent::getDefaults();      
        $this->add(array( 
            'tax_rate'=>null,
            ));        
    }
      
    function getTax()
    {
        return $this->_tax_rate=$this->_tax_rate===null?new SaleTax($this->get('tax_rate')):$this->_tax_rate;
    }
}
