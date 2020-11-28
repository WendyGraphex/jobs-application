<?php


class CartFormFilter extends mfFormFilterBase {

    protected $user=null;
    
    function __construct($user)
    {          
       $this->user=$user;
       parent::__construct();      
    }       
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure()
    {                         
       $this->addDefaults(array(          
            'order'=>array(
                            "id"=>"desc",                        
            ), 
            'equal'=>array(
               // "is_active"=>'YES',
            )   , 
            'nbitemsbypage'=>"20",
       ));          
       $this->setClass('CartProduct');
       
       $this->setFields(array(
          
         
           ));
         $this->setQuery("SELECT {fields} FROM ".CartProduct::getTable(). 
                       " INNER JOIN ".CartProduct::getOuterForJoin('product_id').
                       " INNER JOIN ".Product::getOuterForJoin('tax_id').
                       " INNER JOIN ".ProductI18n::getInnerForJoin('product_id').                        
                       " WHERE cart_id='{cart_id}' AND ".ProductI18n::getTableField('lang')."='{lang}'".
                            " AND ".CartProduct::getTableField('status')."='ACTIVE'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
       'order' => new mfValidatorSchema(array(
                     "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                 
                     //"updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                    // "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(  
                     "id"=>new mfValidatorInteger(array("required"=>true)),
                   
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                             "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                             "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),                   
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
   
}

