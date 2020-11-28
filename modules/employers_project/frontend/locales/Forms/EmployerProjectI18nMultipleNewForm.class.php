<?php

require_once __DIR__."/EmployerProjectI18nNewForm.class.php";


class EmployerProjectI18nMultipleNewForm extends mfForm {
    
    protected $languages=null,$user=null,$project=null;
    
    function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure() {           
        $this->setValidators(array(
             'id'=>new ObjectExistsValidator('EmployerProject',array('key'=>false,'required'=>false)),  
             'budget'=>new mfValidatorI18nNumber(array('min'=>0)),   
             'name'=>new mfValidatorString()
        ));
        $this->createEmbedFormForEach('projects', 'EmployerProjectI18nNewForm', $this->getLanguages()->count());    
        $this->setProjectsI18nRequired();       
        foreach ($this->projects->getFields() as $index)                   
        {            
            if ($this->getProject()->getProjectsI18n()->hasItemByKey($index))
               continue ;
            $item= new EmployerProjectI18n();
            $this->getProject()->getProjectsI18n()->set($index,$item->add($this->defaults['projects'][$index]));               
        }
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'reorganize'))));              
    }        
    
    function reorganize($validator,$values)
    {
        if ($this->hasErrors())
            return $values;
        foreach ($this->projects->getFields() as $index)                   
        {             
            if ($this->getProject()->getProjectsI18n()->hasItemByKey($index))
            {
               $this->getProject()->getProjectsI18n()->getItemByKey($index)->add($this['projects'][$index]->getValues());          
            }
            else
            {    
                $item= new EmployerProjectI18n();
                $this->getProject()->getProjectsI18n()->set($index,$item->add($this['projects'][$index]->getValues()));               
            }             
        }          
        return $values;
    }  
           
    function setProjectsI18nRequired()
    {              
        $this->empties=new mfArray();
        foreach ($this->getDefault('projects') as $index=>$i18n)
        {         
            $empty=true;
            foreach ($i18n as $name=>$value)
            {                    
                if ($name=='lang') continue;
                if ($value)                                
                   $empty=false;          
            }   
            if ($empty)
              $this->empties[]=$index;                
        }       
        if ($this->empties->count() == $this->getLanguages()->count())
            return $this;        
        foreach ($this->empties as $index)
        {           
             foreach ($this->projects[$index]->getSchema() as $name=>$field)                     
                 $field->setOption('required',false);                         
        }           
        return $this;
    }
         
    function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }        
  
     function getProject()
    {                      
       if ($this->project===null)
       {    
          $this->project=new EmployerProject($this->getDefault('id')?$this->getDefault('id'):null,$this->getUser());
          $this->project->add($this->isValid()?$this->getValues():$this->getDefaults());
       }
       return $this->project;       
    }
}

