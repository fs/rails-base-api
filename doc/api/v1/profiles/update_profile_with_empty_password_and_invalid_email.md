# Profiles API

## Update Profile with empty password and invalid email

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
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjA5NzMsInN1YiI6MTUxfQ.99LIkGZJpmnaRN5QXS-yhKv8LsIGUePOGiES0aU8J1w</pre>

#### Route

<pre>PATCH /v1/profile</pre>

#### Body

<pre>{"data":{"type":"profile_requests","attributes":{"full_name":"Example User Updated","email":"invalid","password":""}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;data&quot;:{&quot;type&quot;:&quot;profile_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:&quot;Example User Updated&quot;,&quot;email&quot;:&quot;invalid&quot;,&quot;password&quot;:&quot;&quot;}}}&#39; -X PATCH \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjA5NzMsInN1YiI6MTUxfQ.99LIkGZJpmnaRN5QXS-yhKv8LsIGUePOGiES0aU8J1w&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": [
    {
      "source": {
        "pointer": "/data/attributes/password"
      },
      "detail": "is too short (minimum is 6 characters)"
    },
    {
      "source": {
        "pointer": "/data/attributes/email"
      },
      "detail": "is invalid"
    }
  ]
}</pre>
