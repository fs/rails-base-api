# Registration API

## Create User

### POST /v1/registrations

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| full_name | full name | false | user |
| email | email | true | user |
| password | password | true | user |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json</pre>

#### Route

<pre>POST /v1/registrations</pre>

#### Body

<pre>{"user":{"full_name":"Example User","email":"user@example.com","password":"123456"}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/registrations&quot; -d &#39;{&quot;user&quot;:{&quot;full_name&quot;:&quot;Example User&quot;,&quot;email&quot;:&quot;user@example.com&quot;,&quot;password&quot;:&quot;123456&quot;}}&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "email": "user@example.com",
  "full_name": "Example User"
}</pre>
