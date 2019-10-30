
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /home/ec2-user/src/aaronpkelly/aaronpkelly.github.io/token.txt
I wanted to explore how easy it was to create my own API using AWS. As it turns
out, it's not so bad.

My goal for these APIs is to them to be used by any other project I create,
whether it be a desktop application, phone app, or anything else. Having my own
API means I have complete control of the data that it returns, and I can
transform data from other sources and make it easily consumable.

I wanted the API to be as lightweight as possible, so I decided on using the 
following two services:
- AWS API Gateway
- AWS Lambda

# Bus timetable

I wanted to see could I create an API resource which responsed to:
- a POST request
- a JSON data payload

## AWS Lambda

I wanted a function that transformed the data returned from a bus timetable API
and returned simple arrival information, so I created the following Lambda
function using the Python 3.7 runtime, curly_transport_bus_dublin:
```
import json
import datetime
from botocore.vendored import requests

def lambda_handler(event, context):

    print("event: ", event)
    print("context: ", context)
    print("value1:", event.get("key1"))

    routeNumber = event.get("key1")

    response = route(routeNumber)

    return {
        'statusCode': 200,
        'body': response
    }

def route(routeNumber):
    # better to look this up in a parameter store or dynamodb than hardcoding it
    uri = "https://data.smartdublin.ie/cgi-bin/rtpi/realtimebusinformation?stopid=" + str(routeNumber)


    response = requests.get(uri)
    results = response.json()

    rst = {}

    for bus in results.get("results"):
        print(bus)
        # departuredatetime = bus["departuredatetime"]
        duetime = bus["duetime"]
        route = bus["route"]
        rst[duetime] = route
        # rst[arrivaldatetime] = {"route": bus["route"], "dueTime": bus["duetime"]}

    return rst
```

I created the following test event to test it:
```
{
  "key1": "2721"
}
```

Here's the full execution results:
```
Response:
{
  "statusCode": 200,
  "body": {
    "1": "25B",
    "7": "25A",
    "13": "25B",
    "17": "25A",
    "33": "25B",
    "37": "25A",
    "51": "79A",
    "53": "25B"
  }
}

Request ID:
"1e5701ea-5a64-4152-adc1-f42247e0d3e9"

Function Logs:
tetime': '26/10/2019 16:18:09', 'departureduetime': '13', 'scheduledarrivaldatetime': '26/10/2019 16:18:00', 'scheduleddeparturedatetime': '26/10/2019 16:18:00', 'destination': 'Adamstown', 'destinationlocalized': 'Baile Adaim', 'origin': 'Merrion Square', 'originlocalized': 'Cearnóg Mhuirfean', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '25B', 'sourcetimestamp': '26/10/2019 15:19:08', 'monitored': 'true'}
{'arrivaldatetime': '26/10/2019 16:22:18', 'duetime': '17', 'departuredatetime': '26/10/2019 16:22:18', 'departureduetime': '17', 'scheduledarrivaldatetime': '26/10/2019 16:22:00', 'scheduleddeparturedatetime': '26/10/2019 16:22:00', 'destination': 'Lucan S.C.', 'destinationlocalized': 'I.S. Leamhcán', 'origin': 'Merrion Square', 'originlocalized': 'Cearnóg Mhuirfean', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '25A', 'sourcetimestamp': '26/10/2019 15:22:27', 'monitored': 'true'}
{'arrivaldatetime': '26/10/2019 16:38:09', 'duetime': '33', 'departuredatetime': '26/10/2019 16:38:09', 'departureduetime': '33', 'scheduledarrivaldatetime': '26/10/2019 16:38:00', 'scheduleddeparturedatetime': '26/10/2019 16:38:00', 'destination': 'Adamstown', 'destinationlocalized': 'Baile Adaim', 'origin': 'Merrion Square', 'originlocalized': 'Cearnóg Mhuirfean', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '25B', 'sourcetimestamp': '26/10/2019 15:38:57', 'monitored': 'true'}
{'arrivaldatetime': '26/10/2019 16:42:18', 'duetime': '37', 'departuredatetime': '26/10/2019 16:42:18', 'departureduetime': '37', 'scheduledarrivaldatetime': '26/10/2019 16:42:00', 'scheduleddeparturedatetime': '26/10/2019 16:42:00', 'destination': 'Lucan S.C.', 'destinationlocalized': 'I.S. Leamhcán', 'origin': 'Merrion Square', 'originlocalized': 'Cearnóg Mhuirfean', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '25A', 'sourcetimestamp': '26/10/2019 15:43:53', 'monitored': 'true'}
{'arrivaldatetime': '26/10/2019 16:56:06', 'duetime': '51', 'departuredatetime': '26/10/2019 16:56:06', 'departureduetime': '51', 'scheduledarrivaldatetime': '26/10/2019 16:25:00', 'scheduleddeparturedatetime': '26/10/2019 16:25:00', 'destination': 'Parkwest', 'destinationlocalized': 'An Pháirc Thiar', 'origin': 'Aston Quay', 'originlocalized': 'Cé Aston', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '79A', 'sourcetimestamp': '26/10/2019 15:57:05', 'monitored': 'true'}
{'arrivaldatetime': '26/10/2019 16:56:16', 'duetime': '51', 'departuredatetime': '26/10/2019 16:56:16', 'departureduetime': '51', 'scheduledarrivaldatetime': '26/10/2019 16:56:00', 'scheduleddeparturedatetime': '26/10/2019 16:56:00', 'destination': 'Parkwest', 'destinationlocalized': 'An Pháirc Thiar', 'origin': 'Aston Quay', 'originlocalized': 'Cé Aston', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '79A', 'sourcetimestamp': '26/10/2019 15:57:05', 'monitored': 'true'}
{'arrivaldatetime': '26/10/2019 16:57:41', 'duetime': '53', 'departuredatetime': '26/10/2019 16:57:41', 'departureduetime': '53', 'scheduledarrivaldatetime': '26/10/2019 16:58:00', 'scheduleddeparturedatetime': '26/10/2019 16:58:00', 'destination': 'Adamstown', 'destinationlocalized': 'Baile Adaim', 'origin': 'Merrion Square', 'originlocalized': 'Cearnóg Mhuirfean', 'direction': 'Outbound', 'operator': 'bac', 'operatortype': '1', 'additionalinformation': '', 'lowfloorstatus': 'no', 'route': '25B', 'sourcetimestamp': '26/10/2019 15:58:44', 'monitored': 'true'}
END RequestId: 1e5701ea-5a64-4152-adc1-f42247e0d3e9
REPORT RequestId: 1e5701ea-5a64-4152-adc1-f42247e0d3e9	Duration: 661.66 ms	Billed Duration: 700 ms	Memory Size: 128 MB	Max Memory Used: 63 MB	Init Duration: 153.55 ms
```

