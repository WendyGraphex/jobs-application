<?php

class PaymentEmployeeState extends mfEnumeration {
    
    const INPROGRESS='INPROGRESS', TODO='TODO', PAID='PAID', REFUSED='REFUSED', CANCELLED='CANCELLED', INPRGRESS='INPROGRESS';
      
    protected static $choices =null; 
    
}
