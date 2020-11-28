<?php

/*
 * https://www.project55.net/facebook/oauth/callback/employee/want-a-job
 * http://www.project55.net/facebook/oauth/callback/employee/want-a-job
 * TODO
 * - FacebookPicture                          OK
 * - Test de connection => callbackError      Presque
 * - email                                    OK
 * - picture                                  OK
 * - customer uploadAvatarFromUrl             OK
 */

class facebook_oauth_callbackEmployeeWantAJobAction extends mfAction
{

    function execute(mfWebRequest $request)
    {      
        $_SERVER['HTTPS']=1;
        $_SERVER['HTTP_SSL_HTTPS']=1;        
        $messages = mfMessages::getInstance();                               
        //  echo "<pre>";  var_dump($_SESSION); die(__METHOD__);             
        try 
        {             
            
                $fb=new FacebookOauth(new FacebookOauthSettings());  
                           
                $accessToken = $fb->getRedirectLoginHelper()->getAccessToken($fb->getEmployeeWantAJobUrlCallBack());                   
                if (!$accessToken) 
                    throw new mfException(__('Error auth'));          
                $fb->setDefaultAccessToken($accessToken);                                                   
                
                $employee = new Employee($fb->getUser()->getEmail());
                $employee->add(array(
                    'firstname'=>$fb->getUser()->getFirstName(),                       
                    'lastname'=>$fb->getUser()->getLastName(),  
                    'is_locked'=>'NO'
                ))->validate();
               
                $this->getUser()->getStorage()->write('want_a_job_employee_user',$employee);      
               
                $employee->uploadAvatarFromUrl(new FacebookPicture($fb->getUser()->getPicture()));                  
                $this->getUser()->getStorage()->write('want_a_job_employee_user',$employee);                                                                     
                $this->getUser()->getStorage()->write('want_a_job_employee_user_callback',true);         
            }             
            catch (Exception $e) {     
                 // $messages->addError($e);       
                   //   echo "<!-- ".$e->getMessage()." -->";
            }
            $this->redirect("/");            
    }

}


