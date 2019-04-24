# Users API

## Retrive User with invalid id

### GET /v1/users/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | user id | true |  |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDczfQ.oWGIi9mA7U7EGKIVVJWsnwPLk9yxrwvN5mfgH0hX-fE</pre>

#### Route

<pre>GET /v1/users/0</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users/0&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDczfQ.oWGIi9mA7U7EGKIVVJWsnwPLk9yxrwvN5mfgH0hX-fE&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>404 Not Found</pre>

#### Body

<pre>{
  "error": "not_found"
}</pre>
