# Profiles API

## Update Profile

### PATCH /v1/profile

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| full_name | full name | false |  |
| email | email | false |  |
| password | password | false |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY2Njg4MjIsInN1YiI6MTkxfQ.SuNP-3dS6rgTJLoL8ywQoLZoKyNJ8ot4A4BXZpTF-Ek</pre>

#### Route

<pre>PATCH /v1/profile</pre>

#### Body

<pre>{"data":{"type":"profile-requests","attributes":{"full-name":"Example User Updated","email":"user_updated@example.com","password":"new_password"}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;data&quot;:{&quot;type&quot;:&quot;profile-requests&quot;,&quot;attributes&quot;:{&quot;full-name&quot;:&quot;Example User Updated&quot;,&quot;email&quot;:&quot;user_updated@example.com&quot;,&quot;password&quot;:&quot;new_password&quot;}}}&#39; -X PATCH \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY2Njg4MjIsInN1YiI6MTkxfQ.SuNP-3dS6rgTJLoL8ywQoLZoKyNJ8ot4A4BXZpTF-Ek&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "191",
    "type": "users",
    "attributes": {
      "email": "user_updated@example.com",
      "full-name": "Zachery Gottlieb Jr."
    }
  }
}</pre>
