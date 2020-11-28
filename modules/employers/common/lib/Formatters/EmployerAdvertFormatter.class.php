<?php


class EmployerAdvertFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     function getNumberOfLanguages()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_languages',0));
    } 
    
      function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at'));
    }
    
      function getRefusedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('refused_at'));
    }
    
     function getNumberOfDocuments()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_documents'));
    } 
    
     function getNumberOfCategories()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_categories'));
    } 
    
     function getCommittedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('committed_at'));
    }
    
     function getBudget()
    {
        return new FloatFormatter($this->getValue()->get('budget'),'USD');
    }
    
     function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['employer']= $this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
        $values['advert_i18n_list']=$this->getValue()->getPublishedAdvertsI18n()->toArrayForEmail();
        return $values;  
    }
}
