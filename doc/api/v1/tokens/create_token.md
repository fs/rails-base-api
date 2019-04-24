# Tokens API

## Create Token

### POST /v1/tokens

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| email | email | true | authorization |
| password | password | true | authorization |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json</pre>

#### Route

<pre>POST /v1/tokens</pre>

#### Body

<pre>{"authorization":{"email":"user@example.com","password":"123456"}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/tokens&quot; -d &#39;{&quot;authorization&quot;:{&quot;email&quot;:&quot;user@example.com&quot;,&quot;password&quot;:&quot;123456&quot;}}&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Lang: en&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTYxNzQ5OTUsInN1YiI6NDYwfQ.PZzRa9g2CWaZ0iiuPwLvYOWu10jP6O6k4VpEFsmWeyQ"
}</pre>
