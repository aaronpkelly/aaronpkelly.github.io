
Table of Contents
=================

   * [Indexing all sharepoint documents using Sharepoint's REST API](#indexing-all-sharepoint-documents-using-sharepoints-rest-api)
      * [Graph explorer](#graph-explorer)
         * [Drive queries](#drive-queries)
         * [Sharepoint queries](#sharepoint-queries)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)




# Indexing all sharepoint documents using Sharepoint's REST API

I don't like the default Sharepoint search experience, and I was wondering how
I could get an index of ALL documents on Sharepoint...:

- getting access to the DB (probably not)
- using MS Graph to query Sharepoint's API (maybe yes)

## Graph explorer

This tool can be used to generate and try out sample queries. It's here,
the samples and  API docs are provided on this page also:
https://developer.microsoft.com/en-us/graph/graph-explorer#

### Drive queries

List all files in a drive:
https://graph.microsoft.com/v1.0/me/drive/root/children

The response must have a `file` key in order to be retrieved and downloaded as a
file, e.g.:
```
{
    "@microsoft.graph.downloadUrl": "https://fineos-my.sharepoint.com/personal/kellya_fineos_com/_layouts/15/download.aspx?UniqueId=9a562fc0-1317-42d6-b43e-dc3ec1a0e708&Translate=false&tempauth=eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvZmluZW9zLW15LnNoYXJlcG9pbnQuY29tQDg3MWQ4ZDRmLWMxM2MtNDM4Yy05M2Y2LTY0ZDIyMTkzN2Y1ZSIsImlzcyI6IjAwMDAwMDAzLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMCIsIm5iZiI6IjE1ODAyMDYyNTMiLCJleHAiOiIxNTgwMjA5ODUzIiwiZW5kcG9pbnR1cmwiOiJRQy9pVWg5VWhqQ3BZdkdWRVpVRlJlZW0rUTNOancrb3I4U1N6YVgwdnVRPSIsImVuZHBvaW50dXJsTGVuZ3RoIjoiMTQ3IiwiaXNsb29wYmFjayI6IlRydWUiLCJjaWQiOiJPV0UzTmpKa1lURXRNVGcyTlMwME1ESTVMVGszTXpJdE9XRXdNVEEyWVRFeFpqazUiLCJ2ZXIiOiJoYXNoZWRwcm9vZnRva2VuIiwic2l0ZWlkIjoiTVRBMFlqSXlNV0V0WmpNM01pMDBZVGRrTFRneU5qSXROV0kxTVROaVpHTmtNMk0zIiwiYXBwX2Rpc3BsYXluYW1lIjoiR3JhcGggZXhwbG9yZXIiLCJnaXZlbl9uYW1lIjoiQWFyb24iLCJmYW1pbHlfbmFtZSI6IktlbGx5Iiwic2lnbmluX3N0YXRlIjoiW1wia21zaVwiXSIsImFwcGlkIjoiZGU4YmM4YjUtZDlmOS00OGIxLWE4YWQtYjc0OGRhNzI1MDY0IiwidGlkIjoiODcxZDhkNGYtYzEzYy00MzhjLTkzZjYtNjRkMjIxOTM3ZjVlIiwidXBuIjoia2VsbHlhQGZpbmVvcy5jb20iLCJwdWlkIjoiMTAwMzAwMDBBNThGRjFCNSIsImNhY2hla2V5IjoiMGguZnxtZW1iZXJzaGlwfDEwMDMwMDAwYTU4ZmYxYjVAbGl2ZS5jb20iLCJzY3AiOiJteWZpbGVzLnJlYWQgYWxsZmlsZXMucmVhZCBteWZpbGVzLndyaXRlIGFsbGZpbGVzLndyaXRlIGFsbHNpdGVzLm1hbmFnZSBhbGxzaXRlcy5yZWFkIGFsbHNpdGVzLndyaXRlIGFsbHByb2ZpbGVzLnJlYWQiLCJ0dCI6IjIiLCJ1c2VQZXJzaXN0ZW50Q29va2llIjpudWxsfQ.a2lUaUdOSFNYdWdmU1dnUS9SZ0ViYi9LdXlvOFJFNkxzRjhGQklBVkZ5Yz0&ApiVersion=2.0",
    "createdDateTime": "2019-08-28T15:43:15Z",
    "eTag": "\"{9A562FC0-1317-42D6-B43E-DC3EC1A0E708},2\"",
    "id": "016B27RJ6AF5LJUFYT2ZBLIPW4H3A2BZYI",
    "lastModifiedDateTime": "2019-08-28T15:43:15Z",
    "name": "rant_ps-pi_developerExperience.txt",
    "webUrl": "https://fineos-my.sharepoint.com/personal/kellya_fineos_com/Documents/rant_ps-pi_developerExperience.txt",
    "cTag": "\"c:{9A562FC0-1317-42D6-B43E-DC3EC1A0E708},2\"",
    "size": 2543,
    "createdBy": {
        "user": {
            "email": "Aaron.Kelly@FINEOS.com",
            "id": "8866616c-f460-4b9b-809d-e26734b6122f",
            "displayName": "Aaron Kelly"
        }
    },
    "lastModifiedBy": {
        "user": {
            "email": "Aaron.Kelly@FINEOS.com",
            "id": "8866616c-f460-4b9b-809d-e26734b6122f",
            "displayName": "Aaron Kelly"
        }
    },
    "parentReference": {
        "driveId": "b!GiJLEHLzfUqCYltRO9zTxxi-qqNR4KZEgPmwSpdvdrPWh6WbKIJwTKfHHPtA13Zy",
        "driveType": "business",
        "id": "016B27RJ56Y2GOVW7725BZO354PWSELRRZ",
        "path": "/drive/root:"
    },
    "file": {
        "mimeType": "text/plain",
        "hashes": {
            "quickXorHash": "GVJuMzwWE7i0+11DS2+t04EJ/dM="
        }
    },
    "fileSystemInfo": {
        "createdDateTime": "2019-08-28T15:43:15Z",
        "lastModifiedDateTime": "2019-08-28T15:43:15Z"
    }
}
```

Get a file (using the `id` from above):
https://graph.microsoft.com/v1.0/me/drive/items/016B27RJ6AF5LJUFYT2ZBLIPW4H3A2BZYI/

Download a file:
https://graph.microsoft.com/v1.0/me/drive/items/016B27RJ6AF5LJUFYT2ZBLIPW4H3A2BZYI/content

### Sharepoint queries

