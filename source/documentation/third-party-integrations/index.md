---
title: Third Party Integrations
---
# Third Party Integrations
## Github
With Github integration you will be able to list, clone and initialise your Poco projects directly from Github without additional steps.  
Add your Github account to your Poco configuration:
```
$:~ poco github add <name> <accessToken>
```
`<name>` - Poco repo name, for example 'github'.  
`<accessToken>` - GitHub access token [How to create GitHub Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).  

List your GitHub projects:
```
$:~ poco catalog <name>
```
`<name>` from example 'github'.

Run your project:
```
$:~ poco up <project name>
```
`<project name>` - Poco project name

## Gitlab
With GitLab integration you will be able to list, clone and initialise your Poco projects directly from GitLab without additional steps.
Add your GitLab account to your Poco configuration:
```
$:~ poco gitlab add <name> <personalAccessToken>
```
`<name>` - Poco repo name, for example 'gitlab'.  
`<personalAccessToken>` - GitLab personal access token [How to create Gitlab Personal Access Token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html).

List your GitLab projects:
```
$:~ poco catalog <name>
```
`<name>` from example 'gitlab'.

Run your project:
```
$:~ poco up <project name>
```
`<project name>` - Poco project name
