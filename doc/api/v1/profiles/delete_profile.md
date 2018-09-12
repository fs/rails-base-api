# Profiles API

## Delete Profile

### DELETE /v1/profile
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTY2fQ.qgWchRvG9luv0IVp-sl-xfmFaIPtwTKcwttUozDUdcI</pre>

#### Route

<pre>DELETE /v1/profile</pre>

#### Body

<pre>{"data":{"type":"profile_requests","attributes":{"full_name":null,"email":null,"password":null}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{&quot;data&quot;:{&quot;type&quot;:&quot;profile_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}&#39; -X DELETE \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTY2fQ.qgWchRvG9luv0IVp-sl-xfmFaIPtwTKcwttUozDUdcI&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "166",
    "type": "users",
    "attributes": {
      "email": "user4@example.com",
      "full_name": "Dr. Joana Heathcote"
    }
  }
}</pre>
