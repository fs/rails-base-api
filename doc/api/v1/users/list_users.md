# Users API

## List Users

### GET /v1/users
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzQxfQ.UAxwLgNxG7xMZJrAG9LJpVG9vXEFJf1-3S4jstLtDHk</pre>

#### Route

<pre>GET /v1/users</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzQxfQ.UAxwLgNxG7xMZJrAG9LJpVG9vXEFJf1-3S4jstLtDHk&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "341",
      "type": "users",
      "attributes": {
        "email": "john.smith@example.com",
        "full_name": "John Smith"
      }
    },
    {
      "id": "342",
      "type": "users",
      "attributes": {
        "email": "michael.jordan@example.com",
        "full_name": "Michael Jordan"
      }
    },
    {
      "id": "343",
      "type": "users",
      "attributes": {
        "email": "brad.pitt@example.com",
        "full_name": "Brad Pitt"
      }
    },
    {
      "id": "344",
      "type": "users",
      "attributes": {
        "email": "steve.jobs@example.com",
        "full_name": "Steve Jobs"
      }
    }
  ]
}</pre>
