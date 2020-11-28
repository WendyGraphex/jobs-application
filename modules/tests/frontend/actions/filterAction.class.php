<?php

//www.project55.net/tests/filter

class TestFormFilterFormFilter extends mfFormFilter2  {
    
    
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
       $this->setClass('Employee');
       
       $this->setFields(array(
                'name'=>array(
//                    'class'=>'CustomerCompany',
//                    'search'=>array('conditions'=> 
//                                CustomerCompany::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'"
//                              )
                ),
              'lastname'=>array(
              'class'=>'Employee',
              'search'=>array('conditions'=>
                                                 "(".
               Employee::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               Employee::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'firstname'=>array(
              'class'=>'Employee',
              'search'=>array('conditions'=>
                                                 "(".
               Employee::getTableField('lastname')." COLLATE UTF8_GENERAL_CI LIKE '%%{lastname}%%' OR ".
               Employee::getTableField('firstname')." COLLATE UTF8_GENERAL_CI LIKE '%%{firstname}%%'".
                                                 ")")
                                ),
           'username'=>array(
                        'class'=>'Employee',
                        'search'=>array('conditions'=>Employee::getTableField('username')." COLLATE UTF8_GENERAL_CI LIKE '%%{username}%%' ")
                        ),  
           'email'=>array(
                        'class'=>'Employee',
                        'search'=>array('conditions'=>Employee::getTableField('email')." COLLATE UTF8_GENERAL_CI LIKE '%%{email}%%' ")
                        ),
           'phone'=>array(
                        'class'=>'Employee',
                        'search'=>array('conditions'=>Employee::getTableField('phone')." COLLATE UTF8_GENERAL_CI LIKE '%%{phone}%%' ")
                        ),         
          
           ));
               
        $this->setQuery(mfQuery::getInstance()->select("{fields}")->from(Employee::getTable()));
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(                                                        
                        "firstname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                        "lastname"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "phone"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                       
                        "city"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                     ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(                      
                     "firstname"=>new mfValidatorString(array("required"=>false)),
                     "lastname"=>new mfValidatorString(array("required"=>false)),
                     "email"=>new mfValidatorString(array("required"=>false)),
                     "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),   
            'begin' => new mfValidatorSchema(array(                      
                     "firstname"=>new mfValidatorString(array("required"=>false)),
                     "lastname"=>new mfValidatorString(array("required"=>false)),
                     "email"=>new mfValidatorString(array("required"=>false)),
                     "phone"=>new mfValidatorString(array("required"=>false)),                                       
                            ),array("required"=>false)),   
            'in' => new mfValidatorSchema(array(                      
                     "id"=>new mfValidatorChoice(array("required"=>false,'multiple'=>true,'choices'=>range(1,100))),                                                 
                            ),array("required"=>false)),   
            'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                                         
            'rangeOr' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),   
                            // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                                ),array("required"=>false)),                                          
            'equal' => new mfValidatorSchema(array(
                    // "lastlogin"=>new mfValidatorChoice(array("choices"=>UserUtils::getUnLockerUsers()->unshift(array(""=>"","IS_NULL"=>__("No user")))->toArray(),"key"=>true,"required"=>false)),
                    // "lastpassword"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")),"key"=>true,"required"=>false)),
                    "is_active"=>new mfValidatorChoice(array("required"=>false,'key'=>true,"choices"=>array(""=>"","YES"=>__("YES"),"NO"=>__("NO")))),                  
                            ),array("required"=>false)),                                         
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
    
    
    
}



class EmployeePager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("Employee"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployee();               
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}


class tests_filterAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
         
         echo __METHOD__;
      
         $formfilter= new TestFormFilterFormFilter();
         $formfilter->bind(array('nbitemsbypage'=>5,
                               //  'search'=>array('firstname'=>'toto'),
                               //  'begin'=>array('phone'=>'75'),
                                'order'=>array('firstname'=>'asc'),
                                 'in'=>array('id'=>array(1,2)),
                               //  'equal'=>array('is_active'=>'YES'),
                               //  'range'=>array('created_at'=>array('from'=>'01/01/2019','to'=>'10/12/2020')),
                               // 'rangeOr'=>array('created_at'=>array('from'=>'01/01/2019','to'=>'10/12/2020'),
                               //                 'updated_at'=>array('from'=>'01/01/2018','to'=>'10/12/2019')
                               //                 ),
                                 'token'=>$formfilter->getCSRFToken()));
         $pager=new EmployeePager();
         if ($formfilter->isValid() )
         {
            // echo "<pre>"; //.$formfilter->getQuery();
            // var_dump( $formfilter->getQuery());             
            // echo $formfilter->getQuery();
                $pager->setQuery($formfilter->getQuery()); 
                $pager->setNbItemsByPage($formfilter['nbitemsbypage']);                     
                $pager->setPage($request->getGetParameter('page'));
                $pager->execute(); 
                
                 echo mfSiteDatabase::getInstance()->getQuery();
         }  
         else
         {
             var_dump($formfilter->getErrorSchema()->getErrorsMessage());
         }    
        die();
    } 
    
    
}

