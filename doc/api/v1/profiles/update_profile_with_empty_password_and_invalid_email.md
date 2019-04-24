# Profiles API

## Update Profile with empty password and invalid email

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
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU3fQ.348JfqsGBxTwf9OFXnJAKiBQt5dvjAm2PabpiUDCzeo</pre>

#### Route

<pre>PATCH /v1/profile</pre>

#### Body

<pre>{"user":{"full_name":"Updated Name","email":"invalid","password":""}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;user&quot;:{&quot;full_name&quot;:&quot;Updated Name&quot;,&quot;email&quot;:&quot;invalid&quot;,&quot;password&quot;:&quot;&quot;}}&#39; -X PATCH \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU3fQ.348JfqsGBxTwf9OFXnJAKiBQt5dvjAm2PabpiUDCzeo&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": {
    "password": [
      "is too short (minimum is 6 characters)"
    ],
    "email": [
      "is invalid"
    ]
  }
}</pre>
