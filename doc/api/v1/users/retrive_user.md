# Users API

## Retrive User

### GET /v1/users/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | user id | true |  |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDcxfQ.la0OUmxuSq16QkRimCcJENc_teiTIf9Gy957M_DhqPE</pre>

#### Route

<pre>GET /v1/users/470</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users/470&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDcxfQ.la0OUmxuSq16QkRimCcJENc_teiTIf9Gy957M_DhqPE&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "email": "john.smith@example.com",
  "full_name": "John Smith"
}</pre>
