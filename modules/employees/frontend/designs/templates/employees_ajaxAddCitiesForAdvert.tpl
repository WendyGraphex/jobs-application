<div class="col-md-12">
    <div class="row">
        <div class="col-md-8">
            <div class="form-group">
                <div class="errors" name="country"></div>
                {*select_country preferred=$settings->get('default_countries') selected=$user->getCountry() name="country" class="CandidateCoordinatesWantJob form-control Fields Select"*}
                <select class="form-control Fields Select">
                    <option>Maroc</option>
                    <option>Farnce</option>
                    <option>Germany</option>
                    <option>Maroc</option>
                </select>
            </div>
        </div>
    </div>
    
</div>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-4">
            <div class="custom-control custom-checkbox">
                <input name="city" value="City1" type="checkbox" class="custom-control-input" id="City1">
                <label class="custom-control-label" for="City1">{__('City1')}</label>
            </div>
        </div>
        <div class="col-md-4">
           <div class="custom-control custom-checkbox">
                <input name="city" value="City2" type="checkbox" class="custom-control-input" id="City2">
                <label class="custom-control-label" for="City2">{__('City2')}</label>
            </div>
       </div>
        <div class="col-md-4">
            <div class="custom-control custom-checkbox">
                <input name="city" value="City3" type="checkbox" class="custom-control-input" id="City3">
                <label class="custom-control-label" for="City3">{__('City3')}</label>
            </div>
       </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="custom-control custom-checkbox">
                <input name="city" value="City5" type="checkbox" class="custom-control-input" id="City5">
                <label class="custom-control-label" for="City5">{__('City5')}</label>
            </div>
        </div>
        <div class="col-md-4">
           <div class="custom-control custom-checkbox">
                <input name="city" value="City6" type="checkbox" class="custom-control-input" id="City6">
                <label class="custom-control-label" for="City6">{__('City6')}</label>
            </div>
       </div>
        <div class="col-md-4">
           <div class="custom-control custom-checkbox">
                <input name="city" value="City7" type="checkbox" class="custom-control-input" id="City7">
                <label class="custom-control-label" for="City7">{__('City7')}</label>
            </div>
       </div>
    </div>
   </div>

    <div class="col-md-12">
    <div class="col-md-8" style="margin: 0 auto;text-align: center;">
        <button id="SaveCities" type="button" class="btn btn-info" >{__('Save')}</button>
    </div>
    </div>
 <script type="text/javascript">
     
     
</script>     