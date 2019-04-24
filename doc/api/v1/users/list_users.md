# Users API

## List Users

### GET /v1/users
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDYyfQ.wwwQcTXLxC20x4_G6vwP_PIwb8zQCBdx4FEIRg7AYA0</pre>

#### Route

<pre>GET /v1/users</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDYyfQ.wwwQcTXLxC20x4_G6vwP_PIwb8zQCBdx4FEIRg7AYA0&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "email": "john.smith@example.com",
    "full_name": "John Smith"
  },
  {
    "email": "michael.jordan@example.com",
    "full_name": "Michael Jordan"
  },
  {
    "email": "brad.pitt@example.com",
    "full_name": "Brad Pitt"
  },
  {
    "email": "steve.jobs@example.com",
    "full_name": "Steve Jobs"
  }
]</pre>
