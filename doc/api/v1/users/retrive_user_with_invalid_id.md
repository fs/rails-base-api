# Users API

## Retrive User with invalid id

### GET /v1/users/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | user id | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTc2fQ.SM3fZ97H8I_cvj-xHR18FmfdvXYK_XMtObYmAs4k1lQ</pre>

#### Route

<pre>GET /v1/users/0</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users/0&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTc2fQ.SM3fZ97H8I_cvj-xHR18FmfdvXYK_XMtObYmAs4k1lQ&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>404 Not Found</pre>

#### Body

<pre>{
  "errors": [
    {
      "code": "record_not_found",
      "detail": "Record not found"
    }
  ]
}</pre>
