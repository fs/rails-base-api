# Profiles API

## Retrive Profile

### GET /v1/profile
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM0fQ.KXLuWGfolqLxJID0sHfTsSB__K-Mg6w8fJZosAO1Ca8</pre>

#### Route

<pre>GET /v1/profile</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/profile&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM0fQ.KXLuWGfolqLxJID0sHfTsSB__K-Mg6w8fJZosAO1Ca8&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "334",
    "type": "users",
    "attributes": {
      "email": "john.smith@example.com",
      "full_name": "John Smith"
    }
  }
}</pre>
