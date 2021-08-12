<%-- 
/**
 * Copyright 2000-present Liferay, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
--%>

<%@ include file="/init.jsp" %>

<%-- 

	add a grouped input
	test serialize
	test deserialize

	test@test.com

--%>

<style>
input[type=text], select, textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
  background-color: blue;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=reset] {
  background-color:white;
  color: grey;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
  background-color: blue;
}


/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.label1 {
  background-color:grey;
  color: white;
  padding: 0.5rem;
  font-family: sans-serif;
  border-radius: 0.3rem;
  cursor: pointer;
  margin-top: 1rem;
}

#file-chosen{
  margin-left: 0.3rem;
  font-family: sans-serif;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.min.js"></script>


<div class="container">
<form>
<div class="form-group">
	<input type="file" id="actual-btn" hidden/>

 <!-- our custom upload button -->
 <label>File:</label>
 <label class="label1" for="actual-btn">Choose File</label>
 <!-- name of file chosen -->
  <span id="file-chosen">No file chosen</span>

	<br> <label for="title">Title</label>
    <input type="text" id="title" name="Title" >

	<label for="description">Description</label>
    <textarea id="description" name="description" style="height:200px"></textarea>

    <label for="tags">Tags:</label>
    <select class="form-control js-example-tokenizer" name="tags" multiple="multiple">
        <option selected='selected'>tag 1</option>
        <option value='tag2'>tag 2</option>
        <option value='tag3'>tag 3</option>
    </select>
    <br> <label for="brand">Brand</label>
    <input type="text" id="brand" name="Brand" >

    <br> <label for="channel">Channel</label>
    <select name="channel" id="channel" class="custom-select">
      <option selected>----</option>
      <option value="notAppicable">Not Appicable</option>
      <option value="other">Other</option>
      <option value="businesstoBusiness">Business to Business</option>
      <option value="convenience">Convenience</option>
      <option value="department">Department</option>
      <option value="directtoconsumer">Direct to Consumer</option>
      <option value="discount">Discount</option>
      <option value="drug">Drug</option>
      <option value="foodservice">Foodservice</option>
      <option value="generalTrade">General Trade</option>
      <option value="homeImprovement ">Home Improvement</option>
      <option value="independent">Independent</option>
      <option value="institution">Institution</option>
      <option value="online">Online</option>
      <option value="pharmacy">Pharmacy</option>
      <option value="specialty">Specialty</option>
      <option value="supermarket">Supermarket</option>
      <option value="superstore">Superstore</option>
      <option value="universityandSchool ">University and School</option>
      <option value="wholesale">Wholesale</option>
      <option value="multiple">Multiple</option>
     </select>


    <br> <label for="title">Client</label>
    <input type="text" id="title" name="Title" >
    
    <br> <label for="countryOrRegion">Country Or Region</label>
    <select name="countryOrRegion" id="countryOrRegion" class="custom-select">
      <option selected>----</option>
      <option value="global">Global</option>
      <option value="greaterAfrica">Greater Africa</option>
      <option value="middleEast">Middle East South Asia</option>
      <option value="asiaPacific">Asia Pacific</option>
      <option value="ksa">KSA</option>
      <option value="latinAmerica">Latin America</option>
      <option value="mesa">MESA</option>
      <option value="northAmerica">North America</option>
      <option value="europe">Europe</option>
      <option>----</option>
      <option value="Angola">Angola</option>
      <option value="australia">Australia</option>
      <option value="botswana">Botswana </option>
      <option value="brazil">Brazil</option>
      <option value="ksa">KSA</option>
      <option value="cambodia">Cambodia</option>
      <option value="china">China</option>
      <option value="eswatini">Eswatini</option>
      <option value="ethiopia">Ethiopia</option>
      <option value="germany">Germany</option>
      <option value="hongKong">Hong Kong</option>
      <option value="india">India</option>
      <option value="indonesia">indonesia</option>
      <option value="kenya">Kenya</option>
      <option value="malawi">Malawi</option>
      <option value="malaysia">Malaysia</option>
      <option value="mauritius">Mauritius</option>
      <option value="morocco">Morocco</option>
      <option value="mozambique">Mozambique</option>
      <option value="myanmar">Myanmar</option>
      <option value="netherlands">Netherlands</option>
      <option value="pakistan">Pakistan</option>
      <option value="portugal">Portugal</option>
      <option value="singapore">Singapore</option>
      <option value="southAfrica">South Africa</option>
      <option value="northAmerica">Taiwan</option>
      <option value="tanzania">Tanzania</option>
      <option value="thailand">Thailand</option>
      <option value="uae">UAE</option>
      <option value="uk">UK</option>
      <option value="usa">USA</option>
      <option value="vietnam">Vietnam</option>
      <option value="zambia">Zambia</option>
      <option value="zimbabwe">Zimbabwe</option>
    </select>
    
    <br> <label for="documentType">Document Type</label>
    <select name="documentType" id="documentType" class="custom-select">
      <option selected>----</option>
      <option value="brandAssets">Brand Assets</option>
      <option value="briefandQualify ">Brief and Qualify</option>
      <option value="caseStudy">Case Study</option>
      <option value="companyProfiles">Company Profiles</option>
      <option value="costingandNegotiation">Costing and Negotiation</option>
      <option value="credential">Credential</option>
      <option value="educationMaterial">Education Material</option>
      <option value="learningandDevelopment">Learning and Development</option>
      <option value="learnings">Learnings</option>
      <option value="legalandCompliance">Legal and Compliance</option>
      <option value="marketingCollateral">Marketing Collateral</option>
      <option value="operations">Operations</option>
      <option value="People">People</option>
      <option value="proposal">Proposal</option>
      <option value="salesCollateral">Sales Collateral</option>
      <option value="salesSupport ">Sales Support </option>
      <option value="serviceProfiles">Service Profiles</option>
      <option value="technologyandData">Technology and Data</option>
      <option value="valueProposition">Value Proposition</option>
   </select>

    <br> <label for="industry">Industry</label>
    <select name="industry" id="industry" class="custom-select">
      <option selected>----</option>
      <option value="notApplicable">Not Applicable</option>
      <option value="adultBeverages">Adult Beverages</option>
       <option value="caseStudy">Case Study</option>
      <option value="automotive">Automotive</option>
      <option value="consumerpackagedgoods">Consumer Packaged Goods </option>
      <option value="durableGoods">Durable Goods</option>
      <option value="entertainment">Entertainment</option>
      <option value="amusementRecreation">Amusement & Recreation</option>
      <option value="apparelFootwearAccesories">Apparel, Footwear & Accesories</option>
      <option value="artscrafts">Arts & Crafts</option>
      <option value="automotive">Automotive</option>
      <option value="baby">Baby</option>
      <option value="bakery">Bakery</option>
      <option value="banking">Banking</option>
      <option value="beverages ">Beverages</option>
      <option value="builderConstruction">Builder, Construction, Real Estate</option>
      <option value="candyConfections">Candy & Confections</option>
      <option value="ceTechnologyTelco">CE, Technology & Telco</option>
      <option value="chemicalsIngredients">Chemicals & Flavor Ingredients</option>
      <option value="commercialGrade">Commercial-Grade Supplies</option>
      <option value="consumerElectronics">Consumer Electronics</option>
      <option value="consumerPackagedGoods">Consumer Packaged Goods</option>
      <option value="cruiseLines">Cruise Lines</option>
      <option value="dairy">Dairy/Dairy Alternatives</option>
      <option value="dealership">Dealership</option>
      <option value="deli">Deli</option>
      <option value="distributor">Distributor</option>
      <option value="durableGoods">Durable Goods</option>
      <option value="education">Education</option>
      <option value="entertainment">Entertainment</option>
      <option value="broadcastingStreaming">Entertainment, Broadcasting, Streaming Services</option>
      <option value="fastCasual">Fast Casual</option>
     <option value="fitness">Fitness</option>
      <option value="foodservice">Foodservice</option>
      <option value="fresh">Fresh (Meat, Meat Alternatives, Poultry, Seafood, Eggs)</option>
      
      <option value="frozenFoods">Frozen Foods</option>
      <option value="gaming">Gaming</option>
      <option value="governmentAgencye">Government Agency</option>
      <option value="healthWellness">Health & Wellness</option>
      <option value="healthBeauty">Health, Beauty, Personal Care</option>
      <option value="healthcare">Healthcare</option>
      <option value="homeAppliances ">Home Appliances</option>
      <option value="homeFurnishings">Home Furnishings & Residential Construction Goods</option>
      <option value="hotels">Hotels & Lodging</option>
      <option value="householdProducts">Household Products</option>
      <option value="housewares">Housewares</option>
      <option value="industrialEquipment">Industrial Equipment</option>
      <option value="insurance">Insurance</option>
      <option value="investment">Investment</option>
      <option value="lawnGarden">Lawn, Garden, Pest Control Products</option>
      <option value="legalConsulting">Legal/Consulting</option>
      <option value="motorcycles">Motorcycles & Off-Roading Vehicles</option>
      <option value="nonProfit">Non-Profit Organization</option>
      <option value="oem">OEM (Original Equipment Manufacturer)</option>
      <option value="officeSupplies">Office Supplies, Stationary, Greeting Cards</option>
      <option value="pantry ">Pantry (Dry Goods, Cans, Pasta, Spices, Baking)</option>
      <option value="petCare">Pet Care </option>
      <option value="veterinaryServices">Pet Care/Veterinary Services</option>
      <option value="pharmaceuticals">Pharmaceuticals (RX or OTC)</option>
      <option value="privateEquity">Private Equity/Holding Co.</option>
      <option value="produce">Produce</option>
      <option value="professionalServices">Professional Services </option>
      <option value="publishingMedia">Publishing & Media</option>
      <option value="qsr">QSR</option>
      <option value="rentalCars">Rental Cars</option>
      <option value="restaurantBars">Restaurant & Bars</option>
      <option value="retail">Retail</option>
      <option value="retailPetrol">Retail : Petrol Forecourt Stations</option>
      <option value="retailBaby">Retail: Baby/Children</option>
      <option value="retailBeauty">Retail: Beauty</option>
      <option value="retailClub">Retail: Club</option>
      <option value="retailConsumer">Retail: Consumer Electronics</option>
      <option value="retailConvenience">Retail: Convenience</option>
      <option value="retailDepartment">Retail: Department</option>
      <option value="retailDollar">Retail: Dollar/Value</option>

      <option value="retailDrug">Retail: Drug</option>
      <option value="retailCommerce">Retail: E-Commerce</option>
      <option value="retailFashion">Retail: Fashion & Apparel</option>
      <option value="retailGrocery">Retail: Grocery</option>
      <option value="retailHealth">Retail: Health, Supplements, etc.</option>
      <option value="retailHispanic">Retail: Hispanic Grocery</option>
      <option value="retailHomeGoods">Retail: Home Goods</option>
      <option value="retailHomeImprovement">Retail: Home Improvement</option>
      <option value="retailMass">Retail: Mass</option>
      <option value="retailMilitary">Retail: Military</option>
      <option value="retailNatural">Retail: Natural Specialty</option>
      <option value="retailOffice">Retail: Office</option>
      <option value="retailPet">Retail: Pet</option>
      <option value="retailSpecialty">Retail: Specialty</option>
      <option value="retailSporting">Retail: Sporting Goods & Active Lifestyle</option>
      <option value="retailWholesaler">Retail: Wholesaler</option>
      <option value="retailWholesalenot">Retail: Wholesaler (not Club)</option>
      <option value="retailWine">Retail: Wine & Liquor</option>
      <option value="snackingShelf">Snacking & Shelf Stable Breakfast</option>
      <option value="sportsRecreationGoods">Sports & Recreation Goods</option>
      <option value="technology">Technology</option>
      <option value="telecommunications">Telecommunications</option>
      <option value="tobaccoRegulated">Tobacco & Regulated</option>
      <option value="tools">Tools, Lawn & Garden Equipment</option>
      <option value="toys">Toys</option>
      <option value="travelLeisure">Travel & Leisure</option>
      <option value="travelServices">Travel Services</option>
      <option value="utilities">Utilities</option>
      <option value="vitamins">Vitamins & Supplements</option>
      <option value="Wholesaler">Wholesaler</option>
    </select>

    <br> <label for="partner">Partner</label>
    <input type="text" id="partner" name="Partner" >

    <br> <label for="relevantYear">Relevant Year</label>
    <select name="relevantYear" id="relevantYear" class="custom-select">
      <option selected>Custom Select Menu</option>
      <option value="volvo">Volvo</option>
      <option value="fiat">Fiat</option>
      <option value="audi">Audi</option>
    </select>

    <br> <label for="securityAccess">Security Access</label>
    <select name="securityAccess" id="securityAccess" class="custom-select">
      <option selected>Custom Select Menu</option>
      <option value="volvo">Volvo</option>
      <option value="fiat">Fiat</option>
      <option value="audi">Audi</option>
    </select>

    <br> <label for="service">Service</label>
    <select name="service" id="service" class="custom-select">
      <option selected>Custom Select Menu</option>
      <option value="volvo">Volvo</option>
      <option value="fiat">Fiat</option>
      <option value="audi">Audi</option>
    </select>

  <input type="submit" value="Publish">
  <input type="reset" value="Cancel">

</div>
</form>
</div>
<script>
    $(function(){
  $('.js-example-tokenizer').select2({
    tags: true,
    tokenSeparators: [',', ' ']
  })

});


const actualBtn = document.getElementById('actual-btn');

const fileChosen = document.getElementById('file-chosen');

actualBtn.addEventListener('change', function(){
  fileChosen.textContent = this.files[0].name
})



</script>





