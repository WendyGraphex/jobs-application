<?php


class ProjectTaskForProjectEmployerFormFilter extends mfFormFilterBase {

    
    function configure()
    {                         
       $this->setDefaults(array(
           
            'order'=>array(
                            "id"=>"asc",                        
            ),            
            'nbitemsbypage'=>"100",
       ));          
       $this->setClass('ProjectTask');
       $this->setFields(array('name'=>array(                                          
                                           'search'=>array('conditions'=>
                                                "(".
                                                    ProjectTask::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%' OR ".
                                                    ProjectTask::getTableField('reference')." COLLATE UTF8_GENERAL_CI LIKE '%%{name}%%'".
                                                ")"                                        
                                           )
                              ),
                           //    "category_value"=>array('name'=>'value','class'=>'ProjectTaskCategoryI18n'),
                           //   'project_name'=>array('class'=>'Project','field'=>'name'),
                          /*    'customer'=>array(                                          
                                            'search'=>array('conditions'=>
                                                 "customer COLLATE UTF8_GENERAL_CI LIKE '%%{customer}%%'"
                                           )
                              ),
                              'version'=>array(                                          
                                            'search'=>array('conditions'=>
                                                 "version COLLATE UTF8_GENERAL_CI LIKE '%%{version}%%'"
                                           )
                              ),
                               'theme'=>array(                                          
                                            'search'=>array('conditions'=>
                                                 "theme COLLATE UTF8_GENERAL_CI LIKE '%%{theme}%%'"
                                           )
                              ),
                              'module'=>array(                                          
                                            'search'=>array('conditions'=>
                                                 "module COLLATE UTF8_GENERAL_CI LIKE '%%{module}%%'"
                                           )
                              ),
                              'action'=>array(                                          
                                            'search'=>array('conditions'=>
                                                 "action COLLATE UTF8_GENERAL_CI LIKE '%%{action}%%'"
                                           )
                              )*/
                        ));
       $this->setQuery("SELECT {fields} FROM ".ProjectTask::getTable().    
                       " INNER JOIN ".ProjectTask::getOuterForJoin('project_id').    
                   //    " LEFT JOIN ".ProjectTask::getOuterForJoin('employee_id'). 
                       " LEFT JOIN ".ProjectTask::getOuterForJoin('state_id').  
                       " LEFT JOIN ".ProjectTaskStateI18n::getInnerForJoin('state_id')." AND ".ProjectTaskStateI18n::getTableField('lang')."='{lang}'".
                    //   " LEFT JOIN ".ProjectTask::getOuterForJoin('category_id').  
                    //   " LEFT JOIN ".ProjectTask::getOuterForJoin('manager_id').  
                    //   " LEFT JOIN ".ProjectTaskCategoryI18n::getInnerForJoin('category_id')." AND ".ProjectTaskCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE ".ProjectTask::getTableField('employer_user_id')."='{employer_user_id}'".
                       ";"); 
       // Validators 
       $this->setValidators(array( 
                  
            'order' => new mfValidatorSchema(array(
                                                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                    
                                                        "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                                                                             
                                                    //    "project_name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                    //    "version"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                    //    "theme"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                    //    "module"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                    //    "action"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                        "requested_by"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                        "requested_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                        "before_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                        "start_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                        "end_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                     //   "customer"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                      
                                                         "total_duration"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                                                          
                                                         "estimated_duration"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                                                          
                                                        "category_value"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                                                          
                                                        "priority"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                                                                                          
                                                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                          //  "id"=>new mfValidatorString(array("required"=>false)),                                                                              
                            "name"=>new mfValidatorString(array("required"=>false)),                            
                         //   "version"=>new mfValidatorString(array("required"=>false)),      
                         //   "theme"=>new mfValidatorString(array("required"=>false)),      
                         //    "module"=>new mfValidatorString(array("required"=>false)),      
                        //      "action"=>new mfValidatorString(array("required"=>false)),      
                        //    "customer"=>new mfValidatorString(array("required"=>false)),      
                            ),array("required"=>false)),                             
            'range' => new mfValidatorSchema(array(   
                          //  "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                           // "expired_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                            
                            ),array("required"=>false)),   
            'in' => new mfValidatorSchema(array(                             
                            'state_id'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'multiple'=>true,'choices'=>ProjectTaskState::getStatesForSelect()->unshift(array(""=>null,"IS_NULL"=>"IS_NULL")))),
                            ),array("required"=>false)),  
            'equal' => new mfValidatorSchema(array(   
                          //  'category_id'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>array(""=>null,"IS_NULL"=>__('---'))+ ProjectTaskCategory::getCategoriesForSelect())),
                            'state_id'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>ProjectTaskState::getStatesForSelect()->unshift(array(""=>null,"IS_NULL"=>"IS_NULL")))),
                         //   "project_id"=>new mfValidatorChoice(array("choices"=>Project::getProjectsForSelect()->unshift(array(""=>""))->toArray(),"key"=>true,"required"=>false)),                            
                         //   "employee_id"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("--Empty--"))+ProjectTask::getEmployeesForSelect()->toArray(),"key"=>true,"required"=>false)),
                         //   "manager_id"=>new mfValidatorChoice(array("choices"=>array(""=>"","IS_NULL"=>__("--Empty--"))+ProjectTask::getManagersForSelect()->toArray(),"key"=>true,"required"=>false)),
                            ),array("required"=>false)),  
            'selection'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array('required'=>false,'empty_value'=>0)),           
            'nbitemsbypage'=>new mfValidatorChoice(array("required"=>false,"choices"=>array("5"=>"5","10"=>"10","20"=>"20","50"=>"50","100"=>"100","*"=>"*"),"key"=>true)),                    
        ));              
    }
    
    function getSelection()
    {
        return $this['selection']->getArray();
    }
}

