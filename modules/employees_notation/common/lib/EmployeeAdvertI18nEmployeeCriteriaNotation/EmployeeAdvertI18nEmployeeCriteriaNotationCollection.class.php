<?php

class EmployeeAdvertI18nEmployeeCriteriaNotationCollection extends CustomerAdvertI18nCriteriaNotationCollection {
        
   function create()
   {
       $this->save();
       return $this;
   }
}

