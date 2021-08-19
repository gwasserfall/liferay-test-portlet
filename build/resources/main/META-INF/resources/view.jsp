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
  
  :required:focus {
  box-shadow: 0  0 6px rgba(255,0,0,0.5);
  border: 1px red solid;
  outline: 0;
}

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

<portlet:resourceURL id="/cerebra/upload" var="uploadURL" />
<portlet:resourceURL id="/cerebra/fields" var="fieldsURL" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.min.js"></script>




<liferay-ui:panel collapsible="true" defaultState="collapsed" extended="true" title="<h3 class='ml-3'>Debug Information</h3>">
    <div class="test py-4">
<pre id="debug">

uploadURL = <%= uploadURL %>
filedsURL = <%= fieldsURL %>
</pre>
    </div>
</liferay-ui:panel>


<div class="container">

<form id="cerebra-form">
 <div class="form-group">
	<input type="file" name="file" id="actual-btn" hidden/>

     <!-- our custom upload button -->
     <label>File:</label>
     <label class="label1" for="actual-btn">Choose File</label>
     <!-- name of file chosen -->
      <span id="file-chosen">No file chosen</span>

	<br> <label for="title">Title</label>
    <input type="text" id="title" name="Title" required>

	<label for="description">Description</label>
    <textarea id="description" name="description" style="height:200px"></textarea>

    <label for="tags">Tags:</label>
    <select class="form-control js-example-tokenizer" name="tags" multiple="multiple" required>
        <option selected value="Test">Test</option>
    </select>

    <br> <label for="brand">Brand</label>
    <input type="text" id="brand" name="Brand" required>

    
    <br> <label for="channel">Channel</label>
    <select class="form-control js-example-basic-single" name="channel" id="channel" class="custom-select" required>
      <option value="">---------</option>
      
      </select>


    <br> <label for="title">Client</label>
    <input type="text" id="client" name="client" required> 
    
    <br> <label for="countryOrRegion">Country Or Region</label>
    <select name="countryOrRegion" id="countryOrRegion" class="custom-select" required>
      <option value="">---------</option>
    </select>
    
    <br> <label for="documentType">Document Type</label>
    <select name="documentType" id="documentType" class="custom-select" required>
      <option value="">---------</option>
   </select>

    <br> <label for="industry">Industry</label>
    <select name="industry" id="industry" class="custom-select" required>
      <option selected value="Test">Test</option>
    </select>

    <br> <label for="partner">Partner</label>
    <input type="text" id="partner" name="Partner">

    <br> <label for="primaryService">Primary Service</label>
    <select name="primaryService" id="primaryService" class="custom-select" required>
      <option value="Test">Test</option>
      </select>

    <br> <label for="relevantYear">Relevant Year</label>
    <select name="relevantYear" id="relevantYear" class="custom-select" required>
      <option value="1960">1960</option>
      
    </select>

    <br> <label for="securityAccess">Security Access</label>
    <select name="securityAccess" id="securityAccess" class="custom-select" required>
      <option value="">---------</option>

          
    </select>

    <br> <label for="service">Service</label>
    <select name="service" id="service" class="custom-select" required>
      <option value="">---------</option>
      <option value="notApplicable">Not Applicable - Other</option>
    </select>

  <input type="submit" value="Publish">
  <input type="reset" value="Cancel">

 </div>
</form>
</div>
<script>

  

