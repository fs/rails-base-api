# Profiles API

## Update Profile

### PATCH /v1/profile

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| full_name | full name | false | user |
| email | email | false | user |
| password | password | false | user |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU2fQ.k8VXoPtmdJNekhOeCpJdF780CoK_GnDOHnSBYAcuwCY</pre>

#### Route

<pre>PATCH /v1/profile</pre>

#### Body

<pre>{"user":{"full_name":"Updated Name","email":"user_updated@example.com","password":"new_password"}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;user&quot;:{&quot;full_name&quot;:&quot;Updated Name&quot;,&quot;email&quot;:&quot;user_updated@example.com&quot;,&quot;password&quot;:&quot;new_password&quot;}}&#39; -X PATCH \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU2fQ.k8VXoPtmdJNekhOeCpJdF780CoK_GnDOHnSBYAcuwCY&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "email": "user_updated@example.com",
  "full_name": "Updated Name"
}</pre>
