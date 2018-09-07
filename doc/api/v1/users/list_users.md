# Users API

## List Users

### GET /v1/users
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY0MzYzNjEsInN1YiI6MTV9.l3UZHbKGxQUugSTqjDV3finM1WFP33yRqwiLDfuW4aM</pre>

#### Route

<pre>GET /v1/users</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user-requests&quot;,&quot;attributes&quot;:{&quot;full-name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY0MzYzNjEsInN1YiI6MTV9.l3UZHbKGxQUugSTqjDV3finM1WFP33yRqwiLDfuW4aM&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "12",
      "type": "users",
      "attributes": {
        "email": "user7@example.com",
        "full-name": "Lesia Quigley"
      }
    },
    {
      "id": "13",
      "type": "users",
      "attributes": {
        "email": "user8@example.com",
        "full-name": "Maricruz Carroll"
      }
    },
    {
      "id": "14",
      "type": "users",
      "attributes": {
        "email": "user9@example.com",
        "full-name": "Margot Kuhlman"
      }
    },
    {
      "id": "15",
      "type": "users",
      "attributes": {
        "email": "user10@example.com",
        "full-name": "Roman Tillman III"
      }
    }
  ]
}</pre>