AUI().ready(function (){

    let debugPre = document.getElementById("debug")


    console.log("Portlet is Ready")

    AUI().use('aui-io-request', function(A){
        A.io.request('<%= fieldsURL %>', {
           method: 'get',
           on: {
                success: function() {
                    console.log(this.get('responseData'));
                }
            }
        });
    });


    let fm = document.getElementById("cerebra-form");

    fm.onsubmit = function(event) {
        event.preventDefault()

        let fm = document.getElementById("cerebra-form");
        let formData = new FormData(fm);

        let tags = $(".js-example-tokenizer").val()
        formData.set("tags", tags.join(","))

        $.ajax({
            url: "<%= uploadURL %>",
            type: 'POST',
            data: formData,
            contentType : false,
            processData: false,
            success: function(response) {
                console.log(JSON.parse(response));
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });
    }


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




    let mock = Mock()
    
    console.log(mock.retrieveFields())
    
    for(var i = 0;i<mock.retrieveFields().length; i++)
    {
      if(mock.retrieveFields()[i].id=="channel")
      {
        var strChannelOptions = ""
        var strlength =  mock.retrieveFields()[i].predefinedValues.length
        console.log(length)
        var strPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var k =0; k<mock.retrieveFields()[i].predefinedValues.length; k++)
        {
          strChannelOptions += '<option value="'+mock.retrieveFields()[i].predefinedValues[k]+'">'+mock.retrieveFields()[i].predefinedValues[k]+'</option>'

        }
        document.getElementById("channel").innerHTML=strChannelOptions

     

      }

      if(mock.retrieveFields()[i].id=="country_or_region")
      {
        var strcountryOptions = ""
        var strcountryPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var m =0; m<strcountryPredefinedValues.length; m++)
        {
          strcountryOptions += '<option value="'+strcountryPredefinedValues[m]+'">'+strcountryPredefinedValues[m]+'</option>'

        }
        document.getElementById("countryOrRegion").innerHTML=strcountryOptions

      } 

      if(mock.retrieveFields()[i].id=="document_type")
      {
        var strdocumentOptions = ""
        var strdocumentPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var n =0; n<strdocumentPredefinedValues.length; n++)
        {
          strdocumentOptions += '<option value="'+strdocumentPredefinedValues[n]+'">'+strdocumentPredefinedValues[n]+'</option>'

        }
        document.getElementById("documentType").innerHTML=strdocumentOptions

      } 

      if(mock.retrieveFields()[i].id=="industry")
      {
        var strIndustryOptions = ""
        var strIndustryPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var p =0; p<strIndustryPredefinedValues.length; p++)
        {
          strIndustryOptions += '<option value="'+strIndustryPredefinedValues[p]+'">'+strIndustryPredefinedValues[p]+'</option>'

        }
        document.getElementById("industry").innerHTML=strChannelOptions

      } 

      if(mock.retrieveFields()[i].id=="primary_service")
      {
        var strPrimaryOptions = ""
        var strPrimaryPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var o =0; o<strPrimaryPredefinedValues.length; o++)
        {
          strPrimaryOptions += '<option value="'+strPrimaryPredefinedValues[o]+'">'+strPrimaryPredefinedValues[o]+'</option>'

        }
        document.getElementById("primaryService").innerHTML=strPrimaryOptions

      } 

      if(mock.retrieveFields()[i].id=="relevant_year")
      {
        var strRelevantOptions = ""
        var strRelevantPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var o =0; o<strRelevantPredefinedValues.length; o++)
        {
          strRelevantOptions += '<option value="'+strRelevantPredefinedValues[o]+'">'+strRelevantPredefinedValues[o]+'</option>'

        }
        document.getElementById("relevantYear").innerHTML=strRelevantOptions

      } 

      if(mock.retrieveFields()[i].id=="security_access")
      {
        var strSecurityOptions = ""
        var strSecurityPredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var x =0; x<strSecurityPredefinedValues.length; x++)
        {
          strSecurityOptions += '<option value="'+strSecurityPredefinedValues[x]+'">'+strSecurityPredefinedValues[x]+'</option>'

        }
        document.getElementById("securityAccess").innerHTML=strSecurityOptions

      } 

      if(mock.retrieveFields()[i].id=="service")
      {
        var strServiceOptions = ""
        var strServicePredefinedValues = mock.retrieveFields()[i].predefinedValues
        console.log(strPredefinedValues)

        for(var j =0; j<strServicePredefinedValues.length; j++)
        {
          strServiceOptions += '<option value="'+strServicePredefinedValues[j]+'">'+strServicePredefinedValues[j]+'</option>'

        }
        document.getElementById("service").innerHTML=strServiceOptions

      }  
 
      
    } 
    console.log(mock.uploadDocumentSuccess())
    console.log(mock.uploadDocumentValidationFailure())
    console.log(mock.uploadDocumentServerFailure())

})





</script>





