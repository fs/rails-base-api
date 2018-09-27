# Tokens API

## Create Token

### POST /v1/tokens

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| email | email | true | data[attributes] |
| password | password | true | data[attributes] |

### Request

#### Headers

<pre>Content-Type: application/vnd.api+json
Accept: application/vnd.api+json</pre>

#### Route

<pre>POST /v1/tokens</pre>

#### Body

<pre>{"data":{"attributes":{"email":"user@example.com","password":"123456"}}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/tokens&quot; -d &#39;{&quot;data&quot;:{&quot;attributes&quot;:{&quot;email&quot;:&quot;user@example.com&quot;,&quot;password&quot;:&quot;123456&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/vnd.api+json&quot; \
	-H &quot;Accept: application/vnd.api+json&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/vnd.api+json; charset=utf-8</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "data": {
    "id": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM5fQ.JcMnxgvF9ysWq7nUpnoDHS4GhCCkTxiERPr6JQQGsHA",
    "type": "jwt_tokens",
    "attributes": {
      "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MzgxMjk4MDMsInN1YiI6MzM5fQ.JcMnxgvF9ysWq7nUpnoDHS4GhCCkTxiERPr6JQQGsHA"
    }
  }
}</pre>
