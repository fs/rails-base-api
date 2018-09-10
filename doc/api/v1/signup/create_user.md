# SignUp API

## Create User

### POST /v1/sign_ups

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| full_name | full name | false |  |
| email | email | true |  |
| password | password | true |  |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json</pre>

#### Route

<pre>POST /v1/sign_ups</pre>

#### Body

<pre>{"data":{"type":"user-requests","attributes":{"full-name":"Example User","email":"user@example.com","password":"123456"}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/sign_ups&quot; -d &#39;{&quot;data&quot;:{&quot;type&quot;:&quot;user-requests&quot;,&quot;attributes&quot;:{&quot;full-name&quot;:&quot;Example User&quot;,&quot;email&quot;:&quot;user@example.com&quot;,&quot;password&quot;:&quot;123456&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "data": {
    "id": "197",
    "type": "users",
    "attributes": {
      "email": "user@example.com",
      "full-name": null
    }
  }
}</pre>
