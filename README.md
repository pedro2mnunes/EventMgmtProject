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
    5. Duplicate Rule Setup. First define and activate Matching Rules and then define and activate Duplicate Rules
        - Speaker Object
            - User can not create duplicate Speaker record with the same Email & Phone
        - Attendee Object
            - User can not Create duplicate Sttendee with the same Name, Email & Phone
        - Event Organizer Objet
            - Apply the same rule as Speaker object for not to having duplicate Organizer in the System
    6. Profile, User, OWD & Role Setup
        - Profile Setup 
            - Create 3 Profiles (clone from Standard User), the names of the profiles will be Event Organizer, Event Attendee and Speaker.
        - User Setup
            - Create users for the testing purpose
        - Role Setup
            - Create Roles (Organizer, Attendee and Speaker). All roles must report to CEO.
        - Role Hierarchy
            CEO
                Organizer
                Attendee
                Speaker
        - OWD Setup -
            - Check the table for OWD below and make the changes
            Object Permission Set-up : Please provide the objects & fields level permission at the Profile level as per the table
below.
            |-------------------|---------------|---------|----------|
            | Event             | CRED          | R       | R        |
            | Object Name       | Event Manager | Speaker | Attendee |
            | Event - Organizer | CRE           | R       | R        |
            | Speaker           | CRE           | CRED    | R        |
            | Attendee          | R             | X       | CRE      |
            | Location          | CRED          | R       | RCE      |
            | Event - Speaker   | CRED          | RCE     | R        |
            | Event - Attendees | CRED          | X       | RC       |

            Note: C - Created, R - Read, E - Edit, D - Delete, X - No Access

            Organization Wide Default:
            | Object Name       | Organization Wide Default                                                   |
            |-------------------|-----------------------------------------------------------------------------|
            | Event             | Public Read Only                                                            |
            | Event - Organizer | Private & Create a Sharing Rule to share the Event with Organizers (Role)   |
            | Speaker           | Private & Create a Sharing Rule to share the Speakers with Organizers (Role)|
            | Attendee          | Private & Create a Sharing Rule to share the Attendee with Organizers (Role)|
            | Location          | Public Read Only                                                            |
            | Event - Speaker   | Public Read Only                                                            |
            | Event - Attendees | Public Read Only                                                            |
            
            Sharing Rule Setup:- As per the business requirement, we need to share every Speaker & Attendee record with Organizer
Role. For this, you need to setup 2 Sharing Rules as per the below details.
                Speaker Object - Create a Sharing Rule which will share the Speaker records with the Role Organizer. And the
permission should be Read/Edit.
                Attendee Object - Create a Sharing Rule which will share the Attendee records with the Role Organizer. And the
permission should be Read/Edit.
