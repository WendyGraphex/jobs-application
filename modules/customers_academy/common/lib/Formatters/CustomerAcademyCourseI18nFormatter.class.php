<?php


class CustomerAcademyCourseI18nFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at'));
    }
    
    function getCommittedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('committed_at'));
    }
    
     function getExpiredAt()
    {
        return new DateTimeFormatter($this->getValue()->get('expired_at'));
    }
    
      function getStartedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('started_at'));
    }
    
    function getRefusedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('refused_at'));
    }
    
     function getLanguage()
    {
        return new LanguageFormatter($this->getValue()->get('lang'));
    }
    
    
       function getPrice()
    {
        return new FloatFormatter($this->getValue()->get('price'),'USD');
    }
    
         function getTitle()
    {
        return new mfString($this->getValue()->get('title'));
    }
    
        function getShortDescription()
    {
        return new mfString($this->getValue()->get('short_description'));
    }
    
        function getContent()
    {
        return new mfString($this->getValue()->get('content'));
    }
    
    function getDuration()
    {
        return new IntegerFormatter($this->getValue()->get('duration'));
    } 
    
    
    function toArrayForEmail()
    {
        $values=$this->getValue()->toArray(array('reference','title','content','short_description'));
        $values['price']=(string)$this->getPrice()->getAmount();
        $values['teacher']=$this->getValue()->getTeacherUser()->getFormatter()->toArrayForEmail();
        return $values;
    }
}
