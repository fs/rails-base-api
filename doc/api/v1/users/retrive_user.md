# Users API

## Retrive User

### GET /v1/users/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | user id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTc1fQ.DSxpLhyzDiN4nlSW2ikMxIZyIcBUA4au93HT18Ka9WA</pre>

#### Route

<pre>GET /v1/users/174</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users/174&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTc1fQ.DSxpLhyzDiN4nlSW2ikMxIZyIcBUA4au93HT18Ka9WA&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "174",
    "type": "users",
    "attributes": {
      "email": "user9@example.com",
      "full_name": "Bryon Gutkowski"
    }
  }
}</pre>
