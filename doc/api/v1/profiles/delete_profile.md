# Profiles API

## Delete Profile

### DELETE /v1/profile
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM3fQ.mtEM7fCTtzOE4U8ga4EJlDR-1h8Wul-0pwP1qULyn78</pre>

#### Route

<pre>DELETE /v1/profile</pre>

#### Body

<pre>{}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{}&#39; -X DELETE \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM3fQ.mtEM7fCTtzOE4U8ga4EJlDR-1h8Wul-0pwP1qULyn78&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "337",
    "type": "users",
    "attributes": {
      "email": "john.smith@example.com",
      "full_name": "John Smith"
    }
  }
}</pre>
