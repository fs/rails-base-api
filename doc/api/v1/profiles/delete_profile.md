# Profiles API

## Delete Profile

### DELETE /v1/profile
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY0MzYzNjEsInN1YiI6N30.vDDbZywBIY6HhAyefIxiUtkyryfH4Cy3oMgQVe4UGxc</pre>

#### Route

<pre>DELETE /v1/profile</pre>

#### Body

<pre>{"data":{"type":"profile-requests","attributes":{"full-name":null,"email":null,"password":null}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;data&quot;:{&quot;type&quot;:&quot;profile-requests&quot;,&quot;attributes&quot;:{&quot;full-name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}&#39; -X DELETE \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY0MzYzNjEsInN1YiI6N30.vDDbZywBIY6HhAyefIxiUtkyryfH4Cy3oMgQVe4UGxc&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "7",
    "type": "users",
    "attributes": {
      "email": "user6@example.com",
      "full-name": "Marshall Pagac"
    }
  }
}</pre>
