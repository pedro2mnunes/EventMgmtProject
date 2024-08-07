## Salesforce Admin
    - Objects & Relationships
    - Validation Rules
    - Sharing Rules, OWD & Roles
    - Community
## Salesforce Development
    - Apex Trigger
    - Apex Batch Apex
    - Future Method
    - Integration ( Both Apex REST & REST API )
    - Lightning Web Component - This Covers most of the lightning web component including
        - Events
        - Custom Lookup
        - Calling Apex in bot wire & imperative apex
        - Using Web Component in Community
        - Navigation & Toast Events etc.
    - Reusable Error Handling Framework

    Unmanaged Package Link - [https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0o000003FQoP](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t0o000003FQoP)

## Tasks 
    1. Install unnmanaged package with required objects and fields
    2. Create new application.
    3. Create custom theme.
    4. Validation Rule Setup
        - Validation Rule on *Event* Object
            - If Recurring? checkbox is checked then user must need to fill Frequency field & If checkbox is unchecked then User can not select Frequency field.
            - If Virtual is Selected as Value for Event Type field then Prevent User to Select Location on Event Record.
            - End Date/Time must be at-least 1 day ahead of Start Date/Time (If there is a value in End Date/Time field)
            - If Event Type field value is In-Person then user must need to select Location on Event Record.
            - Event Date cannot be in the past.
        - Validation Rule on *Event Attendee* Object
            - Attendee can only be associated with the Event whose End Date is in future & Event Live Checkbox is checked and Event is accepting the Attendees (means Remaining Seats field value is not 0)
        - Validation Rule on *Event Speaker* Object
            - Speaker can only be associated with the Event whose End Date is in future & Event Live Checkbox is checked
    5. Duplicate Rule Setup. First define Matching Rules and then define Duplicate Rules
        - Speaker Object
            - User can not create duplicate speaker record with the same Email & Phone
        - Attendee Object
            - User can not Create duplicate attendee with the Same Name, Email & Phone
        - Event Organizer Objet
            - Apply the same rule as Speaker object for not to having duplicate Organizer in the System
