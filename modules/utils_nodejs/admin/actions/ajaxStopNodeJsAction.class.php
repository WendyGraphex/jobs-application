<?php


class utils_nodejs_ajaxStopNodeJsAction extends mfAction  {


    
    public function execute(mfWebRequest $request) {
        $messages= mfMessages::getInstance();
        try {
            $node=new UtilsNodeJsSettings();
            $return= $node->stop();            
            if($return)
                $response = array("action"=>"Stop","info"=>__('Server has been stopped.'));
            else
                $messages->addError(__("problem with server or it's already stopped."));
                
        } catch (Exception $ex) {
            $messages->addError($ex);
        }
        
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}
