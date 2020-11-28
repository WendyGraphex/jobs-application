<?php


class employers_ajaxDeleteCompanyAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
        $messages = mfMessages::getInstance();   
        try 
        {         
//            $validator=new mfValidatorInteger();
//            $company= new EmployerCompany($validator->isValid($request->getPostParameter('Company')));
//            if ($company->isLoaded())
//            {    
//              $company->set('status','DELETE')->save();            
//              $response = array("action"=>"DeleteCompany","id" =>$company->get('id'));
//            }
            
            $item=new mfValidatorInteger();
            $id=$item->isValid($request->getPostParameter('EmployerCompany'));          
            $item= new EmployerCompany($id);           
            $item->delete();              
            $response = array("action"=>"DeleteCompany","id" =>$id,"info"=>__("Company has been deleted."));
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
