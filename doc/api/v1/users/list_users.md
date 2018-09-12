# Users API

## List Users

### GET /v1/users
### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTczfQ.Abxi19K-az8G3cuhq_ti18PBbtKAc_f3RUJuHVlXc1Q</pre>

#### Route

<pre>GET /v1/users</pre>

#### Query Parameters

<pre>{&quot;data&quot;:{&quot;type&quot;:&quot;user_requests&quot;,&quot;attributes&quot;:{&quot;full_name&quot;:null,&quot;email&quot;:null,&quot;password&quot;:null}}}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzY3NjExODgsInN1YiI6MTczfQ.Abxi19K-az8G3cuhq_ti18PBbtKAc_f3RUJuHVlXc1Q&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": [
    {
      "id": "170",
      "type": "users",
      "attributes": {
        "email": "user5@example.com",
        "full_name": "Danial Gibson"
      }
    },
    {
      "id": "171",
      "type": "users",
      "attributes": {
        "email": "user6@example.com",
        "full_name": "Yukiko Ledner"
      }
    },
    {
      "id": "172",
      "type": "users",
      "attributes": {
        "email": "user7@example.com",
        "full_name": "Elois Kiehn"
      }
    },
    {
      "id": "173",
      "type": "users",
      "attributes": {
        "email": "user8@example.com",
        "full_name": "Mr. Kelly Connelly"
      }
    }
  ]
}</pre>
