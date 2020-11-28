<?php


class EmployerCriteriaNotationBase extends mfObject3  {
     
    protected static $fields=array('employer_user_id','criteria_id','notation','created_at','updated_at');
    const table="t_employer_criteria_notation";
    protected static $fieldsNull=array('updated_at','employer_user_id','criteria_id'); 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',  
                                        'criteria_id'=>'EmployerNotationCriteria',
                                        ); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['employer']) && $parameters['employer'] instanceof EmployerUser)
          {            
              return $this->loadByEmployer($parameters['employer']);
          }
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
        
      }   
    }
    
    protected function  loadByEmployer(EmployerUser $employer_user)
    {     
        $this->add(array(             
            'employer_user_id'=>$employer_user            
        ));       
    }
                 
     function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));        
    }     
    
     function getEmployerUser()
    {
       return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;                 
    }
    
    function create()
    {        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array(                                      
                                      'employer_user_id'=>$this->get('employer_user_id'),                                      
                                     ))
                ->setQuery("SELECT SUM(notation)/count(id) as notation,employer_criteria_id FROM ".CustomerAdvertI18nCriteriaNotation::getTable().                          
                           " WHERE ".CustomerAdvertI18nCriteriaNotation::getTableField('employer_user_id')."='{employer_user_id}'".                                   
                           " GROUP BY employer_criteria_id".
                           ";")               
                ->makeSqlQuery();     
        if (!$db->getNumRows())           
             return $this;
        $collection = new EmployerCriteriaNotationCollection();
        while ($row=$db->fetchArray())
        {
            $item=clone $this;
            $item->set('criteria_id',$row['employer_criteria_id']);
            $item->set('notation', floatval($row['notation']));
            $collection[]=$item;
        }                       
        $collection->save();
        
        // update 
        // average_notation  / number_of_notations 
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array(                                      
                                      'employer_user_id'=>$this->get('employer_user_id'),                                      
                                     ))
                ->setQuery("SELECT SUM(notation)/count(id) as notation,count(id) as number_of_notations FROM ". EmployerAdvertI18nNotation::getTable().                          
                           " WHERE ". EmployerAdvertI18nNotation::getTableField('employer_user_id')."='{employer_user_id}'".                                                             
                           ";")               
                ->makeSqlQuery();       
        $row=$db->fetchArray();     
        $this->getEmployerUser()->add(array('average_notation'=> floatval($row['notation']) * 10 , 'number_of_notations'=>$row['number_of_notations']))->save();                        
        return $this;
    }
}
