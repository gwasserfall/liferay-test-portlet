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

<portlet:resourceURL id="/cerebra/upload" var="uploadURL" />
<portlet:resourceURL id="/cerebra/fields" var="fieldsURL" />
<portlet:resourceURL id="/cerebra/folders" var="foldersURL" />


<style>

</style>

<div class="container p-2 bg-light shadow border">

<form id="cerebra-form" class="was-validated">

      <div class="card">
        <h5 class="card-header bg-primary text-light" style="background-color: #005883 !important;">Upload to Cerebra</h5>
        <div class="card-body" id="scrollTo">

            <div class="row">
              <div class="col-lg-6">
                <div class="form-group input-text-wrapper">
                  <label class="control-label" for="file">Choose a File</label>
                  <input class="field form-control" id="file" name="<portlet:namespace/>file" type="file" required>
                  <div class="invalid-feedback">Select a file to upload.</div>
                </div>
              </div>
              <div class="col-lg-6">

                <div class="form-group form-inline input-checkbox-wrapper">
                  <label for="published">
                      <input class="field toggle-switch" id="published" name="<portlet:namespace/>published" value="0" type="checkbox"/>
                      <span class="toggle-switch-label pt-3 pb-1">Published</span>
                      <span aria-hidden="true" class="toggle-switch-bar">
                          <span class="toggle-switch-handle" data-label-off="No" data-label-on="Yes"></span>
                      </span>
                  </label>
                </div>
              </div>
            </div>
      
            <div class="row">
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="title">Title</label>
                  <input type="text" class="form-control" id="title" name="<portlet:namespace/>title" required>
                  <div class="invalid-feedback">A document title is required.</div>
                </div>
              </div>

              <!-- <div class="col-lg-6">
                <label for="document_type">Document Type</label>
                <select class="custom-select" id="document_type" name="<portlet:namespace/>document_type" required>
                    <option selected disabled></option>
                </select>
                <div class="invalid-feedback">Document type is required, please select one from the list.</div>
              </div> -->

              <div class="col-lg-6">
                <label for="document_type">Cerebra Folder</label>
                <select class="custom-select" id="cerebra_folder" name="<portlet:namespace/>cerebra_folder" required>
                    <option selected disabled></option>
                </select>
                <div class="invalid-feedback">Cerebra folder is required, please select one from the list.</div>
              </div>


            </div>
      
            <div class="form-group">
              <label for="description">Tags</label>
              <textarea class="form-control customLook" id="cf_Additional_Tags" name="cf_Additional_Tags" type="text" data-role="tagsinput" value="">
              <div class="pl-1 form-text">Use <kbd class="px-1">Tab</kbd> or <kbd class="px-1">,</kbd> to add a new tag</div>
            </div>
        </div>
      </div>


      <div class="card">
        <h5 class="card-header bg-primary text-light" style="background-color: #005883 !important;">Meta Data</h5>
        <div class="card-body">

          <div id="loading" class="loading-animation"></div>
          <div id="custom-fields-container"></div>
          
        </div>
      </div>

    <div class="buttons px-3 py-1">
      <!-- <input style="background-color: #005883 !important;" class="btn btn-primary" type="submit" value="Upload"> -->

      <button id="submit-button" style="background-color: #005883 !important;" class="btn btn-primary" type="submit">
        Upload
      </button>

      <input class="btn btn-danger" type="reset" value="Cancel">
    </div>

</form>



</div>


<script>



function renderCustomFields (fields) {
  // js/customFields.js holds the rendered HTML structure

  const fieldMap = {
    "input-field" : input,
    "boolean" : toggleSwitch,
    "checkbox" : toggleSwitch,
    "radio" : toggleSwitch,
    "selection-list" : select
  }

  const fieldsToSkip = ["Cerebra Folder", "Additional Tags", "A Cerebra File", "Published"]

  let container = document.getElementById("custom-fields-container");

  fields.forEach(field => {

    // Set required to string "required"
    field.required = (field.required === "true") ? "required" : "";

    // Set namespace on custom field
    field.namespace = "<portlet:namespace/>";

    // Skip fields that require custom markup
    if (!fieldsToSkip.includes(field.displayName)) {
      container.innerHTML += fieldMap[field.type](field)
    }
  });
}

let i = document.querySelector('#cf_Additional_Tags')
    let tagify = new Tagify( i, {
      originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
    });

AUI().ready(function (){

    let loadingAnimation = document.getElementById("loading")

    function populateFolders () {

      AUI().use('aui-io-request', function(A){
          A.io.request('<%= foldersURL %>', {
            method: 'get',
            on: {
                  success: function() {
                      let data = JSON.parse(this.get('responseData'));
                      let select = document.getElementById("cerebra_folder");

                      data.forEach(folder => {
                          select.add(new Option(folder.name, folder.id))
                      })
                  }
              }
          });
      });

    }



    AUI().use('aui-io-request', function(A){
        A.io.request('<%= fieldsURL %>', {
           method: 'get',
           on: {
                success: function() {
                  let data = JSON.parse(this.get('responseData'));
                  renderCustomFields(data);
                  populateFolders();
                  loadingAnimation.style.display = "none";
                }
            }
        });
    });

    let fm = document.getElementById("cerebra-form");
    let file = document.getElementById("file")

    file.onchange = function (event) {
      
      let title = document.getElementById("title")

      title.value = ""

      if (event.target.files.length > 0) {
        title.value = event.target.files[0].name
      }
    }

    fm.addEventListener("submit", function(event) {

        event.preventDefault()


        let submitButton = document.getElementById("submit-button");

        submitButton.disabled = true
        submitButton.innerHTML = `
          <span class="inline-item inline-item-before">
            <span aria-hidden="true" class="loading-animation"></span> </span
          >Uploading
        `

        console.log("submitting form");

        let fm = event.target
        let formData = new FormData(fm);

        let tags = tagify.value.map(tag => tag.value);

        formData.set("<portlet:namespace/>cf_Additional_Tags", tags.join(","))
        
        $.ajax({
            url: "<%= uploadURL %>",
            type: 'POST',
            data: formData,
            contentType : false,
            processData: false,
            success: function(response) {
                // console.log(JSON.parse(response));
                document.getElementById("scrollTo").scrollIntoView({ behavior: 'smooth', block: 'center' });
                submitButton.disabled = false
                submitButton.innerHTML = `Upload`
                fm.reset()
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
                submitButton.disabled = false
                submitButton.innerHTML = `Upload`
            }
        });

        return false;
    })
})





</script>
