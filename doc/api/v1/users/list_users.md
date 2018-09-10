# Users API

## List Users

### GET /v1/users
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY2Njg4MjMsInN1YiI6MjA0fQ.jNbuAOt54xUm0PFUDbASg1F8rdMc9p9qhnTfQDkhHyg</pre>

#### Route

<pre>GET /v1/users</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user-requests&quot;,&quot;attributes&quot;:{&quot;full-name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY2Njg4MjMsInN1YiI6MjA0fQ.jNbuAOt54xUm0PFUDbASg1F8rdMc9p9qhnTfQDkhHyg&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "201",
      "type": "users",
      "attributes": {
        "email": "user7@example.com",
        "full-name": "Launa Leuschke Jr."
      }
    },
    {
      "id": "202",
      "type": "users",
      "attributes": {
        "email": "user8@example.com",
        "full-name": "Miss Renae Nienow"
      }
    },
    {
      "id": "203",
      "type": "users",
      "attributes": {
        "email": "user9@example.com",
        "full-name": "Anthony Kassulke"
      }
    },
    {
      "id": "204",
      "type": "users",
      "attributes": {
        "email": "user10@example.com",
        "full-name": "Quentin Okuneva"
      }
    }
  ]
}</pre>
