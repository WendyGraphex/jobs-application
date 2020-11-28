<footer class="ftco-footer ftco-bg-dark ftco-section" style="padding: 4em 0;background: rgb(162, 137, 76)">
    {*<div class="container">*}
    <div class="ConainerFooter">
        <div class="col-md-12">
            <div class="row" style="color: #fff;">
                {component name="/cms_pages/menu" node='about' tpl='about'}

                {component name="/cms_pages/menu" node='safety' tpl='safety'}

                {component name="/cms_pages/menu" node='helpcenter' tpl='helpcenter'}

                {component name="/cms_pages/menu" node='blog' tpl='blog'}

                {component name="/cms_pages/menu" node='academy' tpl='academy'}

                <div class="col-md-12 text-center">
                    {component name="/social_networks/SocialNetworksDisplay" tpl="bottom"}
                </div>            
            </div>       

            {component name="/site/copyrights" tpl="indexBottom"}

        </div>
    </div>

</footer>


{component name="/google_analytics/tag"}