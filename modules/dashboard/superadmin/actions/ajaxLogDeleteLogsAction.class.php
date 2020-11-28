<?php

class dashboard_ajaxLogDeleteLogsAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
        if (!$request->isXmlHttpRequest())
          return mfView::NONE;
        $messages=mfMessages::getInstance();
        try 
        {
           $selection=new mfValidatorLogFiles(count($request->getPostParameter('selection')));
           $selection=new logFileCollection($selection->isValid($request->getPostParameter('selection')));
           $selection->delete();
           $response=array("action"=>"deleteLogs",
                           "selection"=>$request->getPostParameter('selection'),
                           "info"=>__("selection has been deleted.")
                          );
        } 
        catch (mfValidatorErrorSchema $e)
        {
            $messages->addErrors($e->getErrors());
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
        
    }
	
}

