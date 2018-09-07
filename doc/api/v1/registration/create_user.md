# Registration API

## Create User

### POST /v1/registrations

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

<pre>POST /v1/registrations</pre>

#### Body

<pre>{"data":{"type":"registration_requests","attributes":{"full_name":"Example User","email":"user@example.com","password":"123456"}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/registrations&quot; -d &#39;{&quot;data&quot;:{&quot;type&quot;:&quot;registration_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:&quot;Example User&quot;,&quot;email&quot;:&quot;user@example.com&quot;,&quot;password&quot;:&quot;123456&quot;}}}&#39; -X POST \
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
    "id": "167",
    "type": "users",
    "attributes": {
      "email": "user@example.com",
      "full_name": "Example User"
    }
  }
}</pre>
