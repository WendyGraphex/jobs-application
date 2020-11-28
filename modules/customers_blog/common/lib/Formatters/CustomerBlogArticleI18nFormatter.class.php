<?php


class CustomerBlogArticleI18nFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     function getMetaTitle()
    {
        return new mfString($this->getValue()->get('meta_title'));
    }
    
    function getMetaDescription()
    {
        return new mfString($this->getValue()->get('meta_description'));
    }
    
    function getDescription()
    {
        return new mfString($this->getValue()->get('description'));
    }
    
     function getContent()
    {
        return new mfString($this->getValue()->get('content'));
    }
    
    function getNumberOfViews()
    {
        return new IntegerFormatter($this->getValue()->getNumberOfViews());
    }
}
