<?php

class utils_jpgraph_ajaxPdfAction extends mfAction{
    
    
    
    public function execute(\mfWebRequest $request) {
        $time= microtime();
        $donnees= array(25,55,12,10,12,44,58,14,9);
        $hauteur=300;
        $largeur=350;
        $this->graph1=new jpgraphs($largeur,$hauteur);
        $histo= new LinePlot($donnees);
        $this->graph1->SetScale("textlin");
        $this->graph1->Add($histo);
        $this->graph1->title->set("Graph du test ...");
        $this->mpdf=new pdf();

        $this->mpdf->SetDisplayMode('fullpage');
        $html='<h3 align="center">PDF Graph</h3>'
                . '<img src="data:image/png;base64,'.$this->graph1->StrokeBase64().'"/>';

        $this->mpdf->WriteHTML($html);
    
        //$this->mpdf->Image("data:image/png;base64,".$this->graph1->StrokeBase64(),50,50,100,100,'png','',true, true);
       $this->mpdf->Output();
       file_put_contents(__DIR__."/mpdfTime.txt", microtime()-$time." ms");

       exit;
        
    }

}

