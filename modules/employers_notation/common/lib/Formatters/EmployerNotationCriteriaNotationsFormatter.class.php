<?php


class EmployerNotationCriteriaNotationsFormatter  {
   
    protected $number_of_reviews=null,$sum_of_reviews=null;
    
     function __construct($sum_of_reviews=null,$number_of_reviews=null) {
         $this->sum_of_reviews=floatval($sum_of_reviews);
         $this->number_of_reviews= floatval($number_of_reviews);
     }
    
     function getNumberOfReviews()
     {
         return $this->number_of_reviews; 
     }
   
     function getSumOfReviews()
     {
         return $this->sum_of_reviews; 
     }
     
     function getNotation()
     {        
         return new FloatFormatter($this->sum_of_reviews / $this->number_of_reviews); 
     }
     
     
     function __toString()
     {
         if ($this->sum_of_reviews)
            return (string)$this->getNotation()->getText("#.0");
         return "--";
     }
}
