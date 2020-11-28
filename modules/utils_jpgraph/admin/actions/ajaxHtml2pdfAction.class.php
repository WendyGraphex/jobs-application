<?php


class utils_jpgraph_ajaxHtml2pdfAction extends mfAction {
    //put your code here
    public function execute(\mfWebRequest $request) {
        
        $donnees= array(25,55,12,10,12,44,58,14,9);
        $hauteur=300;
        $largeur=350;
        $this->graph1=new jpgraphs($largeur,$hauteur);
        $histo= new LinePlot($donnees);
        $this->graph1->SetScale("textlin");
        $this->graph1->Add($histo);
        $this->graph1->title->set("Graph du test ...");
        try {
         $this->pdf=new htmlpdf('P','A4','fr');
        $this->pdf->pdf->SetDisplayMode('fullpage');
        $html='<h3 align="center">PDF Graph</h3><br>'
                . '<p align="center"><img  src="data:image/png;base64,'.$this->graph1->StrokeBase64().'"/></p>';

        $this->pdf->WriteHTML($html);
        $this->pdf->Output('graph.pdf');
        } catch (HTML2PDF_exception $ex) {
            
        }
            die();
    }

}
