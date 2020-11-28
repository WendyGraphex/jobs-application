<?php


class CustomerCourseCategoryFormatter extends mfFormatter {
   
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getNumberOfWorks()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_works'));
    }
    
    function getNumberOfJobs()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_jobs'));
    }
}
