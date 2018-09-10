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
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY2Njg4MjMsInN1YiI6MjA2fQ.GYofTAg3S6-1fdkDd9w2OnGw3OhGh5zuTSDw5JMtkPc</pre>

#### Route

<pre>GET /v1/users/205</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user-requests&quot;,&quot;attributes&quot;:{&quot;full-name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users/205&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY2Njg4MjMsInN1YiI6MjA2fQ.GYofTAg3S6-1fdkDd9w2OnGw3OhGh5zuTSDw5JMtkPc&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "205",
    "type": "users",
    "attributes": {
      "email": "user11@example.com",
      "full-name": "Marnie Nicolas"
    }
  }
}</pre>
