___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Atribuição last click",
  "description": "Persiste a atribuição last click com base em utm_source e utm_medium para ser enviado em eventos posteriores",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SIMPLE_TABLE",
    "name": "parameters",
    "displayName": "Origens de tráfego",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Atribuição",
        "name": "name",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "utm_source",
        "name": "utm_source",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "utm_medium",
        "name": "utm_medium",
        "type": "TEXT"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const getUrl = require('getUrl');
const getQueryParameters = require('getQueryParameters');
const queryPermission = require('queryPermission');
const localStorage = require('localStorage');

const key = 'lastClickAttribution';

var currentParameters = {
  'utm_source': getQueryParameters('utm_source') || '',
  'utm_medium': getQueryParameters('utm_medium') || '',
  'gclid': getQueryParameters('gclid') || '',
  'fbclid': getQueryParameters('fbclid') || ''
};

if (hasAnyValue(currentParameters)) {
  var lastClickAttribution = null;
  for (var item of data.parameters) {
    if (item.utm_source == currentParameters.utm_source && item.utm_medium == currentParameters.utm_medium) {
      var lastClickAttribution = item.name;
    }
  }
  if (lastClickAttribution) {
    if (queryPermission('access_local_storage', 'readwrite', key)) {
      localStorage.setItem(key,lastClickAttribution);
    }
    return lastClickAttribution;
  }
}

var currentStorageLastClick = null;
if (queryPermission('access_local_storage', 'readwrite', key)) {
  var currentStorageLastClick = localStorage.getItem(key);
}

if (currentStorageLastClick){ 
  return currentStorageLastClick;
} else {
  return 'unknown';
}

function hasAnyValue(obj) {
  for (var key in obj) {
    if (obj.hasOwnProperty(key) && obj[key] !== null && obj[key] !== undefined && obj[key] !== '') {
      return true;
    }
  }
  return false;
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_local_storage",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "lastClickAttribution"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

- Apenas pares de utm_source e utm_medium adicionados na variável serão considerados para a atribuição
- Não há tempo limite para o valor salvo


