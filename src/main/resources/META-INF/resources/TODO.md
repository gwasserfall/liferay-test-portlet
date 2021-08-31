## Stage 1

OnPortletLoad:

    1. Ajax Request to /cerebra/fields to get fieldData
        1.1. (Java) Get ExpandoColumn rows for DLFileEntry Model
        1.2. Sanatize and populate field response
    2. Dynamic form creation
    3. Add required field validation (frontend validation)

## Stage 2

OnFormSubmit:

    1. Validation
        1.1. File exists
        1.2. File extention is valid (Can't upload EXE)
        1.3. Required fields filled
        1.4. Possibly Permission Check

    2. Take the temp file and add it to the correct folder.
        Find the correct folder ID in folder heierarchy <-- ?

        If that works, then you need to apply the custom fields to
        the new file.


