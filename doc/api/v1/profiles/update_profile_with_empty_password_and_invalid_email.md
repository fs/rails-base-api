# Profiles API

## Update Profile with empty password and invalid email

### PATCH /v1/profile

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| full_name | full name | false | data[attributes] |
| email | email | false | data[attributes] |
| password | password | false | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM2fQ.AyXUoKLR8wF8zTvflSC1r_hWtUy3EhpbzaxA095JhPs</pre>

#### Route

<pre>PATCH /v1/profile</pre>

#### Body

<pre>{"data":{"attributes":{"full_name":"Updated Name","email":"invalid","password":""}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;data&quot;:{&quot;attributes&quot;:{&quot;full_name&quot;:&quot;Updated Name&quot;,&quot;email&quot;:&quot;invalid&quot;,&quot;password&quot;:&quot;&quot;}}}&#39; -X PATCH \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM2fQ.AyXUoKLR8wF8zTvflSC1r_hWtUy3EhpbzaxA095JhPs&quot;</pre>

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
