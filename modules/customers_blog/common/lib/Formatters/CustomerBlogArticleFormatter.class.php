<?php


class CustomerBlogArticleFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
      function getStartedAt()
    {
        return new DateFormatter($this->getValue()->get('started_at'));
    }
    
    function getExpiredAt()
    {
        return new DateFormatter($this->getValue()->get('expired_at'));
    }
    
     function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at'));
    }
    
     function getAuthor()
    {
        return new mfString($this->getValue()->get('author'));
    }
}
