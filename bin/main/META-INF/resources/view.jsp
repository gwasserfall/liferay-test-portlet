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
      <option value="angola">Angola</option>
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

    <br> <label for="primaryService">Primary Service</label>
    <select name="primaryService" id="primaryService" class="custom-select">
      <option selected>Custom Select Menu</option>
      <option selected>----</option>
      <option value="notAppicable">Not Appicable</option>
      <option value="fieldSales">Field Sales & Merchandising</option>
      <option value="retailOperations">Retail Operations</option>
      <option value="eCommerce">E-Commerce </option>
      <option value="headquarterSales">Headquarter Sales</option>
      <option value="brandDevelopment">Brand Development & Design</option>
      <option value="consumerShopper">Consumer & Shopper Marketing</option>
      <option value="digitalMarketing ">Digital Marketing & Media</option>
      <option value="experientialMarketing">Experiential Marketing</option>
      <option value="channelCategory">Channel & Category Strategy</option>
      <option value="dataStrategy">Data Strategy & Development</option>
      <option value="businessIntelligence">Business Intelligence & Insights</option>
      <option value="retailOptimization">Retail Optimization</option>
      <option value="intelligentContent">Intelligent Content Syndication</option>
      <option value="logisticsProduction">Logistics & Production</option>
      <option value="experienceManagement">Experience Management</option>
      <option value="talentAcquisition">Talent Acquisition </option>
      <option value="learningDevelopment">Learning & Development</option>
      <option value="employeeEngagement">Employee Engagement</option>
      <option value="businessprocess">Business process outsourcing</option>
      </select>

    <br> <label for="relevantYear">Relevant Year</label>
    <select name="relevantYear" id="relevantYear" class="custom-select">
      <option selected>----</option>
      <option value="2010">2010</option>
      <option value="2011">2011</option>
      <option value="2012">2012</option>
      <option value="2013">2013</option>
      <option value="2014">2014</option>
      <option value="2015">2015</option>
      <option value="2016">2016</option>
      <option value="2017">2017</option>
      <option value="2018">2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023">2023</option>
      <option value="2024">2024</option>
      <option value="2025">2025</option>
      
    </select>

    <br> <label for="securityAccess">Security Access</label>
    <select name="securityAccess" id="securityAccess" class="custom-select">
      <option selected>----</option>
      <option value="global">Global</option>
      <option value="africa">Africa</option>
      <option value="southafrica">South Africa</option>
      <option value="middleEast">Middle East South Asia</option>
      <option value="asiaPacific">Asia Pacific</option>
      <option value="latinAmerica">Latin America</option>
      <option value="northAmerica">North America</option>
      <option value="europe">Europe</option>
      <option>---------</option>
      <option value="albania">Albania</option>
      <option value="algeria">Algeria</option>
      <option value="andorra">Andorra</option>
      <option value="angola">Angola</option>
      <option value="antigua">Antigua and Barbuda</option>
      <option value="argentina">Argentina</option>
      <option value="armenia">Armenia</option>
      <option value="australia">Australia</option>
      <option value="austria">Austria</option>
      <option value="azerbaijan">Azerbaijan</option>
      <option value="bahamas">Bahamas</option>
      <option value="bahrain">Bahrain</option>
      <option value="bangladesh">Bangladesh</option>
      <option value="barbados">Barbados</option>
      <option value="belarus">Belarus</option>
      <option value="belgium">Belgium</option>
      <option value="benin">Benin</option>
      <option value="belize">Belize</option>
      <option value="bhutan">Bhutan</option>
      <option value="bolivia">Bolivia</option>
      <option value="bosnia ">Bosnia and Herzegovina</option>
      <option value="botswana">Botswana </option>
      <option value="brazil">Brazil</option>
      <option value="brunei">Brunei</option>
      <option value="bulgaria">Bulgaria</option>
      <option value="burkina">Burkina Faso</option>
      <option value="burundi">Burundi</option>
      <option value="cote">Côte d'Ivoire</option>
      <option value="cabo">Cabo Verde</option>
      <option value="cambodia">Cambodia</option>
      <option value="cameroon">Cameroon</option>
      <option value="canada">Canada</option>
      <option value="centralAfrican">Central African Republic</option>
      <option value="cambodia">Cambodia</option>
      <option value="chad">Chad</option>
      <option value="chile">Chile</option>
      <option value="china">China</option>
      <option value="colombia">Colombia</option>
      <option value="comoros">Comoros</option>
      <option value="congo">Congo (Congo-Brazzaville)</option>
      <option value="costaRica">Costa Rica</option>
      <option value="croatia">Croatia</option>
      <option value="cuba">Cuba</option>
      <option value="cyprus">Cyprus</option>
      <option value="czechia">Czechia (Czech Republic)</option>
      <option value="drc">Democratic Republic of the Congo</option>
      <option value="denmark">Denmark</option>
      <option value="djibouti">Djibouti</option>
      <option value="dominica">Dominica</option>
      <option value="dominicanRepublic">Dominican Republic</option>
      <option value="ecuador">Ecuador</option>
      <option value="egypt">Egypt</option>
      <option value="elSalvador">El Salvador</option>
      <option value="equatorialGuinea">Equatorial Guinea</option>
      <option value="eritrea">Eritrea</option>
      <option value="estonia">Estonia</option>
      <option value="eswatini">Eswatini (fmr. "Swaziland")</option>
      <option value="ethiopia">Ethiopia</option>
      <option value="fiji">Fiji</option>
      <option value="finland">Finland</option>
      <option value="france">France</option>
      <option value="gabon">Gabon</option>
      <option value="gambia">Gambia</option>
      <option value="georgia">Georgia</option>
      <option value="germany">Germany</option>
      <option value="ghana">Ghana</option>
      <option value="greece">Greece</option>
      <option value="grenada">Grenada</option>
      <option value="guatemala">Guatemala</option>
      <option value="guinea">Guinea</option>
      <option value="guineaBissau">Guinea-Bissau</option>
      <option value="guyana">Guyana</option>
      <option value="guatemala">Guatemala</option>
      <option value="haiti">Haiti</option>
      <option value="holySee">Holy See</option>
      <option value="honduras">Honduras</option>
      <option value="hungary">Hungary</option>
      <option value="iceland">Iceland</option>
      <option value="india">India</option>
      <option value="indonesia">indonesia</option>
      <option value="iran">Iran</option>
      <option value="iraq">Iraq</option>
      <option value="ireland">Ireland</option>
      <option value="israel">Israel</option>
      <option value="italy">Italy</option>
      <option value="jamaica">Jamaica</option>
      <option value="japan">Japan</option>
      <option value="jordan">Jordan</option>
      <option value="kazakhstan">Kazakhstan</option>
      <option value="kenya">Kenya</option>
      <option value="kiribati">Kiribati</option>
      <option value="kuwait">Kuwait</option>
      <option value="kyrgyzstan">Kyrgyzstan</option>
      <option value="laos">Laos</option>
      <option value="latvia">Latvia</option>
      <option value="lebanon">Lebanon</option>
      <option value="lesotho">Lesotho</option>
      <option value="liberia">Liberia</option>
      <option value="libya">Libya</option>
      <option value="liechtenstein">Liechtenstein</option>
      <option value="lithuania">Lithuania</option>
      <option value="luxembourg">Luxembourg</option>
      <option value="madagascar">Madagascar</option>
      <option value="malawi">Malawi</option>
      <option value="malaysia">Malaysia</option>
      <option value="maldives">Maldives</option>
      <option value="mali">Mali</option>
      <option value="marshall ">Marshall Islands</option>
      <option value="mauritania">Mauritania</option>
      <option value="mauritius">Mauritius</option>
      <option value="Mexico">Mexico</option>
      <option value="micronesia">Micronesia</option>
      <option value="moldova">Moldova</option>
      <option value="monaco">Monaco</option>
      <option value="mongolia">Mongolia</option>
      <option value="montenegro">Montenegro</option>
      <option value="morocco">Morocco</option>
      <option value="mozambique">Mozambique</option>
      <option value="myanmar">Myanmar (formerly Burma)</option>


      <option value="namibia">Namibia</option>
      <option value="nauru">Nauru</option>
      <option value="nepal">Nepal</option>
      <option value="netherlands">Netherlands</option>
      <option value="newZealand">New Zealand</option>
      <option value="nicaragua">Nicaragua</option>
      <option value="niger">Niger</option>
      <option value="nigeria">Nigeria</option>
      <option value="northKorea">North Korea </option>
      <option value="northMacedonia">North Macedonia</option>
      <option value="norway">Norway</option>
      <option value="oman">Oman</option>
      <option value="pakistan">Pakistan</option>
      <option value="palau">Palau</option>
      <option value="palestineState">Palestine State</option>
      <option value="panama">Panama</option>
      <option value="papuaNewGuinea ">Papua New Guinea</option>
      <option value="paraguay">Paraguay</option>
      <option value="peru">Peru</option>
      <option value="philippines">Philippines</option>
      <option value="poland">Poland</option>
      <option value="portugal">Portugal</option>
      <option value="qatar">Qatar</option>
      <option value="romania">Romania</option>
      <option value="russia">Russia</option>
      <option value="rwanda">Rwanda</option>
      <option value="saintKitts">Saint Kitts and Nevis </option>
      <option value="saintLucia">Saint Lucia</option>
      <option value="saintVincent ">Saint Vincent and the Grenadines</option>
      <option value="samoa">Samoa</option>
      <option value="sanMarino">San Marino </option>
      <option value="saoTome">Sao Tome and Principe</option>
      <option value="saudiArabia">Saudi Arabia </option>
      <option value="senegal">Senegal</option>
      <option value="serbia">Serbia</option>
      <option value="seychelles">Seychelles</option>
      <option value="sierraLeone">Sierra Leone</option>
      <option value="singapore">Singapore</option>
      <option value="slovakia">Slovakia</option>
      <option value="slovenia">Slovenia</option>
      <option value="solomonIslands">Solomon Islands</option> 
      <option value="somalia">Somalia</option>
      <option value="southKorea">South Korea</option>
      <option value="southSudan">South Sudan</option>
      <option value="spain">Spain</option>
      <option value="sriLanka">Sri Lanka</option>
      <option value="sudan">Sudan</option>
      <option value="suriname">Suriname</option>
      <option value="sweden">Sweden</option>
      <option value="switzerland">Switzerland</option>
      <option value="syria">Syria</option>
      <option value="tajikistan">Tajikistan</option>
      <option value="northAmerica">Taiwan</option>
      <option value="tanzania">Tanzania</option>
      <option value="thailand">Thailand</option>
      <option value="timorLeste">Timor-Leste</option>
      <option value="togo">Togo</option>
      <option value="tonga">Tonga</option>
      <option value="trinidad">Trinidad and Tobago</option>
      <option value="tunisia">Tunisia</option>
      <option value="turkey">Turkey</option>
      <option value="turkmenistan">Turkmenistan</option>
      <option value="tuvalu">Tuvalu</option>
      <option value="uganda">Uganda</option>
      <option value="sweden">Sweden</option>
      <option value="uganda">Uganda</option>
      <option value="sweden">Ukraine</option> 
      <option value="uae">United Arab Emirates</option>
      <option value="uk">United Kingdom</option>
      <option value="usa">United States of America</option>
      <option value="uruguay">Uruguay</option>
      <option value="uzbekistan">Uzbekistan</option> 
      <option value="vanuatuden">Vanuatu</option>
      <option value="venezuela">Venezuela</option> 
      <option value="vietnam">Vietnam</option>
      <option value="yemen">Yemen</option> 
      <option value="zambia">Zambia</option>
      <option value="zimbabwe">Zimbabwe</option>
          
    </select>

    <br> <label for="service">Service</label>
    <select name="service" id="service" class="custom-select">
      <option selected>----</option>
      <option value="notApplicable">Not Applicable - Other</option>
      <option value="brandDevelopmentDesign">Brand Development & Design</option>
      <option value="brandDevelopmentPOS">Brand Development & Design - POS Execution</option>
      <option value="businessIntelligenceInsights">Business Intelligence & Insights</option>
      <option value="businessIntelligenceAnalytics">Business Intelligence & Insights - Analytics</option>
      <option value="businessIntelligenceBusiness">Business Intelligence & Insights - Business Insights</option>
      <option value="businessIntelligenceBusinessMobility">Business Intelligence & Insights - Mobility</option>
      <option value="businessIntelligenceBusinessresearch">Business Intelligence & Insights - Research</option>
      <option value="businessProcessOutsourcing">Business Process Outsourcing</option>
      <option value="businessProcessBPO">Business Process Outsourcing - BPO</option>
      <option value="businessProcessCIC">Business Process Outsourcing - CIC</option>
      <option value="channelCategoryStrategy">Channel & Category Strategy</option>
      <option value="channelCategoryMarketing">Channel & Category Strategy - Marketing Strategy</option>
      <option value="channelCategoryRoute">Channel & Category Strategy - Route To Market </option>
      <option value="consumerShopperMarketing">Consumer & Shopper Marketing</option>
      <option value="consumerShopperActivations">Consumer & Shopper Marketing - Activations</option>
      <option value="consumerShopperAlternative">Consumer & Shopper Marketing - Alternative Sampling</option>
      <option value="consumerShopperBrand">Consumer & Shopper Marketing - Brand Ambassador</option>
      <option value="consumerShopperInfluencer">Consumer & Shopper Marketing - Influencer Marketing</option>
      <option value="consumerShopperShopper">Consumer & Shopper Marketing - Shopper Engagement</option>
      <option value="dataStrategyDevelopment">Data Strategy & Development - Data Strategy & Development</option>
      <option value="digitalMarketing">Digital Marketing & Media- Digital Marketing</option>
      <option value="digitalMedia">Digital Marketing & Media - Media Management</option>
      <option value="eCommerce1P">E-Commerce - 1P</option>
      <option value="eCommerce1P">E-Commerce - 3P</option>
      <option value="eCommerce1P">E-Commerce -1P/3P</option>
      <option value="employeeEngagement">Employee Engagement - Employee Engagement</option>
      <option value="experienceAuditing">Experience Management - Auditing</option>
      <option value="experienceCompliance">Experience Management - Compliance </option>
      <option value="experienceMystery">Experience Management - Mystery Shoppe</option>
      <option value="experientialMarketing">Experiential Marketing</option>
      <option value="experientialAssisted">Experiential Marketing - Assisted Selling</option>
      <option value="experientialATL">Experiential Marketing - ATL Creative</option>
      
      <option value="experientialBrand">Experiential Marketing - Brand Experiential</option>
      <option value="experientialRetail">Experiential Marketing - Retail Experiential</option>
      <option value="fieldSales">Field Sales & Merchandising</option>
      <option value="fieldSalesAlternative">Field Sales & Merchandising - Alternative Sales</option>
      <option value="fieldSaleB2B">Field Sales & Merchandising - B2B Sales</option>
      <option value="fieldSaleDistribution">Field Sales & Merchandising - Distribution</option>
      <option value="fieldSaleField">Field Sales & Merchandising - Field Sales</option>
      <option value="fieldSaleKey">Field Sales & Merchandising - Key Account Management</option>
      <option value="fieldSaleMerchandising">Field Sales & Merchandising - Merchandising</option>
      <option value="fieldSaleSurge">Field Sales & Merchandising - Surge Merchandising</option>
      <option value="headquarterSales">Headquarter Sales</option>
      <option value="headquarterTelesales">Headquarter Sales - Telesales</option>
      <option value="intelligentContent">Intelligent Content Syndication</option>
      <option value="intelligentContentData">Intelligent Content Syndication - Data Aggregation and Syndication</option>
      <option value="l_d">Learning & Development - L&D</option>
      <option value="logisiticsProduction">Logisitics & Production </option>
      <option value="logisiticsDistribution">Logisitics & Production - Distribution</option>
      <option value="logisiticsGEM">Logisitics & Production - GEM</option>
      <option value="logisiticsInstallations">Logisitics & Production - Installations</option>
      <option value="logisitics">Logisitics & Production - Logistics</option>
      <option value="logisiticsPOS">Logisitics & Production - POS, Logistics</option>
      <option value="logisiticsReverse">Logisitics & Production - Reverse Logistics</option>
      <option value="logisiticsWarehousing">Logisitics & Production - Warehousing</option>
      <option value="retailOperations">Retail Operations - Retail Operations</option>
      <option value="retailShop">Retail Operations - Shop Management</option>
      <option value="retailOptimization">Retail Optimization</option>
      <option value="retailOptimizationImage">Retail Optimization - Image Recognition</option>
      <option value="retailOptimizationRobotics">Retail Optimization - Robotics</option>
      <option value="retailOptimizationSupply">Retail Optimization - Supply Chain </option>
      <option value="talentAcquisition">Talent Acquisition</option>
      <option value="talentAcquisitionRecruitment">Talent Acquisition - Recruitment</option>
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





