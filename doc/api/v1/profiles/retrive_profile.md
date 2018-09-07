# Profiles API

## Retrive Profile

### GET /v1/profile
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODcsInN1YiI6MTYzfQ.S1ejGuAOao-cIYvsSnbaETAG-1UCEtDZcDsdV-SeETs</pre>

#### Route

<pre>GET /v1/profile</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;profile_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/profile&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODcsInN1YiI6MTYzfQ.S1ejGuAOao-cIYvsSnbaETAG-1UCEtDZcDsdV-SeETs&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "163",
    "type": "users",
    "attributes": {
      "email": "user1@example.com",
      "full_name": "Joe Marks II"
    }
  }
}</pre>
