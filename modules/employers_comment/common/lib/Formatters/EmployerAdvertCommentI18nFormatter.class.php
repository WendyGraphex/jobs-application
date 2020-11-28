<?php


class EmployerAdvertCommentI18nFormatter extends mfFormatter {
   
      function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getComment()
    {
        return new mfString($this->getValue()->get('message'));
    }
    
    function getLanguage()
    {
        return new LanguageFormatter($this->getValue()->get('lang'));
    }
    
    function getMessage()
    {
        return new mfString($this->getValue()->get('message'));
    }
    
    
}

