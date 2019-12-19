TODO: Any information in this article that is GENERIC to ECS should be moved to
the deployingADockerImageToECS article

I want to talk about how I installed and configured Huginn on AWS.

# The container definition

## Environment variables

Any UPPERCASE string in the _.env.example_ file can be overridden by passing in
an environment variable into the container with the same name.

The following environmental variables all deal with email, and are all essential
for allowing my container to send email successfully:
```
EMAIL_FROM_ADDRESS=aaronkelly@fastmail.com
SEND_EMAIL_IN_DEVELOPMENT=true
SMTP_DOMAIN=fastmail.com
SMTP_ENABLE_STARTTLS_AUTO=false
SMTP_PASSWORD=APP_SPECIFIC_PASSWORD
SMTP_PORT=465
SMTP_SERVER=smtp.fastmail.com
SMTP_USER_NAME=aaronkelly@fastmail.com
```

I was having trouble with getting the application to send email, and I could see
on the webpage for my email provider that they provided an alterntive port
number for mail clients that only supported STARTTLS, so I decided to try it:
experiment with the below variables:
```
SMTP_PORT=587
SMTP_ENABLE_STARTTLS_AUTO=TRUE
```
I also experimented with these, but they caused me problems, so I removed them:
HUGINN_DO_NOT_CREATE_DATABASE
HUGINN_DO_NOT_SEED

# Persistent storage for Fargate tasks

At the moment, there is none. By using Fargate, AWS manages a lot of the
container orchestration for you, but also restricts a lot of functionality,
including persistent storage.

It was a bit of a shock when I was finally able to finally start using the
application and begin playing around with all the cool features, however I
realised that as soon I stopped the container, I'd lost everything.

I needed to mount a persistent storage volume, and the docs at
https://registry.hub.docker.com/r/huginn/huginn told me how, but I knew it
probably wouldn't work. There are a few examples of how to link a persistent
database to the container, the easiest method being the following:
```
If you do not link a database container, a built-in mysql database will be
started. There is an exported docker volume of /var/lib/mysql to allow
persistence of that mysql database.
```

So all i need to do is link a docker volume to `/var/lib/mysql`, and my
container should live on between restarts!

Task definition -> Volumes -> Add volume: huginn_mysql
Then, Container Definition -> Mount points -> Add volumes -> huginn_mysql

If I was running this container on EC2, with these settings I should have
persistent storage.
However, because I'm running it on Fargate, the data is not persisted.

## Backup plan!

If I can't rely on my data to be persisted by Fargate, then there my options for
exfiltrating my data from a running container could be:
- examing the application for any way to save my settings to a lightweight file
- examing the application for any sign of an export db to dump file option
- ssh'ing to the running container and syncing the contents of the
`/var/lib/mysql` path to an s3 bucket... interesting. in the task definition,
along with the Huginn container, i would deploy a lightweight alpine container
that allows me to ssh to it. I'd setup both these containers to use a shared
volume mount. I'd then be able to ssh in and upload a backup to S3

# Redeploying the new task definition

It's important to always make sure that your cluster is running with the most
recent version of your task definition.

Cluster -> huginn_cluster -> Click on running service -> Update -> Revision: _select latest_

Force new deployment: *TRUE*

Wait for a new task to be provisioned, and then grab the public IP as soon as it
appears. Once the website is ready, log in and make some changes. Now you're
ready to check if these changes are being persisted to your volume by killing
the container and restarting it!

Go to your cluster -> Tasks -> select the task -> click _Stop_

Due to your service having set the desired count of containers to `1`, a new
task will be started soon. If all goes well, you should see that upon logging back in to the
container, that your data was saved successfully.




# my pubic exported scenarios

