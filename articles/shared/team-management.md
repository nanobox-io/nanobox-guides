# Team Management

Access control is an important, yes challenging aspect of application management. It often involves the sharing of SSH keys, role definitions and logic, access lists, etc. Nanobox simplifies team management into a simple process managed in your app dashboard.

## Adding a Team Member
To add a team member, create an invitation for them to join the app. This is done under Admin > Team Members in your app dashboard. Enter their email address and select the [role](#roles-permissions) in which you'd like them to work on the app.

![Adding a Team Member](/assets/shared/team-app-invite.png)

**Note:** *In order for a team member to be added, they must already have a Nanobox account.*

Once submitted, an invitation to join the app will be sent to the provided email address. The recipient will need to accept the invitation before they'll be added to the app.

## Removing a Team Member
To remove a team member from your app, simply click the "X" on the right of the user in your team members list. Only users with the role of "Owner" can remove team members.

## Roles & Permissions

| App Management               | Developer | Owner    |
|:-----------------------------|:---------:|:--------:|
| Deploy                       | &#9989;   | &#9989;  |
| Console Access               | &#9989;   | &#9989;  |
| Manage Environment Variables | &#9989;   | &#9989;  |
| Manage SSL                   | &#9989;   | &#9989;  |
| Manage Timezone              | &#9989;   | &#9989;  |
| Change the App Name          | &#9989;   | &#9989;  |
| Delete the App               | &#9989;   | &#9989;  |

| Team Management              | Developer | Owner    |
|:-----------------------------|:---------:|:--------:|
| Add Team Members             | &#10060;  | &#9989;  |
| Remove Team Members          | &#10060;  | &#9989;  |

| Billing                      | Developer | Owner    |
|:-----------------------------|:---------:|:--------:|
| Change App Plan              | &#10060;  | &#9989;  |
| Manage Payment Method        | &#10060;  | &#9989;  |
