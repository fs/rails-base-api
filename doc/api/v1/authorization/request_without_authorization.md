# Authorization API

## Request without authorization

### GET /v1/profile
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json</pre>

#### Route

<pre>GET /v1/profile</pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/profile&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>401 Unauthorized</pre>

#### Body

<pre>{
  "errors": [
    {
      "code": "unauthorized",
      "detail": "Authorization required"
    }
  ]
}</pre>