{
  "schema_version": 1,
  "name": "aaron_huginn_scenario_forExport",
  "description": "No description provided",
  "source_url": false,
  "guid": "121c823862412b2cbf4a2d32213c1808",
  "tag_fg_color": "#ffffff",
  "tag_bg_color": "#39ffa2",
  "icon": "gear",
  "exported_at": "2019-12-19T23:33:13Z",
  "agents": [
    {
      "type": "Agents::TriggerAgent",
      "name": "triggerAgent_regex_rainStorm",
      "disabled": false,
      "guid": "361ee2e955d4726b52c8b044d4f75e25",
      "options": {
        "expected_receive_period_in_days": "2",
        "rules": [
          {
            "type": "regex",
            "value": "rain|storm",
            "path": "conditions"
          }
        ],
        "message": "Just so you know, it looks like '{{conditions}}' tomorrow in {{location}}"
      },
      "keep_events_for": 0,
      "propagate_immediately": false
    },
    {
      "type": "Agents::WebsiteAgent",
      "name": "websiteAgent_ballynahinch",
      "disabled": false,
      "guid": "41dc9ecc0067ade4ddac46cedd381bec",
      "options": {
        "expected_update_period_in_days": "365",
        "url": "https://www.ballynahinch-castle.com/en/offer-groups",
        "type": "html",
        "mode": "on_change",
        "extract": {
          "offer": {
            "css": ".grid_text",
            "value": "normalize-space(.)"
          }
        }
      },
      "schedule": "every_12h",
      "keep_events_for": 0,
      "propagate_immediately": false
    },
    {
      "type": "Agents::WebsiteAgent",
      "name": "websiteAgent_xkcd",
      "disabled": false,
      "guid": "505c9bba65507c40e5786afff36f688c",
      "options": {
        "url": "https://xkcd.com",
        "mode": "on_change",
        "expected_update_period_in_days": 5,
        "extract": {
          "url": {
            "css": "#comic img",
            "value": "@src"
          },
          "title": {
            "css": "#comic img",
            "value": "@alt"
          },
          "hovertext": {
            "css": "#comic img",
            "value": "@title"
          }
        }
      },
      "schedule": "every_1d",
      "keep_events_for": 0,
      "propagate_immediately": false
    },
    {
      "type": "Agents::EmailDigestAgent",
      "name": "Afternoon Digest",
      "disabled": false,
      "guid": "65e8ae4533881537de3c346b5178b75d",
      "options": {
        "subject": "Your Afternoon Digest",
        "expected_receive_period_in_days": "7"
      },
      "schedule": "5pm",
      "propagate_immediately": false
    },
    {
      "type": "Agents::EmailAgent",
      "name": "emailAgent_aoifeAaron",
      "disabled": false,
      "guid": "7ea7cb1727f943ef59d284b145b4cbec",
      "options": {
        "subject": "{{subject}}",
        "headline": "Your notification:",
        "expected_receive_period_in_days": "2",
        "from": "aaronkelly@fastmail.com",
        "recipients": [
          "aaronkelly@fastmail.com",
          "aoifemcnickle@fastmail.com"
        ],
        "body": "https://www.ballynahinch-castle.com/en/offer-groups"
      },
      "propagate_immediately": false
    },
    {
      "type": "Agents::EmailDigestAgent",
      "name": "Morning Digest",
      "disabled": false,
      "guid": "b34eaee75d8dc67843c3bd257c213852",
      "options": {
        "subject": "Your Morning Digest",
        "expected_receive_period_in_days": "30"
      },
      "schedule": "6am",
      "propagate_immediately": false
    },
    {
      "type": "Agents::WeatherAgent",
      "name": "weatherAgent_dublin",
      "disabled": false,
      "guid": "bdae6dfdf9d01a123ddd513e695fd466",
      "options": {
        "location": "53.3497645, -6.2602732",
        "api_key": "efc61b61f9f4b91f47647304e58fcf66",
        "which_day": "1"
      },
      "schedule": "6am",
      "keep_events_for": 0
    },
    {
      "type": "Agents::EventFormattingAgent",
      "name": "eventFormattingAgent_toHugginsBot",
      "disabled": false,
      "guid": "d86b069650edadfc61db9df767c8b65c",
      "options": {
        "instructions": {
          "text": "https:{{url}}, {{message}}"
        },
        "matchers": [

        ],
        "mode": "clean"
      },
      "keep_events_for": 2592000,
      "propagate_immediately": false
    },
    {
      "type": "Agents::TelegramAgent",
      "name": "telegram_HugginsBot",
      "disabled": false,
      "guid": "e7c2a43c9f36d48aa523556846c9e71a",
      "options": {
        "auth_token": "986927660:AAESLPASBJKOHudxXZZU85YsNjxPWDulyq4",
        "chat_id": "984315325",
        "caption": "",
        "disable_notification": "",
        "disable_web_page_preview": "",
        "long_message": "",
        "parse_mode": ""
      },
      "propagate_immediately": false
    }
  ],
  "links": [
    {
      "source": 0,
      "receiver": 7
    },
    {
      "source": 1,
      "receiver": 4
    },
    {
      "source": 2,
      "receiver": 7
    },
    {
      "source": 6,
      "receiver": 0
    },
    {
      "source": 7,
      "receiver": 8
    }
  ],
  "control_links": [

  ]
}














tags: huginn, automation, aws, docker, ecs