<?php


class cmsPagesEvents {
   
    static function getSitemap(mfEvent $event)
    {
        $sitemap=$event->getSubject();
        $pages=CmsPageI18nUtils::getSitemap();
        foreach ($pages as $page)
        {
            $sitemap[]=new GoogleSitemapUrl(array(
                "loc"=>$page->getURL(),
                "lastmod"=>$page->get('updated_at'),
                "changefreq"=>CmsPageSettings::load()->get('site_map_changefreq',"weekly"),
                "priority"=>CmsPageSettings::load()->get('site_map_priority',0.8),
            ));
        }         
    }
    
}
