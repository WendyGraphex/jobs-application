<?php

class AddQuotationToCartForm extends mfForm {
    
    protected $user=null;
    
    
    function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function configure()
    {
        $this->setValidators(array(
            'id'=>new SaleEmployeeQuotationValidator($this->getEmployerUser()),       
            'comments'=>new mfValidatorString(array('required'=>false))
        ));
    }   

    function getEmployerUser()
    {
        return $this->user;
    }    
    
    function getQuotation()
    {
        return $this['id']->getValue();
    }
    
    function getValues()
    {
        $values=parent::getValues();
        $values['quotation_id']=$this['id']->getValue();      
        $values['employer_user_id']=$this->getEmployerUser(); 
        foreach (array('employee_user_id','in_at','out_at','number_of_hours','project_id') as $field)        
            $values[$field]=$this->getQuotation()->get($field);        
        $values['quantity']=1;        
        return $values;
    }
    
    function getCartQuotation()
    {
        if ($this->item===null)
        {    
            $this->item=new CartQuotation();
            $this->item->add($this->getValues());
            $this->item->setSignature();
        }
        return  $this->item;
    } 
}
