# Rails API Format

## Errors

```js
// 404 Not Found
{
  "error": {
    "status": 404,
    "error": "Not Found."
  }
}

// 422 Unprocessable Entity
{
  "error": {
    "status": 422,
    "error": "Unprocessable Entity",
    "validations": {
      "first_name": ["can't be blank"]
    }
  }
}

// 401 Unauthorized
{
  "error": {
    "status": 401,
    "message": "Unauthorized"
  }
}
```
