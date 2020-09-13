# wups - OAUTH

UCD landed me with an email saying that they were disabling less secure apps

```
---------- Forwarded message ---------
From: UCD IT Services <itcommunicate@ucd.ie>
Date: Thu, 6 Aug 2020 at 10:05
Subject: Security Notice - Less Secure Apps and older versions of Outlook, Thunderbird or other email apps
To: IT Communicate <itcommunicate@ucd.ie>


 
Re: Security Notice - Less Secure Apps and older versions of Outlook, Thunderbird or other email apps

Dear Student,As part of our continuous security review process, UCD IT Services is turning off a setting called Less Secure Apps in Gmail for UCD users on Wednesday 12 August. Turning off this setting will help reduce the risk of hacking and data theft to your UCD email account.If you use an older version of Outlook, Thunderbird, an iOS app or a similar email client with your UCD account, you may encounter some issues accessing your UCD email after we switch off Less Secure Apps. To avoid encountering these issues, please update to the latest version of your email client or app or access your UCD email directly through Mail via UCD Connect or the Gmail app.More information and support is available on our website. Kind regards,UCD IT Services
```

This means I can't check my email with aerc/mutt. This sucks

They gave a link to [their website](https://www.ucd.ie/itservices/ourservices/emailcalendarcollaboration/email/lesssecureapps/) which says what they're moving to:

```
Other mail clients

If you are using Thunderbird or another email client, remove and re-add your Google Account and configure it to use IMAP with OAuth. 
```

IMAP with OAuth.

# Does AERC/MUTT have support?
AERC... I don't think so. No mention of OAUTH in the codebase or ticket tracker.

Mutt [has a solution](http://www.mutt.org/doc/manual/#oauth), but it depends on running external scripts to generate an OAUTH token.

NOTE: It's definitely doable to do this, but I know it's going to take hours to do and I don't want to to it right now. A project `oauth-for-mutt` has already been created in my UCDCONNECT account: https://console.developers.google.com/apis/dashboard?pli=1&project=oauth-for-mutt-286610&folder=&organizationId=

# Thunderbird it is for the moment
I was able to add a mailbox and authenticate on first try