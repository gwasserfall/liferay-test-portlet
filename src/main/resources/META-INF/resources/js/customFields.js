
function input(field) {

    return `
    <div class="form-group">
        <label for="${field.id}">${field.displayName}</label>
        <input type="text" class="form-control" id="${field.id}" name="${field.namespace}${field.id}" required>
        <div class="invalid-feedback">${field.displayName} is required.</div>
    </div>
    `
}

function select(field) {

    let options = []

    field.predefinedValues.forEach(option => {
        options.push(`<option value="${option}">${option}</option>`)
    });

    return `
    <div class="form-group">
        <label for="${field.id}">${field.displayName}</label>
        <select class="custom-select" name="${field.namespace}${field.id}" required>
            <option selected disabled></option>
            ${options.join("\n")}
        </select>
        <div class="invalid-feedback">${field.displayName} is required.</div>
    </div>
    `
}


function bool(field) {

    return `
        <div class="custom-control custom-switch">
            <input type="checkbox" class="custom-control-input" id="${field.id}" name="${field.namespace}${field.id}" required>
            <label class="custom-control-label" for="${field.id}">${field.displayName}</label>
        </div>
    `
}

function toggleSwitch(field) {
    return `
        <div class="form-group form-inline input-checkbox-wrapper">
            <label for="${field.id}">
                <input class="field toggle-switch" id="${field.id}" name="${field.namespace}${field.id}" onclick="" type="checkbox"  required/>
                <span class="toggle-switch-label pt-3 pb-1">${field.displayName}</span>
                <span aria-hidden="true" class="toggle-switch-bar">
                    <span class="toggle-switch-handle" data-label-off="No" data-label-on="Yes">    
                    </span>
                </span>
            </label>
        </div>`
}
