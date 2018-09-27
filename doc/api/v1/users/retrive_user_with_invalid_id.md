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
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzUyfQ.6muVDVhyVMtYqWrGs0T4wMMQVnCr-lyWCbnCGjDHh8M</pre>

#### Route

<pre>GET /v1/users/0</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users/0&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzUyfQ.6muVDVhyVMtYqWrGs0T4wMMQVnCr-lyWCbnCGjDHh8M&quot;</pre>

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
