<?php


class EmployeeWorkPaymentRequestFormFilter extends mfFormFilterBase{
   
    
    function configure()
    {                    
       $this->setDefaults(array(            
            'order'=>array(
                            "date"=>"desc",                          
            ),            
            'equal'=>array(
              
            ),
            'in'=>array(
                'status'=>array('ACTIVE'), //,'ACCEPTED','PLANNED','INPROGRESS','REFUSED','PAID','REQUESTED')
            ),
            'nbitemsbypage'=>"50",
       ));          
       $this->setClass('EmployeeWorkPaymentRequest');
       $this->setFields(array(
           "request_reference"=>array('class'=>'EmployeeWorkPaymentRequest','name'=>'reference'),
            "work_reference"=>array('class'=>'EmployeeWork','name'=>'reference'),
            "order_reference"=>array('class'=>'SaleOrder','name'=>'reference'),
       ));
       $this->setQuery("SELECT {fields} FROM ". EmployeeWorkPaymentRequest::getTable().                         
                       " INNER JOIN ".EmployeeWorkPaymentRequest::getOuterForJoin('work_id').
                       " INNER JOIN ".EmployeeWorkPaymentRequest::getOuterForJoin('project_id').
                       " INNER JOIN ".EmployeeWork::getOuterForJoin('order_id').                       
                       " INNER JOIN ".EmployeeWorkPaymentRequest::getOuterForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeWorkPaymentRequest::getOuterForJoin('employer_user_id').
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                          //  "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),   
                           // "is_active"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)), 
                            "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                          //  "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                           "request_reference"=>new mfValidatorString(array("required"=>false)),
                           "work_reference"=>new mfValidatorString(array("required"=>false)),
                           "order_reference"=>new mfValidatorString(array("required"=>false)),
                         //  "name"=>new mfValidatorString(array("required"=>false)),
//  "status"=>new mfValidatorChoice(array("multiple"=>true,"choices"=>EmployeeWorkPaymentRequestStatus::getChoices()->unshift(array(''=>'')),"key"=>true,"required"=>false)),                       
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                         //   "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),  
             'in' => new mfValidatorSchema(array(   
                           "status"=>new mfValidatorChoice(array("multiple"=>true,"choices"=>EmployeeWorkPaymentRequestStatus::getChoices()->unshift(array(''=>'')),"key"=>true,"required"=>false)),                                                 
                            ),array("required"=>false)),  
            'equal' => new mfValidatorSchema(array(   
                           "confirmed_at"=>new mfValidatorChoice(array("choices"=>array("","IS_NULL","IS_NOT_NULL"),"required"=>false)), 
                         
                            ),array("required"=>false)),                                        
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
}
