<?php


class EmployerProjectI18nFormatter extends mfFormatter {
   
    
    
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
    
     function getLanguage()
    {
        return new LanguageFormatter($this->getValue()->get('lang'));
    } 
    
      function getRefusedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('refused_at'));
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
}
