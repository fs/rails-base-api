# Profiles API

## Delete Profile

### DELETE /v1/profile
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU4fQ.adN0-IrtbMvSfsXqpDNaV-Zyxhsq790N2DmXmKVgpEA</pre>

#### Route

<pre>DELETE /v1/profile</pre>

#### Body

<pre>{}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/profile&quot; -d &#39;{}&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDU4fQ.adN0-IrtbMvSfsXqpDNaV-Zyxhsq790N2DmXmKVgpEA&quot;</pre>

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
