<?php


 
class utils_jpgraph_ExportSinglePdfAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {  
        $time= microtime();
                
      try 
      {                 
          $pdf=new SinglePdf();
          if ($request->getGetParameter('debug')=='true')
              $pdf->output();
          else
              $pdf->forceOutput();       
      } 
      catch (mfException $e) {
         echo $e->getMessage();
      } 
      file_put_contents(__DIR__."/html2pdfTime.txt", microtime()-$time." ms");
      die();
    }
}

