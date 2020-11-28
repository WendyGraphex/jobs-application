<?php


class tests_gpsAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
      echo __METHOD__."<br/>";
      // 607 m / 296.834° 
       // var_dump(get_gps_distance(48.860000000000,2.345851040000,10,0));
      //  $coordinates=new GPSCoordinates(new GPSCoordinate(48.858480881334735,2.3481345176696777),new GPSCoordinate(48.86093725842033,2.3407530784606934));
      //  $coordinates=new GPSCoordinates(new GPSCoordinate(48.86093725842033,2.3407530784606934),new GPSCoordinate(48.858480881334735,2.3481345176696777));
        
      /*  echo "Distance=".$coordinates->getDistance()."<br/>";
       // echo "=============================================<br/>";
        echo "Bearing=".$coordinates->getBearing()->getAngle()."<br/>";
        echo "Compass=".$coordinates->getBearing()->getCompass();*/
       // $pos=new GPSCoordinate(48.858480881334735,2.3481345176696777);
      //  var_dump($pos->getCoordinateFromDistanceAndBearing(1000,135));
        
      //  $coordinates=new GPSCoordinates($pos,$pos->getCoordinateFromDistanceAndBearing(1502,135));
        $collection=new GPSCoordinatesCollection(array(new GPSCoordinate(48.8596720000000,2.4016809000000),
                                                       new GPSCoordinate(48.8651228000000,2.3890462000000)));
     //   var_dump($coordinates->getDistance(),$coordinates->getBearing()->getAngle());
        return mfView::NONE;
        
    } 
}