Pretty cool. But a lambda function doesn't do anything useful by itself, it
needs to be triggered somehow. Since I'm trying to build an API, using the AWS
API Gateway is the obvious choice.

## API Gateway

I created an API which requires no authorization, so I can curl the endpoint from anywhere. Clicking on the API gateway, I was brought to the Amazon API Gateway, and I set it up as follows:

| resource | /bus |
| method | POST |

Clicking on the _POST_ method will bring you to the Method Execution page. I left everything to the defaults, except for the below changes:

Integration Request
| Integration Type | Lambda |
| Lambda Function | bus |

I think clicked Actions -> Deploy API, and the URL for contacting the API was generated.

I then tested I was able to hit the API by using the "Test" button within the Method Execution screen, and providing the following in the Request Body:
```
{
  "key1": "2721"
}
```

I got a lot of feedback, but what I really wanted was to see the _Response Body_:
```
{
  "statusCode": 200,
  "body": {
    "5": "25B",
    "11": "25A",
    "25": "79A",
    "26": "25B",
    "33": "25A",
    "46": "25B",
    "53": "25A",
    "Due": "25A"
  }
}
```

Now, could I CURL this from a command line? Yes!:
```
$ curl --data '{"key1" : "2721" }' https://itu2sxh7h1.execute-api.eu-west-1.amazonaws.com/default/curly_transport_bus_dublin
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   152  100   134  100    18    165     22 --:--:-- --:--:-- --:--:--   187{"statusCode": 200, "body": {"Due": "25B", "10": "25A", "18": "79A", "19": "25B", "26": "25A", "39": "25B", "46": "25A", "48": "79A"}}

```

# Bike 

This API resource would be slightly different in that it would respond to - a _querystring_ appended to the URL. This is something I really wanted to try also.

## Lambda function

The function looks a bit different, as the event that is passed in to the function is changed by the _Mapping Template_, which is needed when creating an API that takes querystring parameters.

curly_transport_bike_dublin:
```
import json

def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body': event['params']['querystring']['key1']
    }
```

## API Gateway

There was a bit more configuration to do here. After adding a POST method to the curly_transport_bike_dublin method, I had to make the following changes...

Method Request
| URL Query String Parameters | Add query string -> Name: key1 |

Integration Request
| Integration type | Lambda function |
| Lambda Function | curly_transport_bike_dublin |

URL Query String Parameters
| Name | key 1 |
| Mapped from | method.request.querystring.key1 |

Mapping Templates
| Request body passthrough | When there are no templates defined (recommended) |

Click Add mapping template -> Enter "application/json" -> Click create

It will open up an editor where you can define your mapping template. I just chose a pre-defined template by clicking the dropdown next to _General template_ and selecing _Method Request passthrough_. It generates the following template:
```
##  See http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html
##  This template will pass through all parameters including path, querystring, header, stage variables, and context through to the integration endpoint via the body/payload
#set($allParams = $input.params())
{
"body-json" : $input.json('$'),
"params" : {
#foreach($type in $allParams.keySet())
    #set($params = $allParams.get($type))
"$type" : {
    #foreach($paramName in $params.keySet())
    "$paramName" : "$util.escapeJavaScript($params.get($paramName))"
        #if($foreach.hasNext),#end
    #end
}
    #if($foreach.hasNext),#end
#end
},
"stage-variables" : {
#foreach($key in $stageVariables.keySet())
"$key" : "$util.escapeJavaScript($stageVariables.get($key))"
    #if($foreach.hasNext),#end
#end
},
"context" : {
    "account-id" : "$context.identity.accountId",
    "api-id" : "$context.apiId",
    "api-key" : "$context.identity.apiKey",

```

Finally, I could now test my method. Using the test button, I filled in the _Query Strings_ section with:
```
key1=42
```

It returned a successful response body:
```
{
  "statusCode": 200,
  "body": "42"
}
```

Could I CURL it? Yes I could!
```
$ curl -H "Content-Type: application/json" "https://itu2sxh7h1.execute-api.eu-west-1.amazonaws.com/default/curly_transport_bike_dublin?key1=42" --data ''
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    33  100    33    0     0    117      0 --:--:-- --:--:-- --:--:--   117{"statusCode": 200, "body": "42"}
```
