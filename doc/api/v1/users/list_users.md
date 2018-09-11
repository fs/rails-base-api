# Users API

## List Users

### GET /v1/users
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjA5NzMsInN1YiI6MTU5fQ.KA9xlyNJj2dw0lt4WQKv1GllLL0UAJu8xWCNjZbPkPs</pre>

#### Route

<pre>GET /v1/users</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjA5NzMsInN1YiI6MTU5fQ.KA9xlyNJj2dw0lt4WQKv1GllLL0UAJu8xWCNjZbPkPs&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "156",
      "type": "users",
      "attributes": {
        "email": "user5@example.com",
        "full_name": "Wayne Breitenberg"
      }
    },
    {
      "id": "157",
      "type": "users",
      "attributes": {
        "email": "user6@example.com",
        "full_name": "Valentine Bailey"
      }
    },
    {
      "id": "158",
      "type": "users",
      "attributes": {
        "email": "user7@example.com",
        "full_name": "Miss Leon Schulist"
      }
    },
    {
      "id": "159",
      "type": "users",
      "attributes": {
        "email": "user8@example.com",
        "full_name": "Arlen Rice"
      }
    }
  ]
}</pre>
