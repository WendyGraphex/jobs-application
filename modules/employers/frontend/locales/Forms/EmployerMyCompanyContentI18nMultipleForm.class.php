<?php

require_once __DIR__."/EmployerCompanyContentI18nMultipleForm.class.php"; 

class EmployerMyCompanyContentI18nMultipleForm extends mfForm {
        
    protected $user=null;
    
     function __construct(EmployerUser $user,$defaults=array())
    {                                
        $this->user=$user;
        parent::__construct($defaults);
    } 
    
    function getUser()
    {
        return $this->user;
    }
                   
    function configure() {
          $this->createEmbedFormForEach('contents', 'EmployerCompanyContentI18nMultipleForm', $this->getLanguages()->count());           
          foreach ($this->contents->getFields() as $index)                   
        {                    
            if ($this->getCompany()->getContents()->hasItemByKey($index))
               continue ;
            $item= new EmployerCompanyContentI18n();            
            $this->getCompany()->getContents()->set($index,$item->add($this->defaults['contents'][$index]));               
        }           
    }         
    
    
     function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }
    
    function isValid()
    {
        if (!parent::isValid())
            return false;
        $content=new EmployerCompanyContent($this->getUser()->getCompany());
        $content->save();        
        foreach ($this->contents->getFields() as $index)
        {             
             if ($this->getCompany()->getContents()->getItemByKey($index)->isNotLoaded())
                $this->getCompany()->getContents()->getItemByKey($index)->set('content_id',$content);
             $this->getCompany()->getContents()->getItemByKey($index)->add($this['contents'][$index]->getValue());     
        }   
        $this->getCompany()->getContents()->save();        
        return true;
    }
    
     function getCompany()
    {                  
         return $this->getUser()->getCompany();
    }
    
    
}
