# Profiles API

## Retrive Profile

### GET /v1/profile
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU1fQ.itzIbr6ccBvbXUUDMXXODva6b0BujQSxj2K63mfiDj8</pre>

#### Route

<pre>GET /v1/profile</pre>

#### Query Parameters

<pre>{}: </pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/profile&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU1fQ.itzIbr6ccBvbXUUDMXXODva6b0BujQSxj2K63mfiDj8&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "email": "john.smith@example.com",
  "full_name": "John Smith"
}</pre>
